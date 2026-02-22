

  /*
This file is to record the processing of 2026 Eligible members. Processing is done from Y2025 data, divided into 4, namely:

    /*
  REDACTED FOR OPSEC
  */
*/


/*
A) Y2025_P1 
   /*
  REDACTED FOR OPSEC
  */
 */


	/****** Y2025_P1 Processing ******/
/*
Category|CountOfRecord
	Single|3239473

NRICPoliceMilitaryIDNumber|FullName|Tkh_lahir|Gender|Category|Spouse_NRICNumber|Spouse_FullName|Spouse_DateofBirth|Spouse_Gender|Spouse_Citizenship|Applicant_DisabilityStatus|Spouse_DisabilityStatus|Applicant_BankName|Applicant_BankAccountNumber|FullName_Bank_Spouse|Spouse_BankAccountNumber|Address|MobileNumber_Applicant|MobileNumber_Spouse

*/

 SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P1_SingleNoSpouse
  FROM Y2025_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Category = 'Single'
  --#Y2025_P1_SingleNoSpouse: 3,239,473 


   SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17),--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_SingleNoSpouse_OKU
  FROM Y2025_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Applicant_DisabilityStatus ='Y' AND Category = 'Single'
  --#Y2025_P1_SingleNoSpouse_OKU: 175,264 



/*


	Senior Citizen No Kin|374976

NRICPoliceMilitaryIDNumber|FullName|Tkh_lahir|Gender|Category|Spouse_NRICNumber|Spouse_FullName|Spouse_DateofBirth|Spouse_Gender|Spouse_Citizenship|Applicant_DisabilityStatus|Spouse_DisabilityStatus|Applicant_BankName|Applicant_BankAccountNumber|FullName_Bank_Spouse|Spouse_BankAccountNumber|Address|MobileNumber_Applicant|MobileNumber_Spouse

*/
	
			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_NoKinNoSpouse
  FROM Y2025_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Category = 'Senior Citizen No Kin'
  --#Y2025_P1_NoKinNoSpouse: 374,976  

  
			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_NoKinNoSpouse_OKU
  FROM Y2025_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Category = 'Senior Citizen No Kin' AND Applicant_DisabilityStatus ='Y'
  --#TEMP_NoKinNoSpouse_OKU: 32,939 


/*
	Household Category|3357471
		SELECT * FROM Y2025_P1_TYPE_1 WHERE Category = 'Household Category' 	
*/			

			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_Household_AllApplicant
  FROM Y2025_P1_TYPE_1
 WHERE Category = 'Household Category' AND NRICPoliceMilitaryIDNumber !=''
  --##Y2025_P1_Household_AllApplicant : 3,155,363

			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_Household_Applicant_with_NoSpouse
  FROM Y2025_P1_TYPE_1
 WHERE Category = 'Household Category' and Spouse_NRICNumber = ''
  --#Y2025_P1_Household_Applicant_with_NoSpouse : 591,785 591785
			
			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_Household_Applicant_with_Spouse
  FROM Y2025_P1_TYPE_1
 where NRICPoliceMilitaryIDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen' AND Category = 'Household Category' 
  --#Y2025_P1_Household_Applicant_with_Spouse : 2,535,696 

  			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							Tkh_lahir AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) = '01' AND SUBSTRING(Tkh_lahir,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1 + 1
							   WHEN SUBSTRING(Tkh_lahir,3,2) > '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Tkh_lahir,3,2))*1
							   WHEN SUBSTRING(Tkh_lahir,3,2) < '25' AND SUBSTRING(Tkh_lahir,6,2) >= '01' AND SUBSTRING(Tkh_lahir,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Tkh_lahir,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_Household_Applicant_with_SpouseNonMalaysian
  FROM Y2025_P1_TYPE_1
 where NRICPoliceMilitaryIDNumber !='' AND  Spouse_Citizenship = 'Permanent Resident' or Spouse_Citizenship = 'NonCitizen and Non Permanent Resident' AND Category = 'Household Category' 
  --#Y2025_P1_Household_Applicant_with_SpouseNonMalaysian : 27,882  


			SELECT Spouse_NRICNumber AS NRIC,--(1)
							Spouse_FullName AS FullName, 	--(2)							
							Spouse_DateofBirth AS DateofBirth,--(3)
							CASE 
								WHEN Spouse_Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Spouse AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN FullName_Bank_Spouse = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN FullName_Bank_Spouse = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN FullName_Bank_Spouse = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN FullName_Bank_Spouse = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN FullName_Bank_Spouse = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN FullName_Bank_Spouse = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN FullName_Bank_Spouse = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN FullName_Bank_Spouse = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN FullName_Bank_Spouse = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN FullName_Bank_Spouse = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN FullName_Bank_Spouse = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN FullName_Bank_Spouse = 'CITIBANK BERHAD' THEN  '13'
								WHEN FullName_Bank_Spouse = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN FullName_Bank_Spouse = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN FullName_Bank_Spouse = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN FullName_Bank_Spouse = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN FullName_Bank_Spouse = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN FullName_Bank_Spouse = 'AGRO BANK BERHAD' THEN  '22'
								WHEN FullName_Bank_Spouse = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN FullName_Bank_Spouse = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN FullName_Bank_Spouse = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN FullName_Bank_Spouse = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN FullName_Bank_Spouse = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Spouse_BankAccountNumber AS BankAccountNumber,--(14) FullName_Bank_Spouse|Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Spouse_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_NRICNumber, 3, 2) = '01' AND substring (Spouse_NRICNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Spouse_DateofBirth,3,2) > '25' AND SUBSTRING(Spouse_DateofBirth,6,2) = '01' AND SUBSTRING(Spouse_DateofBirth,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DateofBirth,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DateofBirth,3,2) < '25' AND SUBSTRING(Spouse_DateofBirth,6,2) = '01' AND SUBSTRING(Spouse_DateofBirth,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DateofBirth,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DateofBirth,3,2) > '25' AND SUBSTRING(Spouse_DateofBirth,6,2) >= '01' AND SUBSTRING(Spouse_DateofBirth,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DateofBirth,3,2))*1
							   WHEN SUBSTRING(Spouse_DateofBirth,3,2) < '25' AND SUBSTRING(Spouse_DateofBirth,6,2) >= '01' AND SUBSTRING(Spouse_DateofBirth,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DateofBirth,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_Household_Spouse_with_Applicant 
  FROM Y2025_P1_TYPE_1
  where NRICPoliceMilitaryIDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen' AND Category = 'Household Category' 
  --#Y2025_P1_Household_Spouse_with_Applicant : 2,535,696 


			SELECT Spouse_NRICNumber AS NRIC,--(1)
							Spouse_FullName AS FullName, 	--(2)							
							Spouse_DateofBirth AS DateofBirth,--(3)
							CASE 
								WHEN Spouse_Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							Address AS AddressLine1,--(5)
							'' AS AddressLine2,--(6)
							'' AS AddressLine3,--(7)
							'' AS Postcode,--(8)
							'' AS City,--(9)
							'' AS State,--(10)
							MobileNumber_Spouse AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN FullName_Bank_Spouse = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN FullName_Bank_Spouse = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN FullName_Bank_Spouse = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN FullName_Bank_Spouse = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN FullName_Bank_Spouse = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN FullName_Bank_Spouse = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN FullName_Bank_Spouse = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN FullName_Bank_Spouse = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN FullName_Bank_Spouse = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN FullName_Bank_Spouse = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN FullName_Bank_Spouse = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN FullName_Bank_Spouse = 'CITIBANK BERHAD' THEN  '13'
								WHEN FullName_Bank_Spouse = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN FullName_Bank_Spouse = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN FullName_Bank_Spouse = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN FullName_Bank_Spouse = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN FullName_Bank_Spouse = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN FullName_Bank_Spouse = 'AGRO BANK BERHAD' THEN  '22'
								WHEN FullName_Bank_Spouse = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN FullName_Bank_Spouse = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN FullName_Bank_Spouse = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN FullName_Bank_Spouse = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN FullName_Bank_Spouse = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							Spouse_BankAccountNumber AS BankAccountNumber,--(14) FullName_Bank_Spouse|Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'DATA The Scheme TERKINI AFTER RAYA V1' AS SourceFile,--(16)
							CASE 
								WHEN Spouse_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_NRICNumber, 3, 2) = '01' AND substring (Spouse_NRICNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Spouse_DateofBirth,3,2) > '25' AND SUBSTRING(Spouse_DateofBirth,6,2) = '01' AND SUBSTRING(Spouse_DateofBirth,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DateofBirth,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DateofBirth,3,2) < '25' AND SUBSTRING(Spouse_DateofBirth,6,2) = '01' AND SUBSTRING(Spouse_DateofBirth,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DateofBirth,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DateofBirth,3,2) > '25' AND SUBSTRING(Spouse_DateofBirth,6,2) >= '01' AND SUBSTRING(Spouse_DateofBirth,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DateofBirth,3,2))*1
							   WHEN SUBSTRING(Spouse_DateofBirth,3,2) < '25' AND SUBSTRING(Spouse_DateofBirth,6,2) >= '01' AND SUBSTRING(Spouse_DateofBirth,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DateofBirth,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P1_Spouse_with_blank_Applicant 
  FROM Y2025_P1_TYPE_1
  WHERE Category = 'Household Category' AND NRICPoliceMilitaryIDNumber = '' AND  Spouse_Citizenship = 'MalaysianCitizen'
  --#Y2025_P1_Spouse_with_blank_Applicant: 202,018 


	 	SELECT x.* INTO  #Y2025_P1_AllEligibilityCriteriaCombined /*(9328547 rows affected)*/ 

	FROM 
	(
	SELECT * FROM #Y2025_P1_SingleNoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #Y2025_P1_SingleNoSpouse_OKU WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	UNION
	SELECT * FROM #Y2025_P1_NoKinNoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66
	UNION
	SELECT * FROM #Y2025_P1_NoKinNoSpouse_OKU WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	UNION
	SELECT * FROM #Y2025_P1_Household_AllApplicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #Y2025_P1_Household_Applicant_with_NoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #Y2025_P1_Household_Applicant_with_Spouse WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #Y2025_P1_Household_Applicant_with_SpouseNonMalaysian WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #Y2025_P1_Household_Spouse_with_Applicant WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #Y2025_P1_Spouse_with_blank_Applicant WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	) x


 /*
 B) Y2025_P2 
 /*REDACTED FOR OPSEC*/
SELECT * FROM Y2025_P2_TYPE_1   --376,091 Senior Citizen
SELECT * FROM Y2025_P2_TYPE_2  -- 3,367,434 Single Applicant
SELECT * FROM Y2025_P2_TYPE_3 --402,086 Ibu Bapa Tunggal Tiada Anak
SELECT * FROM Y2025_P2_TYPE_4 --2,591,905 Applicant 2,591,905 Spouse
SELECT * FROM Y2025_P2_TYPE_5--166,338 Applicant , Spouse NonMalaysian
SELECT * FROM Y2025_P2_TYPE_6 --64,503 Applicant , Spouse MalaysianCitizen
SELECT * FROM Y2025_P2_TYPE_7 --202,857 Spouse MalaysianCitizen
 */

 	/****** Y2025_P2 Processing ******/
	
		/****** Y2025_P2 Processing ******/

o

--1|Single. 


 SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							NoTel_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 20052025 Single' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P2_SingleNoSpouse
  FROM Y2025_P2_TYPE_2  
  WHERE NoICSpouse  = '' 
  -- #Y2025_P2_SingleNoSpouse: 3,367,434 3367434


   SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							NoTel_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 20052025 Single' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17),--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_SingleNoSpouse_OKU
   FROM Y2025_P2_TYPE_2  
  WHERE NoICSpouse  = '' AND OKUApplicant ='Y' 
  -- #Y2025_P2_SingleNoSpouse_OKU: 203,080 203080

--2|Senior Citizen No Spouse. 

				SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'The Scheme WE Fasa 2 2025' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_NoKinNoSpouse
  FROM Y2025_P2_TYPE_1    
  WHERE NoICSpouse  = '' 
  -- #Y2025_P2_NoKinNoSpouse: 376,091  376091

			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'The Scheme WE Fasa 2 2025' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_NoKinNoSpouse_OKU
  FROM Y2025_P2_TYPE_1    
  WHERE NoICSpouse  = '' AND OKUApplicant ='Y'
  -- #Y2025_P2_NoKinNoSpouse_OKU: 22,338 22338


--3|Household Category.  

				SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 IBT' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Household_Applicant_with_NoSpouse
 FROM Y2025_P2_TYPE_3
 WHERE  NoICSpouse = ''
  -- #Y2025_P2_Household_Applicant_with_NoSpouse : 402,086 402086


--4|Household Category.  Applicant dan Spouse MalaysianCitizen

					SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 ISR CASE 4' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Household_AllApplicant
 FROM Y2025_P2_TYPE_4
 where NRICPoliceMilitaryIDNumber !='' 
  -- ##Y2025_P2_Household_AllApplicant : 2,591,905 


					SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 ISR CASE 4' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Household_Applicant_with_Spouse
 FROM Y2025_P2_TYPE_4
 where NRICPoliceMilitaryIDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen' 
  -- #Y2025_P2_Household_Applicant_with_Spouse : 2,591,905



				SELECT NoICSpouse  AS NRIC,--(1)
							FullNameSpouse  AS FullName, 	--(2)							
							TarikhLahir_Spouse AS DateofBirth,--(3)
							CASE 
								WHEN Spouse_Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							NoTelSpouse AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN BankNameSpouse  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN BankNameSpouse  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN BankNameSpouse  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN BankNameSpouse  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN BankNameSpouse  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN BankNameSpouse  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN BankNameSpouse  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN BankNameSpouse  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN BankNameSpouse  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN BankNameSpouse  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN BankNameSpouse  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN BankNameSpouse  = 'CITIBANK BERHAD' THEN  '13'
								WHEN BankNameSpouse  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN BankNameSpouse  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN BankNameSpouse  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN BankNameSpouse  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN BankNameSpouse  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN BankNameSpouse  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN BankNameSpouse  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN BankNameSpouse  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN BankNameSpouse  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN BankNameSpouse  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN BankNameSpouse  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumberBankSpouse  AS BankAccountNumber,--(14) 
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 ISR CASE 4' AS SourceFile,--(16)
							CASE 
								WHEN OKUSpouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NoICSpouse, 3, 2) = '01' AND substring (NoICSpouse, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(TarikhLahir_Spouse,3,2) > '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) = '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(TarikhLahir_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(TarikhLahir_Spouse,3,2) < '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) = '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(TarikhLahir_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(TarikhLahir_Spouse,3,2) > '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) >= '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(TarikhLahir_Spouse,3,2))*1
							   WHEN SUBSTRING(TarikhLahir_Spouse,3,2) < '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) >= '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(TarikhLahir_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Household_Spouse_with_Applicant 
  FROM Y2025_P2_TYPE_4
  where NRICPoliceMilitaryIDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen'  
  -- #Y2025_P2_Household_Spouse_with_Applicant : 2,591,905 

 		

--5|Household Category, Spouse Not MalaysianCitizen  

						SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 ISR CASE 5' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Household_Applicant_with_NonMalSpouse
 FROM [IRB RawData - Y2025].[dbo].[The Scheme Fasa 2 V1 16052025 ISR CASE 5]
 where NRICPoliceMilitaryIDNumber !='' 
  -- #Y2025_P2_Household_Applicant_with_NonMalSpouse : 137,888 


--6|Household Category,  Spouse MalaysianCitizen 
					SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							MobileNumber_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 ISR CASE 6' AS SourceFile,--(16)
							CASE 
								WHEN OKUApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Household_with_Spouse_Over_or_Under_Age_Criteria
 FROM Y2025_P2_TYPE_6 
 WHERE  NoICSpouse = ''
  -- #Y2025_P2_Household_with_Spouse_Over_or_Under_Age_Criteria : 64,503 



--7|Household Category, No Applicant Detail, Spouse MalaysianCitizen 

	select * FROM Y2025_P2_TYPE_7 where NoICSpouse  !='' AND NRICPoliceMilitaryIDNumber  =''-- 0 Applicant in this file.

				SELECT NoICSpouse AS NRIC,--(1)
							FullNameSpouse AS FullName, 	--(2)							
							TarikhLahir_Spouse AS DateofBirth,--(3)
							CASE 
								WHEN Spouse_Gender = 'L' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							MobileNumberSpouse AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN BankNameSpouse  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN BankNameSpouse  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN BankNameSpouse  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN BankNameSpouse  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN BankNameSpouse  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN BankNameSpouse  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN BankNameSpouse  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN BankNameSpouse  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN BankNameSpouse  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN BankNameSpouse  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN BankNameSpouse  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN BankNameSpouse  = 'CITIBANK BERHAD' THEN  '13'
								WHEN BankNameSpouse  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN BankNameSpouse  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN BankNameSpouse  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN BankNameSpouse  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN BankNameSpouse  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN BankNameSpouse  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN BankNameSpouse  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN BankNameSpouse  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN BankNameSpouse  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN BankNameSpouse  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN BankNameSpouse  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumberBankSpouse  AS BankAccountNumber,--(14) FullName_Bank_Spouse|Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'The Scheme Fasa 2 V1 16052025 ISR CASE 7' AS SourceFile,--(16)
							CASE 
								WHEN OKUSpouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NoICSpouse, 3, 2) = '01' AND substring (NoICSpouse, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(TarikhLahir_Spouse,3,2) > '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) = '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(TarikhLahir_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(TarikhLahir_Spouse,3,2) < '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) = '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(TarikhLahir_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(TarikhLahir_Spouse,3,2) > '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) >= '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(TarikhLahir_Spouse,3,2))*1
							   WHEN SUBSTRING(TarikhLahir_Spouse,3,2) < '25' AND SUBSTRING(TarikhLahir_Spouse,6,2) >= '01' AND SUBSTRING(TarikhLahir_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(TarikhLahir_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #Y2025_P2_Spouse_with_blank_Applicant 
  FROM Y2025_P2_TYPE_7 
  WHERE  NRICPoliceMilitaryIDNumber = ''
  -- #Y2025_P2_Spouse_with_blank_Applicant: 202,857 


		 	SELECT x.* INTO   #Y2025_P2_AllEligibilityCriteriaCombined /*(9583562 rows affected)*/  
	FROM 
	(
	 SELECT * FROM  #Y2025_P2_SingleNoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_SingleNoSpouse_OKU WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	 UNION
	 SELECT * FROM  #Y2025_P2_NoKinNoSpouse  WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_NoKinNoSpouse_OKU WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	 UNION
	 SELECT * FROM   #Y2025_P2_Household_AllApplicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_Household_Applicant_with_NoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_Household_Applicant_with_Spouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_Household_Spouse_with_Applicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_Household_Applicant_with_NonMalSpouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_Household_with_Spouse_Over_or_Under_Age_Criteria  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #Y2025_P2_Spouse_with_blank_Applicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 	) x


 /*
 C) Y2025_P3 
 /*REDACTED FOR OPSEC*/
SELECT * FROM Y2025_P3_TYPE_1  --3,426,031 Single Applicant
SELECT * FROM Y2025_P3_TYPE_2 --383,088 Senior Citizen 
SELECT * FROM Y2025_P3_TYPE_3--424,917 Ibu Bapa Tunggal Tiada Anak
SELECT * FROM Y2025_P3_TYPE_4 --2,666,181 Applicant 2,666,181 Spouse
SELECT * FROM Y2025_P3_TYPE_5 --172,965 Applicant , Spouse NonMalaysian
SELECT * FROM Y2025_P3_TYPE_6 --66,126 Applicant , Spouse MalaysianCitizen
SELECT * FROM Y2025_P3_TYPE_7 --203,011 Spouse MalaysianCitizen

 */

 		/****** Y2025_P3 Processing ******/

--1|Single. Applicant tahun lahir 1959 hingga 2007|3426031|Tidak Berkaitan|Tidak Berkaitan||

 SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'Y2025_P3_Single_DisabilityStatus_No' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO  #Y2025_P3_Single_NoSpouse_DisabilityStatus_No
  FROM Y2025_P3_TYPE_1   
  WHERE NoICSpouse  = '' AND OKU_Applicant ='' 
  --#Y2025_P3_SingleNoSpouse_DisabilityStatus_No: 3,220,245  3220245


   SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'Y2025_P3_Single_DisabilityStatus_Yes' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17),--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_Single_NoSpouse_DisabilityStatus_Yes 
  FROM Y2025_P3_TYPE_1  
  WHERE NoICSpouse  = '' AND OKU_Applicant ='Y' 
  --#Y2025_P3_Single_NoSpouse_DisabilityStatus_Yes: 205,786


--2|Senior Citizen Tiada Spouse. Applicant tahun lahir 1959 hingga 2007|376091|Tidak Berkaitan|Tidak Berkaitan||
	
				SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'Y2025_P3_SeniorCitizen_NoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_SeniorCitizen_NoSpouse
  FROM Y2025_P3_TYPE_2 
  WHERE NoICSpouse  = '' 
  --#Y2025_P3_SeniorCitizen_NoSpouse: 383,088 383088

 

			SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'The Scheme WE Fasa 2 2025' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_SeniorCitizen_NoSpouse_DisabilityStatus_Yes 
  FROM Y2025_P3_TYPE_2 
  WHERE NoICSpouse  = '' AND OKU_Applicant ='Y'
  --#Y2025_P3_SeniorCitizen_NoSpouse_DisabilityStatus_Yes: 22,572


--3|Household Category.  Applicant tahun lahir 1959 hingga 2007|402086|Tidak Berkaitan|Tidak Berkaitan||


				SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_IBT__Applicant_with_NoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_IBT_Applicant_with_NoSpouse
 FROM [IRB RawData - Y2025_P3].[dbo].[IBT]
 WHERE  NoICSpouse = ''
  --#Y2025_P3_Ibt_Applicant_with_NoSpouse : 424,917 424917




--4|Household Category.  Applicant dan Spouse MalaysianCitizen tahun lahir 1959 hingga 2007|2591905|2591905|Tidak Berkaitan||


					SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_ISR Case 4__Applicant_with_SpouseMalaysianCitizen' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_ISR_Case_4__Applicant_with_SpouseMalaysianCitizen
 FROM Y2025_P3_TYPE_4
 where NRICPoliceMilitaryIDNumber !='' AND  TarafSpouse_Citizenship = 'MalaysianCitizen'
  --#Y2025_P3_ISR_Case_4__Applicant_with_SpouseMalaysianCitizen : 2,666,181 2602639



--NRICPoliceMilitaryIDNumber|FullName|DateofBirth_Applicant|Gender_Applicant|Category|FullNameSpouse|NoICSpouse|DateofBirth_Spouse|TarafSpouse_Citizenship|Spouse_Gender|OKU_Applicant|OKU_Spouse|Applicant_BankName|BankAccountNumber_Applicant|BankName_Spouse|BankAccountNumber_Spouse|AddressLine1|AddressLine2|AddressLine3|City|Postcode|State|TelB_Applicant|TelB_Spouse|StatusIBT

				SELECT NoICSpouse  AS NRIC,--(1)
							FullNameSpouse  AS FullName, 	--(2)							
							DateofBirth_Spouse AS DateofBirth,--(3)
							CASE 
								WHEN Spouse_Gender = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							TelB_Spouse AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN BankName_Spouse  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN BankName_Spouse  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN BankName_Spouse  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN BankName_Spouse  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN BankName_Spouse  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN BankName_Spouse  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN BankName_Spouse  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN BankName_Spouse  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN BankName_Spouse  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN BankName_Spouse  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN BankName_Spouse  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN BankName_Spouse  = 'CITIBANK BERHAD' THEN  '13'
								WHEN BankName_Spouse  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN BankName_Spouse  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN BankName_Spouse  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN BankName_Spouse  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN BankName_Spouse  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN BankName_Spouse  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN BankName_Spouse  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN BankName_Spouse  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN BankName_Spouse  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN BankName_Spouse  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN BankName_Spouse  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14) 
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_ISR Case 4_SpouseMalaysianCitizen_of_Applicant' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Spouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NoICSpouse, 3, 2) = '01' AND substring (NoICSpouse, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_ISR_Case_4_SpouseMalaysianCitizen_of_Applicant 
  FROM Y2025_P3_TYPE_4
  where NRICPoliceMilitaryIDNumber !='' AND  TarafSpouse_Citizenship = 'MalaysianCitizen'  
  --#Y2025_P3_ISR_Case_4_SpouseMalaysianCitizen_of_Applicant : 2,666,181 

--5|Household Category,  Applicant tahun lahir 1959 hingga 2007 dan Spouse Bukan MalaysianCitizen  |166338|Tidak Berkaitan|28450 Spouse bukan MalaysianCitizen menepati umur perlu serah tapi perlu ada tagging bukan MalaysianCitizen||

						SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_ISR Case 5_ApplicantWithSpouseNonMalaysian' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_ISR_Case_5_ApplicantWithSpouseMalaysianCitizen
 FROM Y2025_P3_TYPE_5
 where NRICPoliceMilitaryIDNumber !='' AND  TarafSpouse_Citizenship = '' and DateofBirth_Applicant BETWEEN '1960-01-01' and '2008-12-31' 
  --#Y2025_P3_ISR_Case_5_ApplicantWithSpouseMalaysianCitizen : 143,201 140986


  						SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_ISR Case 5_ApplicantWithSpouseNonMalaysian' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_ISR_Case_5_ApplicantWithSpouseNonMalaysian
 FROM Y2025_P3_TYPE_5
 where NRICPoliceMilitaryIDNumber !='' AND  TarafSpouse_Citizenship != '' 
  --#Y2025_P3_ISR_Case_5_ApplicantWithSpouseNonMalaysian : 28,864 

 

--6|Household Category,  Applicant tahun lahir 1959 hingga 2007 dan Spouse MalaysianCitizen  tahun lahir kurang 1958 atau lebih 2008 |64503||Tidak Berkaitan||


					SELECT NRICPoliceMilitaryIDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							 AddressLine2,--(6)
							 AddressLine3,--(7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							TelB_Applicant AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN Applicant_BankName = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN Applicant_BankName = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN Applicant_BankName = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN Applicant_BankName = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN Applicant_BankName = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN Applicant_BankName = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN Applicant_BankName = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN Applicant_BankName = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN Applicant_BankName = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN Applicant_BankName = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN Applicant_BankName = 'CITIBANK BERHAD' THEN  '13'
								WHEN Applicant_BankName = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN Applicant_BankName = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN Applicant_BankName = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN Applicant_BankName = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN Applicant_BankName = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN Applicant_BankName = 'AGRO BANK BERHAD' THEN  '22'
								WHEN Applicant_BankName = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN Applicant_BankName = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN Applicant_BankName = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN Applicant_BankName = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN Applicant_BankName = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_ISR Case 6_ApplicantWithNoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NRICPoliceMilitaryIDNumber, 3, 2) = '01' AND substring (NRICPoliceMilitaryIDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NRICPoliceMilitaryIDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NRICPoliceMilitaryIDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NRICPoliceMilitaryIDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_ISR_Case_6_ApplicantWithNoSpouse
 FROM Y2025_P3_TYPE_6  
 WHERE  NoICSpouse = ''
  --##Y2025_P3_ISR_Case_6_ApplicantWithNoSpouse : 66,126 66126

--7|Household Category,  Applicant tahun lahir kurang 1958 atau lebih 2008 dan Spouse MalaysianCitizen  tahun lahir kurang 1959 hingga 2007|data Applicant tidak perlu serah memandangkan telah ada isi tagging rumah|202857|Tidak Berkaitan||



				SELECT NoICSpouse AS NRIC,--(1)
							FullNameSpouse AS FullName, 	--(2)							
							DateofBirth_Spouse AS DateofBirth,--(3)
							CASE 
								WHEN Spouse_Gender = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							AddressLine1,--(5)
							AddressLine2,--(6)
							AddressLine3,--(7)
							Postcode,--(8)
							City,--(9)
							State,--(10)
							TelB_Spouse AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN BankName_Spouse  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
								WHEN BankName_Spouse  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
								WHEN BankName_Spouse  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
								WHEN BankName_Spouse  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
								WHEN BankName_Spouse  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
								WHEN BankName_Spouse  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
								WHEN BankName_Spouse  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
								WHEN BankName_Spouse  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
								WHEN BankName_Spouse  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
								WHEN BankName_Spouse  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
								WHEN BankName_Spouse  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
								WHEN BankName_Spouse  = 'CITIBANK BERHAD' THEN  '13'
								WHEN BankName_Spouse  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
								WHEN BankName_Spouse  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
								WHEN BankName_Spouse  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
								WHEN BankName_Spouse  = 'BANK SIMPANAN NASIONAL' THEN  '17'
								WHEN BankName_Spouse  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
								WHEN BankName_Spouse  = 'AGRO BANK BERHAD' THEN  '22'
								WHEN BankName_Spouse  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
								WHEN BankName_Spouse  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
								WHEN BankName_Spouse  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
								WHEN BankName_Spouse  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
								WHEN BankName_Spouse  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14) FullName_Bank_Spouse|Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'Y2025_P3_ISR Case 7_SpouseWithNoApplicant' AS SourceFile,--(16)
							CASE 
								WHEN OKU_Spouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(NoICSpouse, 3, 2) = '01' AND substring (NoICSpouse, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoICSpouse, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoICSpouse, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoICSpouse, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #Y2025_P3_ISR_Case_7_SpouseWithNoApplicant
  FROM Y2025_P3_TYPE_7 
  WHERE  NRICPoliceMilitaryIDNumber = ''
  --#Y2025_P3_ISR_Case_7_SpouseWithNoApplicant: 203,011 203011

		 	SELECT x.* INTO  #Y2025_P3_AllEligibilityCriteriaCombined /*(9845715 rows affected)*/  
	FROM 
	(
SELECT * FROM #Y2025_P3_Single_NoSpouse_DisabilityStatus_No WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #Y2025_P3_Single_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
UNION
SELECT * FROM #Y2025_P3_SeniorCitizen_NoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #Y2025_P3_SeniorCitizen_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
UNION
SELECT * FROM #Y2025_P3_IBT_Applicant_with_NoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
UNION
SELECT * FROM #Y2025_P3_ISR_Case_4__Applicant_with_SpouseMalaysianCitizen  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
UNION
SELECT * FROM #Y2025_P3_ISR_Case_4_SpouseMalaysianCitizen_of_Applicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
UNION
SELECT * FROM #Y2025_P3_ISR_Case_5_ApplicantWithSpouseMalaysianCitizen  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #Y2025_P3_ISR_Case_5_ApplicantWithSpouseNonMalaysian  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #Y2025_P3_ISR_Case_6_ApplicantWithNoSpouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #Y2025_P3_ISR_Case_7_SpouseWithNoApplicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
	 	) x


/*
D) Y2025_P4  
 Re:  /*REDACTED FOR OPSEC*/

SELECT * FROM Y2025_P4_TYPE_1--3,496,721  Single Applicant
SELECT * FROM Y2025_P4_TYPE_2 --430,947 Ibu Bapa Tunggal Tiada Anak
SELECT * FROM Y2025_P4_TYPE_3 --2,720,497 Applicant 2,715,958 Spouse
SELECT * FROM Y2025_P4_TYPE_4 --174,919 Applicant , Spouse NonMalaysian
SELECT * FROM Y2025_P4_TYPE_5 --67,518 Applicant , Spouse MalaysianCitizen
SELECT * FROM Y2025_P4_TYPE_6 --205,274 Spouse MalaysianCitizen
SELECT * FROM Y2025_P4_TYPE_7 --384,984 Senior Citizen 
*/

/****** Y2025_P4 Processing ******/

SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'Y2025_P4_Single_DisabilityStatus_No' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_Single_NoSpouse_DisabilityStatus_No
  FROM  Y2025_P4_TYPE_1  AS t
 -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End

  WHERE Spouse_NRICNumber  = '' AND Ind_DisabilityStatus_Applicant ='' 
  --#Y2025_P4_SingleNoSpouse_DisabilityStatus_No: 3,301,935 3301935


  SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'Y2025_P4_Single_DisabilityStatus_Yes' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_Single_NoSpouse_DisabilityStatus_Yes
  FROM  Y2025_P4_TYPE_1  AS t
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End

  WHERE Spouse_NRICNumber  = '' AND Ind_DisabilityStatus_Applicant ='Yes' 
  --#Y2025_P4_P_SingleNoSpouse_DisabilityStatus_Yes: 194,786 194786

		 SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_IBT' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_IBT_Applicant_with_NoSpouse
 FROM Y2025_P4_TYPE_2 AS t
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End
 WHERE  Spouse_NRICNumber = ''
  --#Y2025_P4_Ibt_Applicant_with_NoSpouse : 430,947 430947

	
			 SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_ISR Case 4_Applicant_with_SpouseMalaysianCitizen' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_ISR_Case_4__Applicant_with_SpouseMalaysianCitizen
 FROM Y2025_P4_TYPE_3 AS t
 -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End
 where NoKP_Applicant !='' AND  Spouse_Citizenship = 'MalaysianCitizen' 
  --#Y2025_P4_ISR_Case_4__Applicant_with_SpouseMalaysianCitizen : 2,720,497 2655841


  				SELECT Spouse_NRICNumber  AS NRIC,--(1)
							Spouse_FullName  AS FullName, 	--(2)							
							DateofBirth_Spouse AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '2'
								ELSE '1'
								END	AS Gender,--(4)
								c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN BankName_Spouse  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN BankName_Spouse  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN BankName_Spouse  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN BankName_Spouse  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN BankName_Spouse  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN BankName_Spouse  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN BankName_Spouse  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN BankName_Spouse  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN BankName_Spouse  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN BankName_Spouse  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN BankName_Spouse  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN BankName_Spouse  = 'CITIBANK BERHAD' THEN  '13'
									WHEN BankName_Spouse  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN BankName_Spouse  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN BankName_Spouse  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN BankName_Spouse  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN BankName_Spouse  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN BankName_Spouse  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN BankName_Spouse  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN BankName_Spouse  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN BankName_Spouse  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN BankName_Spouse  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN BankName_Spouse  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN BankName_Spouse  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN BankName_Spouse  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14) 
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_ISR Case 4_SpouseMalaysianCitizen_of_Applicant' AS SourceFile,--(16) 
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_NRICNumber, 3, 2) = '01' AND substring (Spouse_NRICNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_ISR_Case_4_SpouseMalaysianCitizen_of_Applicant 
  FROM Y2025_P4_TYPE_3 AS t
 -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End
  where Spouse_NRICNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen'  
  --#Y2025_P4_ISR_Case_4_SpouseMalaysianCitizen_of_Applicant : 2,720,497 


					SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_ISR Case 5_ApplicantWithSpouseMalaysianCitizen' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_ISR_Case_5_Applicant
 FROM Y2025_P4_TYPE_4 AS t
 -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End

  --#Y2025_P4_ISR_Case_5_Applicant : 174,919 


 SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_ISR_Case_6_ApplicantWithNoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_ISR_Case_6_ApplicantWithNoSpouse
 FROM Y2025_P4_TYPE_5 AS t
 -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End  
 WHERE  Spouse_NRICNumber = ''
  --#Y2025_P4_ISR_Case_6_ApplicantWithNoSpouse : 67,518 67518

				SELECT Spouse_NRICNumber  AS NRIC,--(1)
							Spouse_FullName  AS FullName, 	--(2)							
							DateofBirth_Spouse AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '2'
								ELSE '1'
								END	AS Gender,--(4)
								c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN BankName_Spouse  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN BankName_Spouse  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN BankName_Spouse  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN BankName_Spouse  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN BankName_Spouse  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN BankName_Spouse  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN BankName_Spouse  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN BankName_Spouse  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN BankName_Spouse  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN BankName_Spouse  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN BankName_Spouse  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN BankName_Spouse  = 'CITIBANK BERHAD' THEN  '13'
									WHEN BankName_Spouse  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN BankName_Spouse  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN BankName_Spouse  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN BankName_Spouse  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN BankName_Spouse  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN BankName_Spouse  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN BankName_Spouse  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN BankName_Spouse  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN BankName_Spouse  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN BankName_Spouse  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN BankName_Spouse  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN BankName_Spouse  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN BankName_Spouse  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14) 
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_ISR Case 7_SpouseMalaysianCitizen_of_Applicant' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Spouse  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_NRICNumber, 3, 2) = '01' AND substring (Spouse_NRICNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_NRICNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_NRICNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_NRICNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_ISR_Case_7_SpouseWithNoApplicant
  FROM Y2025_P4_TYPE_6 AS t
 -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End 
  WHERE  Spouse_NRICNumber != ''
  --#Y2025_P4_ISR_Case_7_SpouseWithNoApplicant: 205,274 


SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_Senior Citizen_NoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_SeniorCitizen_NoSpouse
 FROM Y2025_P4_TYPE_7   AS t
  -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End
 WHERE Spouse_NRICNumber  = '' 
 --#Y2025_P4_SeniorCitizen_NoSpouse: 384,984 


 
			SELECT NoKP_Applicant AS NRIC,--(1)
							FullName_Applicant AS FullName, 	--(2)							
							DateofBirth_Applicant AS DateofBirth,--(3)
							CASE 
								WHEN Gender_Applicant = 'Lelaki' THEN '1'
								ELSE '2'
								END	AS Gender,--(4)
							c1.head AS AddressLine1,                          -- (5)
							c2.head AS AddressLine2,                          -- (6)
							c3.head AS AddressLine3,                          -- (7)
							 Postcode,--(8)
							 City,--(9)
							 State,--(10)
							'' AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
									WHEN Applicant_BankName  = 'AFFIN BANK BERHAD / AFFIN ISLAMIC BANK BERHAD' THEN  '01'
									WHEN Applicant_BankName  = 'ALLIANCE BANK MALAYSIA BERHAD / ALLIANCE ISLAMIC BANK BERHAD' THEN  '02'
									WHEN Applicant_BankName  = 'AMBANK BERHAD / AM ISLAMIC BANK BERHAD' THEN  '03'
									WHEN Applicant_BankName  = 'BANK MUAMALAT MALAYSIA BERHAD' THEN  '04'
									WHEN Applicant_BankName  = 'BANK ISLAM MALAYSIA BERHAD' THEN  '05'
									WHEN Applicant_BankName  = 'BANK KERJASAMA RAKYAT MALAYSIA BHD' THEN  '06'
									WHEN Applicant_BankName  = 'CIMB BANK BERHAD / CIMB ISLAMIC BANK BERHAD' THEN  '07'
									WHEN Applicant_BankName  = 'HONG LEONG BANK BERHAD / HONG LEONG ISLAMIC BANK BERHAD' THEN  '09'
									WHEN Applicant_BankName  = 'MALAYAN BANKING BERHAD / MAYBANK ISLAMIC BERHAD' THEN  '10'
									WHEN Applicant_BankName  = 'PUBLIC BANK BERHAD / PUBLIC ISLAMIC BANK BERHAD' THEN  '11'
									WHEN Applicant_BankName  = 'RHB BANK BERHAD / RHB ISLAMIC BANK BERHAD' THEN  '12'
									WHEN Applicant_BankName  = 'CITIBANK BERHAD' THEN  '13'
									WHEN Applicant_BankName  = 'OCBC BANK MALAYSIA BHD / OCBC AL-AMIN BANK BERHAD' THEN  '14'
									WHEN Applicant_BankName  = 'HSBC BANK MALAYSIA BERHAD / HSBC AMANAH MALAYSIA BERHAD  ' THEN  '15'
									WHEN Applicant_BankName  = 'STANDARD CHARTERED BANK MALAYSIA BERHAD / STANDARD CHARTERED SAADIQ BERHAD' THEN  '16'
									WHEN Applicant_BankName  = 'BANK SIMPANAN NASIONAL' THEN  '17'
									WHEN Applicant_BankName  = 'UNITED OVERSEAS BANK (MALAYSIA) BERHAD (UOB BANK)' THEN  '18'
									WHEN Applicant_BankName  = 'BANK OF AMERICA MALAYSIA BERHAD' THEN  '21'
									WHEN Applicant_BankName  = 'AGRO BANK BERHAD' THEN  '22'
									WHEN Applicant_BankName  = 'J.P. MORGAN CHASE BANK BERHAD  ' THEN  '23'
									WHEN Applicant_BankName  = 'KUWAIT FINANCE HOUSE (MALAYSIA) BERHAD' THEN  '24'
									WHEN Applicant_BankName  = 'SUMITOMO MITSUI BANKING CORPORATION MALAYSIA BERHAD  ' THEN  '26'
									WHEN Applicant_BankName  = 'AL RAJHI BANKING & INVESTMENT CORPORATION (MALAYSIA) BERHAD' THEN  '27'
									WHEN Applicant_BankName  = 'BANK OF CHINA (MALAYSIA) BERHAD' THEN  '28'
									WHEN Applicant_BankName  = 'MBSB BANK BERHAD' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13) 

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'Y2025_P4_Senior Citizen_NoSpouse_NoSpouse_DisabilityStatus_Yes' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(NoKP_Applicant, 3, 2) = '01' AND substring (NoKP_Applicant, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(NoKP_Applicant, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(NoKP_Applicant, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(NoKP_Applicant, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #Y2025_P4_SeniorCitizen_NoSpouse_DisabilityStatus_Yes 
  FROM Y2025_P4_TYPE_7 AS t
    -- 💡 Address splitter via CROSS APPLY (no UDF needed)--Start
							CROSS APPLY (SELECT s = LTRIM(RTRIM(t.Address))) AS a
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN LEN(a.s) <= 30 THEN LEN(a.s)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(a.s, 30))) + 1
										END
									END
							) AS b1
							CROSS APPLY (
								SELECT 
									head = NULLIF(LTRIM(RTRIM(LEFT(a.s, b1.break_at))), ''),
									tail = NULLIF(LTRIM(SUBSTRING(a.s, b1.break_at + 1, 8000)), '')
							) AS c1
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c1.tail IS NULL THEN NULL
										WHEN LEN(c1.tail) <= 30 THEN LEN(c1.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c1.tail, 30))) + 1
										END
									END
							) AS b2
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c1.tail, b2.break_at))), '')
										   END,
									tail = CASE 
											 WHEN c1.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(SUBSTRING(c1.tail, b2.break_at + 1, 8000)), '')
										   END
							) AS c2
							CROSS APPLY (
								SELECT break_at =
									CASE 
										WHEN c2.tail IS NULL THEN NULL
										WHEN LEN(c2.tail) <= 30 THEN LEN(c2.tail)
										ELSE CASE 
											WHEN CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) = 0 THEN 30
											ELSE 30 - CHARINDEX(' ', REVERSE(LEFT(c2.tail, 30))) + 1
										END
									END
							) AS b3
							CROSS APPLY (
								SELECT 
									head = CASE 
											 WHEN c2.tail IS NULL THEN NULL
											 ELSE NULLIF(LTRIM(RTRIM(LEFT(c2.tail, b3.break_at))), '')
										   END
							) AS c3
-- 💡 Address splitter via CROSS APPLY (no UDF needed)--End
  WHERE Spouse_NRICNumber  = '' AND Ind_DisabilityStatus_Applicant ='Yes'
  --#Y2025_P4_SeniorCitizen_NoSpouse_DisabilityStatus_Yes: 20,016 



     	SELECT x.* INTO  #Y2025_P4_AllEligibilityCriteriaCombined /*(10,034,297 rows affected)*/    
	FROM 
	(
SELECT * FROM  #Y2025_P4_Single_NoSpouse_DisabilityStatus_No WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 --(3301935 rows affected)
UNION
SELECT * FROM  #Y2025_P4_Single_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' --(194786 rows affected)
UNION
SELECT * FROM  #Y2025_P4_IBT_Applicant_with_NoSpouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 --(430947 rows affected)
UNION
SELECT * FROM  #Y2025_P4_ISR_Case_4__Applicant_with_SpouseMalaysianCitizen WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66   --(2720497 rows affected)
UNION
SELECT * FROM  #Y2025_P4_ISR_Case_4_SpouseMalaysianCitizen_of_Applicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66   --(2720497 rows affected)
UNION
SELECT * FROM  #Y2025_P4_ISR_Case_5_Applicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66	--(174919 rows affected)
UNION
SELECT * FROM  #Y2025_P4_ISR_Case_6_ApplicantWithNoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 --(67518 rows affected)
UNION
SELECT * FROM  #Y2025_P4_ISR_Case_7_SpouseWithNoApplicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66	--(205274 rows affected)
UNION
SELECT * FROM  #Y2025_P4_SeniorCitizen_NoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66	--(384984 rows affected)
UNION
SELECT * FROM  #Y2025_P4_SeniorCitizen_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y'  --(20016 rows affected)
 
	 	) x
		
     SELECT x.* INTO  #Y2025_AllEligibilityCriteriaCombined /*(38775342 rows affected)*/     
	FROM 
	(
SELECT * FROM  #Y2025_P1_AllEligibilityCriteriaCombined
UNION
SELECT * FROM  #Y2025_P2_AllEligibilityCriteriaCombined
UNION
SELECT * FROM  #Y2025_P3_AllEligibilityCriteriaCombined
UNION
SELECT * FROM  #Y2025_P4_AllEligibilityCriteriaCombined
	 	) x


--Exclude Spouse_PEMASTAUTIN_TETAP_BUKAN_MalaysianCitizen_BUKAN_PEMASTAUTIN_TETAP--
SELECT * INTO #Y2025_AllEligibilityCriteriaCombined_/*(38775342 rows affected)*/ FROM #Y2025_AllEligibilityCriteriaCombined
WHERE NRIC NOT IN /*IN*/
(SELECT Spouse_NRICNumber  FROM Y2025_P4_TYPE_4 where Spouse_Citizenship ='Permanent Resident' OR Spouse_Citizenship ='NonCitizen and Non Permanent Resident') 
--0 Spouse Permanent Resident or NonCitizen and Non Permanent Resident in ##Y2025_AllEligibilityCriteriaCombined.To exclude

/*
SELECT * INTO [Working17].[dbo].[Y2025_AllEligibilityCriteriaCombined] FROM #Y2025_AllEligibilityCriteriaCombined_ /*(38780078 rows affected)*/
*/


--CheckDuplicateNRIC

SELECT DISTINCT NRIC FROM  #Y2025_AllEligibilityCriteriaCombined_
	--#Y2025_AllEligibilityCriteriaCombined Unique NRIC= *10,058,652/ 
	
	SELECT TOP(10)*FROM  #Y2025_AllEligibilityCriteriaCombined_
	SELECT TOP(10)*FROm  [Working17].[dbo].[Y2025_AllEligibilityCriteriaCombined]

	SELECT *FROM  #Y2025_AllEligibilityCriteriaCombined_ where ANB_FromDateofBirth != ANB_FromNRIC
--10,313 record where ANB_FromDateofBirth != ANB_FromNRIC

	SELECT *FROM  #Y2025_AllEligibilityCriteriaCombined_ where ANB_FromDateofBirth = '' or  ANB_FromNRIC = ''
	SELECT *FROM  #Y2025_AllEligibilityCriteriaCombined_ where ANB_FromDateofBirth = '' 
	SELECT *FROM  #Y2025_AllEligibilityCriteriaCombined_ where ANB_FromNRIC = '' 

	SELECT distinct ANB_FromDateofBirth FROM  #Y2025_AllEligibilityCriteriaCombined_ GROUP BY ANB_FromDateofBirth ORDER BY ANB_FromDateofBirth ASC
	--ANB 19 to 66
	SELECT distinct ANB_FromNRIC FROM  #Y2025_AllEligibilityCriteriaCombined_ GROUP BY ANB_FromNRIC ORDER BY ANB_FromNRIC ASC
	--ANB 19 to 86
	SELECT * FROM  #Y2025_AllEligibilityCriteriaCombined_ WHERE  ANB_FromNRIC > 66
	--622 records with potentially excluded if use ANB_FromNRIC. To proceed. 
	 
	SELECT distinct DateofBirth  FROM  #Y2025_AllEligibilityCriteriaCombined_ GROUP BY DateofBirth ORDER BY DateofBirth ASC /*DESC*/
	--Earliest DateofBirth 1960-01-02, latest DateofBirth 2007-12-31. OK.

	SELECT NRIC, SourceFile, COUNT(NRIC) AS OccuranceNNRIC FROM #Y2025_AllEligibilityCriteriaCombined_ 
	GROUP BY NRIC, SourceFile
	HAVING COUNT(NRIC) > 2 /*2/3/4*/
	ORDER BY NRIC ASC
	--25,281 appeared more than once


		;WITH Ranked AS
		(
			SELECT NRIC,FullName,DateofBirth, Gender,AddressLine1,AddressLine2,AddressLine3,Postcode,City,State,MobileNumber,EmailAddress,BankName,BankAccountNumber,MaritalStatus,
				   ROW_NUMBER() OVER (PARTITION BY NRIC ORDER BY (SELECT NULL)) AS rn
			FROM #Y2025_AllEligibilityCriteriaCombined_
		)
		SELECT *
		INTO #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved --(10058652 rows affected)
		FROM Ranked
		WHERE rn = 1;

	_______________________________________________________________________________________________________________________________
--Remove Non Malaysian, Sanctioned Persons  & Claims Negative List

SELECT * 
INTO #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved /*(10,058,640 rows affected)*/
FROM #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved WHERE NRIC /*IN*/ NOT  IN ( 
/*
'NRIC',/*Name*/

REDACTED FOR OPSEC
*/


--Filepath:  /*REDACTED FOR OPSEC*/

--12 match Sanctioned Persons,to exclude

/*
REDACTED FOR OPSEC
*/


SELECT *
INTO #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6 /*(10,057,737 rows affected)*/   
FROM #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved WHERE NRIC /*IN*/  NOT IN (SELECT NRIC from [Working].[dbo].[NonMalaysianV6])
--903 record match with NonMalaysianV6, to exclude
--Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6=10,057,737


 SELECT * 
INTO #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd /*(10,057,516 rows affected)*/ 
FROM #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6 WHERE NRIC /*IN*/  NOT IN ( 
/*
REDACTED FOR OPSEC
*/)

/*
No1|Sheet Name|Count of NRIC|Date Added/ Requested|Reference 
   /*
  REDACTED FOR OPSEC
  */

--221 match Claims Negative List,to exclude
*/

/*
NRIC|FullName|DateofBirth|Gender|AddressLine1|AddressLine2|AddressLine3|Postcode|City|State|MobileNumber|EmailAddress|BankName|BankAccountNumber|MaritalStatus
/*
REDACTED FOR OPSEC
*/
*/



Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd


SELECT * INTO  [Working17].[dbo].[Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd] FROM  #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd /*(10057518 rows affected)*/

drop table #TEMP_AllYears_as_at20251216
______________________________________________________________________________________________________________________________________
--Check new to The Scheme coverage 

			SELECT x.* INTO  #TEMP_AllYears_as_at20251216

	FROM (
	SELECT '2019' AS EligibilityYear,* FROM [SchemeEligibleListing10].[dbo].[Eligible_2019_4297764]
	UNION  
	SELECT '2020' AS EligibilityYear,* FROM [SchemeEligibleListing10].[dbo].[Eligible_2020_5984756]
	UNION  
	SELECT '2021' AS EligibilityYear,* FROM [SchemeEligibleListing10].[dbo].[Eligible_2021_5521408]
	UNION  
	SELECT '2022' AS EligibilityYear,* FROM [SchemeEligibleListing11].[dbo].[Eligible_2022_V10_11275019]	
	UNION  
	SELECT '2023' AS EligibilityYear,* FROM [SchemeEligibleListing11].[dbo].[Eligible_2023_V8_11002492]	
	UNION  
	SELECT '2024' AS EligibilityYear,* FROM [SchemeEligibleListing15].[dbo].[Eligible_2024_V20_11410090]
	UNION  
	SELECT '2025' AS EligibilityYear,* FROM [SchemeEligibleListing15].[dbo].[Eligible_2025_V15_10628200]
	) x

	SELECT *
	INTO #TEMPNewtoScheme137385 /*(137385 rows affected)*/
	FROM #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd WHERE NRIC /*IN*/ NOT  IN (SELECT NRIC FROM #TEMP_AllYears_as_at20251216)
	--9,920,131 record ALREADY IN The Scheme under prior years
	--New record to The Scheme = 137,385 . Check why so many & are they in Eligible_2025_V15_10628200? If not why?

	SELECT TOP(10)* FROM #TEMPNewtoScheme137385

	SELECT *
	FROM #TEMPNewtoScheme137385 WHERE NRIC /*IN*/ NOT IN (SELECT NRIC FROM [SchemeEligibleListing15].[dbo].[Eligible_2025_V15_10628200])
	--are they in Eligible_2025_V15_10628200? No

	SELECT DISTINCT DateofBirth, COUNT (DateofBirth)  AS COUNTDateofBirth FROM #TEMPNewtoScheme137385 GROUP BY DateofBirth ORDER BY DateofBirth asc
	/*
	DateofBirth|COUNTDateofBirth
	2004-01-02|388
	......
	2007-12-31|5

	Total born year 2004=136161
	Total born year 2007=1224
	*/

	SELECT DISTINCT MaritalStatus, COUNT (MaritalStatus) AS COUNTMaritalStatus   FROM #TEMPNewtoScheme137385  GROUP BY MaritalStatus ORDER BY MaritalStatus ASC
	/*
	MaritalStatus|COUNTMaritalStatus
	1|1224
	3|136161
	*/

	--New record to The Scheme = 137,385. From 136161 Marital Status=3 & 1224 Marital Status=1. OK

	______________________________________________________________________________________________________________________________________
--Create Eligible_2026

	SELECT *
	INTO [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] /*(10,057,516 rows affected)*/
	FROM #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd

	SELECT COUNT (NRIC) FROM #Y2025_AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonMalaysianV6_ClmNegListRmvd

	select top(10)* from  [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]

	SELECT *
	INTO  [Working17].[dbo].[AS400ADHOC260107] 
	FROM [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] WHERE NRIC NOT IN (SELECT NRIC FROM #TEMP_AllYears_as_at20251216)

	SELECT *
	INTO  [Working17].[dbo].[AS400ADHOC260108] 
	FROM [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] WHERE NRIC  IN (SELECT NRIC FROM #TEMP_AllYears_as_at20251216)

	select top(10)* from  [Working17].[dbo].[AS400ADHOC260108] 
	______________________________________________________________________________________________________________________________________
--Amendment to data [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]. 
/*
Due to issue found for 
A)
NRIC	FullName
/*
REDACTED FOR OPSEC
*/
 

Correct name located from  /*REDACTED FOR OPSEC*/, from other SourceData data.
*/


SELECT * FROM [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
WHERE NRIC IN (
/*
REDACTED FOR OPSEC
*/)


/*
REDACTED FOR OPSEC
*/



UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET FullName = /*REDACTED FOR OPSEC*/
  WHERE NRIC = /*REDACTED FOR OPSEC*/

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET FullName = /*REDACTED FOR OPSEC*/
  WHERE NRIC = /*REDACTED FOR OPSEC*/

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET FullName = /*REDACTED FOR OPSEC*/
  WHERE NRIC = /*REDACTED FOR OPSEC*/

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET FullName = /*REDACTED FOR OPSEC*/
  WHERE NRIC = /*REDACTED FOR OPSEC*/

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET FullName = /*REDACTED FOR OPSEC*/
  WHERE NRIC = /*REDACTED FOR OPSEC*/

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET FullName = /*REDACTED FOR OPSEC*/
  WHERE NRIC = /*REDACTED FOR OPSEC*/


/*
REDACTED FOR OPSEC
*/
  

/*
B)
Blank AddressLine1, Postcode, City, State
*/

 select count(AddressLine1) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where AddressLine1 =''
 --10517 records with blank AddressLine1
  select count(Postcode) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where Postcode =''
--9872 records with blank Postcode
    select count(City) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where City =''
--9872 records with blank City
    select count(State) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where State =''
--9872 records with blank State


UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET AddressLine1 = 'AddressLine1'
  WHERE AddressLine1 = ''

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET Postcode = '10000'
  WHERE Postcode = ''

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET City = 'City'
  WHERE City = ''

UPDATE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
  SET State = 'State'
  WHERE State = ''


   select count(AddressLine1) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where AddressLine1 =''
 --0 records with blank AddressLine1
  select count(Postcode) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where Postcode =''
--0 records with blank Postcode
    select count(City) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where City =''
--0 records with blank City
    select count(State) from [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516] where State =''
--0 records with blank State


ALTER TABLE [SchemeEligibleListing15].[dbo].[Eligible_2026_V1_10057516]
DROP COLUMN rn;

ALTER TABLE [Working17].[dbo].[AS400ADHOC260108] 
DROP COLUMN rn;

ALTER TABLE [Working17].[dbo].[AS400ADHOC260107] 
DROP COLUMN rn;