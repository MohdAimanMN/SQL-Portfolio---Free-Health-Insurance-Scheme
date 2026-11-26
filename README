# Annual Eligibility Processing — Social Health Protection Scheme (SQL Server)

> **Portfolio project.** This repository demonstrates how I design large-scale eligibility processing in T-SQL. All table names, figures and sample records are **synthetic or rounded for illustration**. No real member data, production object names or operational counts are included.

## Overview

Free social health protection schemes (insurance/takaful coverage funded for lower-income citizens) need an accurate eligible-member list every year. That list drives policy issuance, member communications and claims validation, so errors flow directly into downstream front-end and back-end systems.

This project shows the end-to-end SQL logic for one annual eligibility cycle:

1. **Integrate** applicant data delivered in several batches during the year
2. **Determine eligibility** using age, household and status rules
3. **Clean** the data: deduplicate, validate and exclude ineligible records
4. **Publish** a single authoritative eligible-member table for the new coverage year

## Processing Funnel (illustrative)

| Stage | Rows (approx.) | What happens |
|---|---|---|
| Raw input (4 batches) | 14.0M | Batches A–D loaded; the same person can appear in several batches |
| After deduplication | 10.0M | One row per national ID, keeping the most recent, most complete record |
| After eligibility rules | 9.9M | Age and household-category rules applied |
| After exclusions | 9.9M | Sanctions screening, citizenship check, claims negative list |
| **Final eligible list** | **~9.9M** | Split into **returning** vs **new** members against prior-year lists |

Every stage writes a row count to a control table, so the funnel reconciles from input to output.

## Eligibility Rules

**Single / no spouse**
- Standard applicants: age 22–66
- Applicants with disability: age 19–66
- Senior citizens with no next of kin

**Household**
- Applicant only
- Applicant + citizen spouse
- Applicant + non-citizen spouse (applicant covered only)
- Spouse-only records

**Special cases**
- Single parent with no dependent children
- Senior citizens

## Data Quality Controls

| Control | Approach |
|---|---|
| Deduplication | `ROW_NUMBER()` partitioned by national ID, ordered by batch recency and field completeness |
| Age validation | Age derived two ways (from the national ID and from the date of birth); records where they differ by more than 1 year are flagged for review, not silently dropped |
| Sanctions screening | Anti-join against a sanctions reference list |
| Citizenship check | Anti-join against a non-citizen reference list |
| Claims negative list | Anti-join against members barred because of prior claims history |
| Missing addresses | Filled with standard sentinel values so the legacy core system (IBM AS400) accepts the record, and flagged `AddressStatus = 'DEFAULTED'` so they can be tracked and corrected later (see technique 5) |
| Name corrections | Applied from a reference source and logged in an audit table |

## Key Techniques

### 1. Deduplication with ROW_NUMBER

```sql
WITH Ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY NationalID
               ORDER BY BatchSeq DESC,          -- latest batch wins
                        CompletenessScore DESC  -- then most complete record
           ) AS rn
    FROM #AllBatches
)
SELECT *
INTO   #Deduped
FROM   Ranked
WHERE  rn = 1;
```

### 2. Dual age calculation with a cross-check

```sql
SELECT  d.*,
        @CoverageYear - (CASE WHEN CAST(LEFT(NationalID, 2) AS INT) > @CoverageYear % 100
                              THEN 1900 ELSE 2000 END
                         + CAST(LEFT(NationalID, 2) AS INT))   AS Age_FromID,
        @CoverageYear - YEAR(DateOfBirth)                      AS Age_FromDOB
INTO    #WithAge
FROM    #Deduped AS d;

-- Flag inconsistent records for review
UPDATE #WithAge
SET    AgeCheckFlag = 'MISMATCH'
WHERE  ABS(Age_FromID - Age_FromDOB) > 1;
```

### 3. Exclusions with anti-joins

```sql
SELECT  w.*
INTO    #Eligible
FROM    #WithAge AS w
WHERE   NOT EXISTS (SELECT 1 FROM ref.SanctionsList   s WHERE s.NationalID = w.NationalID)
  AND   NOT EXISTS (SELECT 1 FROM ref.NonCitizenList  n WHERE n.NationalID = w.NationalID)
  AND   NOT EXISTS (SELECT 1 FROM ref.ClaimsNegative  c WHERE c.NationalID = w.NationalID);
```

### 4. Address splitting without UDFs

Long free-text addresses are split into three lines of at most 30 characters using `CROSS APPLY`, keeping the logic set-based and fast on ~10M rows.

```sql
SELECT  e.NationalID,
        a1.Line1, a2.Line2, a3.Line3
FROM    #Eligible AS e
CROSS APPLY (SELECT LEFT(e.FullAddress, 30)                      AS Line1) AS a1
CROSS APPLY (SELECT SUBSTRING(e.FullAddress, 31, 30)             AS Line2) AS a2
CROSS APPLY (SELECT SUBSTRING(e.FullAddress, 61, 30)             AS Line3) AS a3;
```

### 5. Default values for a legacy system's mandatory fields

The downstream core takaful system runs on IBM AS400 and rejects any create or update where mandatory address fields (at minimum `AddressLine1`) are blank. Dropping these members was not an option, because they are still eligible for coverage. Records with an empty address therefore get fixed, recognisable sentinel values and a flag. That way, policies can still be issued, and the defaulted records remain easy to find for later correction.

```sql
UPDATE #Eligible
SET    AddressLine1  = 'AddressLine1',   -- sentinel: required by core system
       City          = 'City',
       State         = 'State',
       Postcode      = '10000',
       AddressStatus = 'DEFAULTED'
WHERE  NULLIF(LTRIM(RTRIM(AddressLine1)), '') IS NULL;
```

Using obvious sentinel text rather than a plausible-looking address keeps defaulted records from being mistaken for real ones in reports or mailings.

### 6. New vs returning members

```sql
SELECT  e.*,
        CASE WHEN p.NationalID IS NULL THEN 'NEW' ELSE 'RETURNING' END AS MemberType
FROM    #Eligible AS e
LEFT JOIN hist.EligiblePriorYear AS p
       ON p.NationalID = e.NationalID;
```

## Output Table

`dbo.EligibleMembers_<CoverageYear>`

| Column | Type | Notes |
|---|---|---|
| NationalID | VARCHAR(12) | Primary key |
| FullName | NVARCHAR(150) | |
| DateOfBirth | DATE | |
| Gender | CHAR(1) | 1 = Male, 2 = Female |
| AddressLine1–3 | NVARCHAR(30) | Split from free-text address |
| Postcode, City, State | NVARCHAR | |
| MobileNumber, Email | NVARCHAR | Contact fields |
| BankCode | CHAR(2) | Mapped from bank name |
| BankAccountNo | VARCHAR | **Masked** in any non-production copy |
| MaritalStatus | CHAR(1) | |
| DisabilityFlag | CHAR(1) | Y / N |
| Age_FromID, Age_FromDOB | INT | Both kept for audit |
| AgeCheckFlag | VARCHAR(10) | `MISMATCH` where applicable |
| AddressStatus | VARCHAR(12) | `COMPLETE` / `DEFAULTED` (sentinel values applied) |
| MemberType | VARCHAR(10) | `NEW` / `RETURNING` |
| SourceBatch | VARCHAR(10) | Lineage back to the input batch |

## Performance Notes

- Runs in roughly 30–45 minutes on ~14M input rows (SQL Server 2016+)
- Session-scoped `#temp` tables for each stage, so intermediate results can be inspected
- Clustered index on `NationalID` before the joins and anti-joins
- Fully set-based: no cursors and no scalar UDFs

## Repository Structure

```
├── README.md
├── eligibility_processing.sql      -- main script (sanitised)
└── sample_data/
    └── synthetic_members.csv       -- fake records for running the script
```

## What This Project Demonstrates

- Designing multi-stage ETL logic in pure T-SQL at the 10M+ row scale
- Building in data quality, reconciliation and audit trails rather than bolting them on
- Translating business and regulatory eligibility rules into maintainable SQL
- Shaping output to fit legacy core-system constraints (IBM AS400 mandatory fields) without losing eligible members
- Handling sensitive personal data responsibly (masking, synthetic samples, no real identifiers)

## Author

**Aiman MN** — [LinkedIn](https://linkedin.com/in/aimanmn) · [GitHub](https://github.com/MohdAimanMN)

## License

MIT

## Disclaimer

This is an independent portfolio project, not official documentation of any government programme, insurer or system. All data, object names and figures are synthetic or illustrative.
