# 2026 Scheme Eligibility Processing

## Overview

This repository contains the SQL processing logic for determining and consolidating eligible members for **The Scheme 2026** eligibility cycle. The script processes data from four operational phases (P1-P4) of 2025, applies eligibility criteria, and generates the final eligible member listing.

**The Scheme 2026** in this documentation refers to a free social protection initiative designed to provide financial assistance and healthcare benefits to eligible Malaysian citizens, in the form of Insurance/ Takaful coverage. This project illustrates the technical implementation of eligibility processing for such programs.

## Purpose

The solution handles:
- **Data Integration**: Consolidates member data from multiple source tables across four phases
- **Eligibility Determination**: Applies age-based and status-based eligibility criteria
- **Data Quality**: Removes duplicates, sanctioned persons, and negative-listed claims
- **Final Compilation**: Produces the authoritative 2026 eligible member registry

## Key Features

### Processing Phases

| Phase | Source | Record Count | Category |
|-------|--------|--------------|----------|
| **P1** | Y2025_P1 | ~3.3M | Initial Data Batch |
| **P2** | Y2025_P2 | ~3.6M | Second Data Batch |
| **P3** | Y2025_P3 | ~3.4M | Third Data Batch |
| **P4** | Y2025_P4 | ~3.5M | Fourth Data Batch |

### Eligibility Categories

The script processes the following member categories:

1. **Single/No Spouse**: 
   - Standard: Age 22-66
   - With Disability: Age 19-66
   - Senior Citizens (No Kin)

2. **Household Category**:
   - Applicant only
   - Applicant + Malaysian Citizen Spouse
   - Applicant + Non-Malaysian Citizen Spouse
   - Spouse-only records

3. **Special Cases**:
   -  Single Parent No Children
   - Senior Citizens

### Age Calculation Methods

The script uses dual age calculation approaches:

-- Method 1: From NRIC (Malaysian ID)
ANB_FromNRIC = 2026 - [Birth Year extracted from NRIC positions 1-2]

-- Method 2: From Date of Birth field
ANB_FromDateofBirth = 2026 - [Birth Year from DateofBirth]


Validation: Records are flagged if both methods differ by >1 year.

## Data Quality Controls

### Exclusions Applied

- Duplicates: Removed via NRIC deduplication (25,281 records removed)
- Sanctioned Persons: Excluded per sanctions list (12 records)
- Non-Malaysian Citizens: Removed via NonMalaysianV6 list (903 records)
- Claims Negative List: Excluded per claims history (221 records)

### Final Output Statistics

| Metric | Count |
|--------|-------|
| Total Processed | 38,775,342 |
| After Deduplication | 10,058,652 |
| After Quality Controls | 10,057,516 |
| New to Scheme (2026) | 137,385 |
| Returning Members | 9,920,131 |

## Output Table

**Table Name**: `[SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]`

### Columns

| Column | Type | Purpose |
|--------|------|---------|
| NRIC | String | Primary Key - Malaysian ID Number |
| FullName | String | Member Name |
| DateofBirth | Date | Birth Date |
| Gender | Char(1) | 1=Male, 2=Female |
| AddressLine1-3 | String | Residential Address |
| Postcode | String | Postal Code |
| City | String | City Name |
| State | String | State Name |
| MobileNumber | String | Contact Number |
| EmailAddress | String | Email Contact |
| BankName | Char(2) | Bank Code (01-29) |
| BankAccountNumber | String | Account Number |
| MaritalStatus | Char(1) | 1=Married, 3=Single |
| Indicator_DisabilityStatus_ | Char(1) | Y/N Disability Flag |
| ANB_FromNRIC | Int | Age calculated from NRIC |
| ANB_FromDateofBirth | Int | Age calculated from DOB |
| SourceFile | String | Source data identifier |

## Usage

### Prerequisites

- SQL Server 2016 or later
- Access to source tables: Y2025_P1_TYPE_*, Y2025_P2_TYPE_*, etc.
- Reference tables: NonMalaysianV6, Sanctioned Persons list, Claims Negative List

### Execution Steps

1. **Prepare Source Data**

<img width="697" height="135" alt="image" src="https://github.com/user-attachments/assets/0bc19356-5a8b-4376-ae75-51fc00eeb31b" />


2. **Run Processing Script**

<img width="697" height="133" alt="image" src="https://github.com/user-attachments/assets/97a6e62a-bd94-411d-849f-ef7a8dc05ece" />


3. **Validate Output**

<img width="704" height="153" alt="image" src="https://github.com/user-attachments/assets/9bd2a9fd-07ea-4473-99e2-9946f313037c" />


4. **Data Quality Checks**

<img width="704" height="153" alt="image" src="https://github.com/user-attachments/assets/f8e13cd7-2681-4dd4-8450-dcf18f49f3b4" />




## Technical Notes
### Address Splitting Algorithm
The script uses a CROSS APPLY string-splitting technique to break long addresses into 3 lines (max 30 characters each):

<img width="704" height="153" alt="image" src="https://github.com/user-attachments/assets/51190cf2-235c-4784-957d-931306030f0b" />

This avoids UDFs for better performance on large datasets.

### Bank Code Mapping
Malaysian bank codes (01-29) are mapped from full bank names:
      01 = AFFIN BANK
      07 = CIMB BANK
      10 = MAYBANK
      11 = PUBLIC BANK
      (See mapping in script for complete list)

### Known Issues & Resolutions
1. Address Blanks (9,872 records)
    - Resolved by updating with default values
    - AddressLine1 → "AddressLine1"
    - City, State → "City", "State"
    - Postcode → "10000"

2. Name Corrections (6 records)
    - Manual corrections applied for misspelled names
    - Updated using reference data from alternate sources

3. Age Discrepancies (10,313 records)
    - Records flagged where DOB age differs from NRIC age
    - Investigated and retained (likely due to ID number validity)

## Schema
### Related Tables
  - **Input**: Y2025_P1_TYPE_1 through Y2025_P4_TYPE_7
  - **Reference**: NonMalaysianV6, Sanctioned Persons Registry, Claims Negative List
  - **Historical**: Eligible_2019 through Eligible_2025
  - **Output**: Eligible_2026_V1_10057516


## Performance Considerations
  - **Execution Time**: ~30-45 minutes
  - **Temporary Tables**: Uses # prefix for session-scoped tables
  - **Index Strategy**: NRIC primary key recommended for lookups
  - **Data Volume**: ~10M rows in final output

## File Structure

    2026_SchemeEliigiblity_Redact.sql
    ├── Phase 1 (P1) Processing
    ├── Phase 2 (P2) Processing
    ├── Phase 3 (P3) Processing
    ├── Phase 4 (P4) Processing
    ├── Data Quality & Deduplication
    ├── Exclusions & Filtering
    └── Final Output Generation

## Contact & Support
Author: Aiman MN

For questions, issues, or contributions, please contact the repository maintainer.

## License
[Specify your license - e.g., MIT, Apache 2.0, Proprietary]

## Version History
  |Version|Date|Notes|
  |1.0|2026-01-16|Initial 2026 eligibility processing|


## Disclaimer

⚠️ CONFIDENTIALITY NOTICE: This script contains references to sensitive member data and eligibility criteria. Some details have been redacted for OPSEC (Operations Security).

**PURPOSE**: This repository is created to demonstrate SQL expertise and data processing capabilities. The code showcases real-world applications of advanced SQL techniques in eligibility determination, data quality management, and large-scale data transformation within a social protection program context.

**DATA AND CONFIDENTIALITY**: This repository contains anonymized and redacted code references. Sensitive details related to program operations, member data, eligibility criteria, and business logic have been redacted for operational security (OPSEC) purposes. The code is provided as a portfolio piece to illustrate technical proficiency and problem-solving approaches in data engineering.

**NOT OFFICIAL DOCUMENTATION**: This is not official documentation of any government program or system. It is a standalone demonstration of SQL capabilities and data processing methodologies. Any resemblance to actual programs, systems, or operations is for illustrative purposes only.

**USAGE RESTRICTIONS**: This code and documentation are provided for educational and portfolio demonstration purposes. Unauthorized commercial use, redistribution, or application in production systems without explicit authorization is prohibited.

Last Updated: 2026-02-22


