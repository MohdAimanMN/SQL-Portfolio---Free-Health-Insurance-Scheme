/*
This file records the processing of the 2026 eligible member list.
Processing uses the prior year's applicant data, received in 4 phases (P1 to P4).
Each phase is split by category, age-checked, combined, deduplicated,
screened against exclusion lists, and published as the final eligible list.
*/


/*
A) P1

 */


	/****** P1 Processing ******/


 SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P1_SingleNoSpouse
  FROM SRC_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Category = 'Single'
  --#P1_SingleNoSpouse


   SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17),--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_SingleNoSpouse_Disabled
  FROM SRC_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Applicant_DisabilityStatus ='Y' AND Category = 'Single'
  --#P1_SingleNoSpouse_Disabled


	
			SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_NoKinNoSpouse
  FROM SRC_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Category = 'Senior Citizen No Kin'
  --#P1_NoKinNoSpouse

  
			SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_NoKinNoSpouse_Disabled
  FROM SRC_P1_TYPE_1
  WHERE Spouse_NRICNumber = '' AND Category = 'Senior Citizen No Kin' AND Applicant_DisabilityStatus ='Y'
  --#TEMP_NoKinNoSpouse_Disabled


/*
		SELECT * FROM SRC_P1_TYPE_1 WHERE Category = 'Household Category'
*/			

			SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_Household_AllApplicant
  FROM SRC_P1_TYPE_1
 WHERE Category = 'Household Category' AND Applicant_IDNumber !=''
  --##P1_Household_AllApplicant

			SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_Household_Applicant_with_NoSpouse
  FROM SRC_P1_TYPE_1
 WHERE Category = 'Household Category' and Spouse_NRICNumber = ''
  --#P1_Household_Applicant_with_NoSpouse
			
			SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_Household_Applicant_with_Spouse
  FROM SRC_P1_TYPE_1
 where Applicant_IDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen' AND Category = 'Household Category' 
  --#P1_Household_Applicant_with_Spouse

  			SELECT Applicant_IDNumber AS NRIC,--(1)
							FullName AS FullName, 	--(2)
							Applicant_DOB AS DateofBirth,--(3)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Applicant_BankAccountNumber AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Applicant_DisabilityStatus = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) = '01' AND SUBSTRING(Applicant_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Applicant_DOB,3,2) > '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Applicant_DOB,3,2))*1
							   WHEN SUBSTRING(Applicant_DOB,3,2) < '25' AND SUBSTRING(Applicant_DOB,6,2) >= '01' AND SUBSTRING(Applicant_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Applicant_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P1_Household_Applicant_with_SpouseNonMalaysian
  FROM SRC_P1_TYPE_1
 where Applicant_IDNumber !='' AND  Spouse_Citizenship = 'Permanent Resident' or Spouse_Citizenship = 'NonCitizen and Non Permanent Resident' AND Category = 'Household Category' 
  --#P1_Household_Applicant_with_SpouseNonMalaysian


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
								WHEN FullName_Bank_Spouse = 'BANK 01' THEN  '01'
								WHEN FullName_Bank_Spouse = 'BANK 02' THEN  '02'
								WHEN FullName_Bank_Spouse = 'BANK 03' THEN  '03'
								WHEN FullName_Bank_Spouse = 'BANK 04' THEN  '04'
								WHEN FullName_Bank_Spouse = 'BANK 05' THEN  '05'
								WHEN FullName_Bank_Spouse = 'BANK 06' THEN  '06'
								WHEN FullName_Bank_Spouse = 'BANK 07' THEN  '07'
								WHEN FullName_Bank_Spouse = 'BANK 09' THEN  '09'
								WHEN FullName_Bank_Spouse = 'BANK 10' THEN  '10'
								WHEN FullName_Bank_Spouse = 'BANK 11' THEN  '11'
								WHEN FullName_Bank_Spouse = 'BANK 12' THEN  '12'
								WHEN FullName_Bank_Spouse = 'BANK 13' THEN  '13'
								WHEN FullName_Bank_Spouse = 'BANK 14' THEN  '14'
								WHEN FullName_Bank_Spouse = 'BANK 15' THEN  '15'
								WHEN FullName_Bank_Spouse = 'BANK 16' THEN  '16'
								WHEN FullName_Bank_Spouse = 'BANK 17' THEN  '17'
								WHEN FullName_Bank_Spouse = 'BANK 18' THEN  '18'
								WHEN FullName_Bank_Spouse = 'BANK 22' THEN  '22'
								WHEN FullName_Bank_Spouse = 'BANK 23' THEN  '23'
								WHEN FullName_Bank_Spouse = 'BANK 24' THEN  '24'
								WHEN FullName_Bank_Spouse = 'BANK 27' THEN  '27'
								WHEN FullName_Bank_Spouse = 'BANK 28' THEN  '28'
								WHEN FullName_Bank_Spouse = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Spouse_BankAccountNumber AS BankAccountNumber,--(14) FullName_Bank_Spouse Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
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
 INTO #P1_Household_Spouse_with_Applicant 
  FROM SRC_P1_TYPE_1
  where Applicant_IDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen' AND Category = 'Household Category' 
  --#P1_Household_Spouse_with_Applicant


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
								WHEN FullName_Bank_Spouse = 'BANK 01' THEN  '01'
								WHEN FullName_Bank_Spouse = 'BANK 02' THEN  '02'
								WHEN FullName_Bank_Spouse = 'BANK 03' THEN  '03'
								WHEN FullName_Bank_Spouse = 'BANK 04' THEN  '04'
								WHEN FullName_Bank_Spouse = 'BANK 05' THEN  '05'
								WHEN FullName_Bank_Spouse = 'BANK 06' THEN  '06'
								WHEN FullName_Bank_Spouse = 'BANK 07' THEN  '07'
								WHEN FullName_Bank_Spouse = 'BANK 09' THEN  '09'
								WHEN FullName_Bank_Spouse = 'BANK 10' THEN  '10'
								WHEN FullName_Bank_Spouse = 'BANK 11' THEN  '11'
								WHEN FullName_Bank_Spouse = 'BANK 12' THEN  '12'
								WHEN FullName_Bank_Spouse = 'BANK 13' THEN  '13'
								WHEN FullName_Bank_Spouse = 'BANK 14' THEN  '14'
								WHEN FullName_Bank_Spouse = 'BANK 15' THEN  '15'
								WHEN FullName_Bank_Spouse = 'BANK 16' THEN  '16'
								WHEN FullName_Bank_Spouse = 'BANK 17' THEN  '17'
								WHEN FullName_Bank_Spouse = 'BANK 18' THEN  '18'
								WHEN FullName_Bank_Spouse = 'BANK 22' THEN  '22'
								WHEN FullName_Bank_Spouse = 'BANK 23' THEN  '23'
								WHEN FullName_Bank_Spouse = 'BANK 24' THEN  '24'
								WHEN FullName_Bank_Spouse = 'BANK 27' THEN  '27'
								WHEN FullName_Bank_Spouse = 'BANK 28' THEN  '28'
								WHEN FullName_Bank_Spouse = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							Spouse_BankAccountNumber AS BankAccountNumber,--(14) FullName_Bank_Spouse Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'P1_Batch' AS SourceFile,--(16)
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
 INTO #P1_Spouse_with_blank_Applicant 
  FROM SRC_P1_TYPE_1
  WHERE Category = 'Household Category' AND Applicant_IDNumber = '' AND  Spouse_Citizenship = 'MalaysianCitizen'
  --#P1_Spouse_with_blank_Applicant


	 	SELECT x.* INTO  #P1_AllEligibilityCriteriaCombined  

	FROM 
	(
	SELECT * FROM #P1_SingleNoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #P1_SingleNoSpouse_Disabled WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	UNION
	SELECT * FROM #P1_NoKinNoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66
	UNION
	SELECT * FROM #P1_NoKinNoSpouse_Disabled WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	UNION
	SELECT * FROM #P1_Household_AllApplicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #P1_Household_Applicant_with_NoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #P1_Household_Applicant_with_Spouse WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #P1_Household_Applicant_with_SpouseNonMalaysian WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #P1_Household_Spouse_with_Applicant WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	UNION
	SELECT * FROM #P1_Spouse_with_blank_Applicant WHERE ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	) x


 /*
 B) P2

SELECT * FROM SRC_P2_TYPE_1   -- Senior Citizen
SELECT * FROM SRC_P2_TYPE_2  --  Single Applicant
SELECT * FROM SRC_P2_TYPE_3 -- Single Parent No Children
SELECT * FROM SRC_P2_TYPE_4 -- Applicant and Spouse
SELECT * FROM SRC_P2_TYPE_5-- Applicant , Spouse NonMalaysian
SELECT * FROM SRC_P2_TYPE_6 -- Applicant , Spouse MalaysianCitizen
SELECT * FROM SRC_P2_TYPE_7 -- Spouse MalaysianCitizen
 */

 	/****** P2 Processing ******/
	
		/****** P2 Processing ******/

o

--Type 1: Single


 SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P2_Single' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P2_SingleNoSpouse
  FROM SRC_P2_TYPE_2  
  WHERE Spouse_ICNo  = '' 
  -- #P2_SingleNoSpouse


   SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P2_Single' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17),--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_SingleNoSpouse_Disabled
   FROM SRC_P2_TYPE_2  
  WHERE Spouse_ICNo  = '' AND DisabledApplicant ='Y' 
  -- #P2_SingleNoSpouse_Disabled

--Type 2: Senior Citizen No Spouse

				SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P2_Batch' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_NoKinNoSpouse
  FROM SRC_P2_TYPE_1    
  WHERE Spouse_ICNo  = '' 
  -- #P2_NoKinNoSpouse

			SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P2_Batch' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_NoKinNoSpouse_Disabled
  FROM SRC_P2_TYPE_1    
  WHERE Spouse_ICNo  = '' AND DisabledApplicant ='Y'
  -- #P2_NoKinNoSpouse_Disabled


--Type 3: Household Category

				SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P2_SingleParent' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Household_Applicant_with_NoSpouse
 FROM SRC_P2_TYPE_3
 WHERE  Spouse_ICNo = ''
  -- #P2_Household_Applicant_with_NoSpouse


--Type 4: Household Category. Applicant and Spouse MalaysianCitizen

					SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P2_HH_Case4' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Household_AllApplicant
 FROM SRC_P2_TYPE_4
 where Applicant_IDNumber !='' 
  -- ##P2_Household_AllApplicant


					SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P2_HH_Case4' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Household_Applicant_with_Spouse
 FROM SRC_P2_TYPE_4
 where Applicant_IDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen' 
  -- #P2_Household_Applicant_with_Spouse


				SELECT Spouse_ICNo  AS NRIC,--(1)
							FullNameSpouse  AS FullName, 	--(2)
							Spouse_DOB AS DateofBirth,--(3)
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
								WHEN BankNameSpouse  = 'BANK 01' THEN  '01'
								WHEN BankNameSpouse  = 'BANK 02' THEN  '02'
								WHEN BankNameSpouse  = 'BANK 03' THEN  '03'
								WHEN BankNameSpouse  = 'BANK 04' THEN  '04'
								WHEN BankNameSpouse  = 'BANK 05' THEN  '05'
								WHEN BankNameSpouse  = 'BANK 06' THEN  '06'
								WHEN BankNameSpouse  = 'BANK 07' THEN  '07'
								WHEN BankNameSpouse  = 'BANK 09' THEN  '09'
								WHEN BankNameSpouse  = 'BANK 10' THEN  '10'
								WHEN BankNameSpouse  = 'BANK 11' THEN  '11'
								WHEN BankNameSpouse  = 'BANK 12' THEN  '12'
								WHEN BankNameSpouse  = 'BANK 13' THEN  '13'
								WHEN BankNameSpouse  = 'BANK 14' THEN  '14'
								WHEN BankNameSpouse  = 'BANK 15' THEN  '15'
								WHEN BankNameSpouse  = 'BANK 16' THEN  '16'
								WHEN BankNameSpouse  = 'BANK 17' THEN  '17'
								WHEN BankNameSpouse  = 'BANK 18' THEN  '18'
								WHEN BankNameSpouse  = 'BANK 22' THEN  '22'
								WHEN BankNameSpouse  = 'BANK 23' THEN  '23'
								WHEN BankNameSpouse  = 'BANK 24' THEN  '24'
								WHEN BankNameSpouse  = 'BANK 27' THEN  '27'
								WHEN BankNameSpouse  = 'BANK 28' THEN  '28'
								WHEN BankNameSpouse  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumberBankSpouse  AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P2_HH_Case4' AS SourceFile,--(16)
							CASE 
								WHEN DisabledSpouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_ICNo, 3, 2) = '01' AND substring (Spouse_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Spouse_DOB,3,2) > '25' AND SUBSTRING(Spouse_DOB,6,2) = '01' AND SUBSTRING(Spouse_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DOB,3,2) < '25' AND SUBSTRING(Spouse_DOB,6,2) = '01' AND SUBSTRING(Spouse_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DOB,3,2) > '25' AND SUBSTRING(Spouse_DOB,6,2) >= '01' AND SUBSTRING(Spouse_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DOB,3,2))*1
							   WHEN SUBSTRING(Spouse_DOB,3,2) < '25' AND SUBSTRING(Spouse_DOB,6,2) >= '01' AND SUBSTRING(Spouse_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Household_Spouse_with_Applicant 
  FROM SRC_P2_TYPE_4
  where Applicant_IDNumber !='' AND  Spouse_Citizenship = 'MalaysianCitizen'  
  -- #P2_Household_Spouse_with_Applicant

 		

--Type 5: Household Category, Spouse Not MalaysianCitizen

						SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P2_HH_Case5' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Household_Applicant_with_NonMalSpouse
 FROM [RawDataDB].[dbo].[P2_HH_Case5]
 where Applicant_IDNumber !='' 
  -- #P2_Household_Applicant_with_NonMalSpouse


--Type 6: Household Category, Spouse MalaysianCitizen
					SELECT Applicant_IDNumber AS NRIC,--(1)
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
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P2_HH_Case6' AS SourceFile,--(16)
							CASE 
								WHEN DisabledApplicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Household_with_Spouse_Over_or_Under_Age_Criteria
 FROM SRC_P2_TYPE_6 
 WHERE  Spouse_ICNo = ''
  -- #P2_Household_with_Spouse_Over_or_Under_Age_Criteria


--Type 7: Household Category, No Applicant Detail, Spouse MalaysianCitizen

	select * FROM SRC_P2_TYPE_7 where Spouse_ICNo  !='' AND Applicant_IDNumber  =''-- 0 Applicant in this file

				SELECT Spouse_ICNo AS NRIC,--(1)
							FullNameSpouse AS FullName, 	--(2)
							Spouse_DOB AS DateofBirth,--(3)
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
								WHEN BankNameSpouse  = 'BANK 01' THEN  '01'
								WHEN BankNameSpouse  = 'BANK 02' THEN  '02'
								WHEN BankNameSpouse  = 'BANK 03' THEN  '03'
								WHEN BankNameSpouse  = 'BANK 04' THEN  '04'
								WHEN BankNameSpouse  = 'BANK 05' THEN  '05'
								WHEN BankNameSpouse  = 'BANK 06' THEN  '06'
								WHEN BankNameSpouse  = 'BANK 07' THEN  '07'
								WHEN BankNameSpouse  = 'BANK 09' THEN  '09'
								WHEN BankNameSpouse  = 'BANK 10' THEN  '10'
								WHEN BankNameSpouse  = 'BANK 11' THEN  '11'
								WHEN BankNameSpouse  = 'BANK 12' THEN  '12'
								WHEN BankNameSpouse  = 'BANK 13' THEN  '13'
								WHEN BankNameSpouse  = 'BANK 14' THEN  '14'
								WHEN BankNameSpouse  = 'BANK 15' THEN  '15'
								WHEN BankNameSpouse  = 'BANK 16' THEN  '16'
								WHEN BankNameSpouse  = 'BANK 17' THEN  '17'
								WHEN BankNameSpouse  = 'BANK 18' THEN  '18'
								WHEN BankNameSpouse  = 'BANK 22' THEN  '22'
								WHEN BankNameSpouse  = 'BANK 23' THEN  '23'
								WHEN BankNameSpouse  = 'BANK 24' THEN  '24'
								WHEN BankNameSpouse  = 'BANK 27' THEN  '27'
								WHEN BankNameSpouse  = 'BANK 28' THEN  '28'
								WHEN BankNameSpouse  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumberBankSpouse  AS BankAccountNumber,--(14) FullName_Bank_Spouse Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'P2_HH_Case7' AS SourceFile,--(16)
							CASE 
								WHEN DisabledSpouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_ICNo, 3, 2) = '01' AND substring (Spouse_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(Spouse_DOB,3,2) > '25' AND SUBSTRING(Spouse_DOB,6,2) = '01' AND SUBSTRING(Spouse_DOB,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DOB,3,2) < '25' AND SUBSTRING(Spouse_DOB,6,2) = '01' AND SUBSTRING(Spouse_DOB,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DOB,3,2))*1 + 1
							   WHEN SUBSTRING(Spouse_DOB,3,2) > '25' AND SUBSTRING(Spouse_DOB,6,2) >= '01' AND SUBSTRING(Spouse_DOB,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(Spouse_DOB,3,2))*1
							   WHEN SUBSTRING(Spouse_DOB,3,2) < '25' AND SUBSTRING(Spouse_DOB,6,2) >= '01' AND SUBSTRING(Spouse_DOB,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(Spouse_DOB,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO  #P2_Spouse_with_blank_Applicant 
  FROM SRC_P2_TYPE_7 
  WHERE  Applicant_IDNumber = ''
  -- #P2_Spouse_with_blank_Applicant


		 	SELECT x.* INTO   #P2_AllEligibilityCriteriaCombined   
	FROM 
	(
	 SELECT * FROM  #P2_SingleNoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_SingleNoSpouse_Disabled WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	 UNION
	 SELECT * FROM  #P2_NoKinNoSpouse  WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_NoKinNoSpouse_Disabled WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
	 UNION
	 SELECT * FROM   #P2_Household_AllApplicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_Household_Applicant_with_NoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_Household_Applicant_with_Spouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_Household_Spouse_with_Applicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_Household_Applicant_with_NonMalSpouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_Household_with_Spouse_Over_or_Under_Age_Criteria  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 UNION
	 SELECT * FROM  #P2_Spouse_with_blank_Applicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
	 	) x


 /*
 C) P3

SELECT * FROM SRC_P3_TYPE_1  -- Single Applicant
SELECT * FROM SRC_P3_TYPE_2 -- Senior Citizen
SELECT * FROM SRC_P3_TYPE_3-- Single Parent No Children
SELECT * FROM SRC_P3_TYPE_4 -- Applicant and Spouse
SELECT * FROM SRC_P3_TYPE_5 -- Applicant , Spouse NonMalaysian
SELECT * FROM SRC_P3_TYPE_6 -- Applicant , Spouse MalaysianCitizen
SELECT * FROM SRC_P3_TYPE_7 -- Spouse MalaysianCitizen

 */

 		/****** P3 Processing ******/

--Type 1: Single. Applicant born 1959 to 2007

 SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P3_Single_DisabilityStatus_No' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO  #P3_Single_NoSpouse_DisabilityStatus_No
  FROM SRC_P3_TYPE_1   
  WHERE Spouse_ICNo  = '' AND Disabled_Applicant ='' 
  --#P3_SingleNoSpouse_DisabilityStatus_No


   SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P3_Single_DisabilityStatus_Yes' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17),--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_Single_NoSpouse_DisabilityStatus_Yes 
  FROM SRC_P3_TYPE_1  
  WHERE Spouse_ICNo  = '' AND Disabled_Applicant ='Y' 
  --#P3_Single_NoSpouse_DisabilityStatus_Yes


--Type 2: Senior Citizen No Spouse. Applicant born 1959 to 2007
	
				SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P3_SeniorCitizen_NoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_SeniorCitizen_NoSpouse
  FROM SRC_P3_TYPE_2 
  WHERE Spouse_ICNo  = '' 
  --#P3_SeniorCitizen_NoSpouse

 

			SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P2_Batch' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_SeniorCitizen_NoSpouse_DisabilityStatus_Yes 
  FROM SRC_P3_TYPE_2 
  WHERE Spouse_ICNo  = '' AND Disabled_Applicant ='Y'
  --#P3_SeniorCitizen_NoSpouse_DisabilityStatus_Yes


--Type 3: Household Category. Applicant born 1959 to 2007


				SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P3_SingleParent__Applicant_with_NoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_SingleParent_Applicant_with_NoSpouse
 FROM [RawDataDB].[dbo].[SingleParent]
 WHERE  Spouse_ICNo = ''
  --#P3_SingleParent_Applicant_with_NoSpouse


--Type 4: Household Category. Applicant and Spouse MalaysianCitizen born 1959 to 2007


					SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P3_HH Case 4__Applicant_with_SpouseMalaysianCitizen' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_HH_Case_4__Applicant_with_SpouseMalaysianCitizen
 FROM SRC_P3_TYPE_4
 where Applicant_IDNumber !='' AND  Spouse_CitizenshipStatus = 'MalaysianCitizen'
  --#P3_HH_Case_4__Applicant_with_SpouseMalaysianCitizen


				SELECT Spouse_ICNo  AS NRIC,--(1)
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
							Spouse_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN BankName_Spouse  = 'BANK 01' THEN  '01'
								WHEN BankName_Spouse  = 'BANK 02' THEN  '02'
								WHEN BankName_Spouse  = 'BANK 03' THEN  '03'
								WHEN BankName_Spouse  = 'BANK 04' THEN  '04'
								WHEN BankName_Spouse  = 'BANK 05' THEN  '05'
								WHEN BankName_Spouse  = 'BANK 06' THEN  '06'
								WHEN BankName_Spouse  = 'BANK 07' THEN  '07'
								WHEN BankName_Spouse  = 'BANK 09' THEN  '09'
								WHEN BankName_Spouse  = 'BANK 10' THEN  '10'
								WHEN BankName_Spouse  = 'BANK 11' THEN  '11'
								WHEN BankName_Spouse  = 'BANK 12' THEN  '12'
								WHEN BankName_Spouse  = 'BANK 13' THEN  '13'
								WHEN BankName_Spouse  = 'BANK 14' THEN  '14'
								WHEN BankName_Spouse  = 'BANK 15' THEN  '15'
								WHEN BankName_Spouse  = 'BANK 16' THEN  '16'
								WHEN BankName_Spouse  = 'BANK 17' THEN  '17'
								WHEN BankName_Spouse  = 'BANK 18' THEN  '18'
								WHEN BankName_Spouse  = 'BANK 22' THEN  '22'
								WHEN BankName_Spouse  = 'BANK 23' THEN  '23'
								WHEN BankName_Spouse  = 'BANK 24' THEN  '24'
								WHEN BankName_Spouse  = 'BANK 27' THEN  '27'
								WHEN BankName_Spouse  = 'BANK 28' THEN  '28'
								WHEN BankName_Spouse  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P3_HH Case 4_SpouseMalaysianCitizen_of_Applicant' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Spouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_ICNo, 3, 2) = '01' AND substring (Spouse_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_HH_Case_4_SpouseMalaysianCitizen_of_Applicant 
  FROM SRC_P3_TYPE_4
  where Applicant_IDNumber !='' AND  Spouse_CitizenshipStatus = 'MalaysianCitizen'  
  --#P3_HH_Case_4_SpouseMalaysianCitizen_of_Applicant

--Type 5: Household Category, Applicant born 1959 to 2007 and Spouse Not MalaysianCitizen

						SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P3_HH Case 5_ApplicantWithSpouseNonMalaysian' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_HH_Case_5_ApplicantWithSpouseMalaysianCitizen
 FROM SRC_P3_TYPE_5
 where Applicant_IDNumber !='' AND  Spouse_CitizenshipStatus = '' and DateofBirth_Applicant BETWEEN '1960-01-01' and '2008-12-31' 
  --#P3_HH_Case_5_ApplicantWithSpouseMalaysianCitizen


  						SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P3_HH Case 5_ApplicantWithSpouseNonMalaysian' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_HH_Case_5_ApplicantWithSpouseNonMalaysian
 FROM SRC_P3_TYPE_5
 where Applicant_IDNumber !='' AND  Spouse_CitizenshipStatus != '' 
  --#P3_HH_Case_5_ApplicantWithSpouseNonMalaysian

 

--Type 6: Household Category, Applicant born 1959 to 2007 and Spouse MalaysianCitizen born before 1958 or after 2008


					SELECT Applicant_IDNumber AS NRIC,--(1)
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
							Applicant_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN Applicant_BankName = 'BANK 01' THEN  '01'
								WHEN Applicant_BankName = 'BANK 02' THEN  '02'
								WHEN Applicant_BankName = 'BANK 03' THEN  '03'
								WHEN Applicant_BankName = 'BANK 04' THEN  '04'
								WHEN Applicant_BankName = 'BANK 05' THEN  '05'
								WHEN Applicant_BankName = 'BANK 06' THEN  '06'
								WHEN Applicant_BankName = 'BANK 07' THEN  '07'
								WHEN Applicant_BankName = 'BANK 09' THEN  '09'
								WHEN Applicant_BankName = 'BANK 10' THEN  '10'
								WHEN Applicant_BankName = 'BANK 11' THEN  '11'
								WHEN Applicant_BankName = 'BANK 12' THEN  '12'
								WHEN Applicant_BankName = 'BANK 13' THEN  '13'
								WHEN Applicant_BankName = 'BANK 14' THEN  '14'
								WHEN Applicant_BankName = 'BANK 15' THEN  '15'
								WHEN Applicant_BankName = 'BANK 16' THEN  '16'
								WHEN Applicant_BankName = 'BANK 17' THEN  '17'
								WHEN Applicant_BankName = 'BANK 18' THEN  '18'
								WHEN Applicant_BankName = 'BANK 22' THEN  '22'
								WHEN Applicant_BankName = 'BANK 23' THEN  '23'
								WHEN Applicant_BankName = 'BANK 24' THEN  '24'
								WHEN Applicant_BankName = 'BANK 27' THEN  '27'
								WHEN Applicant_BankName = 'BANK 28' THEN  '28'
								WHEN Applicant_BankName = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P3_HH Case 6_ApplicantWithNoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Applicant  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Applicant_IDNumber, 3, 2) = '01' AND substring (Applicant_IDNumber, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_IDNumber, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_IDNumber, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_IDNumber, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_HH_Case_6_ApplicantWithNoSpouse
 FROM SRC_P3_TYPE_6  
 WHERE  Spouse_ICNo = ''
  --##P3_HH_Case_6_ApplicantWithNoSpouse

--Type 7: Household Category, Applicant born before 1958 or after 2008 and Spouse MalaysianCitizen born before 1959 to 2007


				SELECT Spouse_ICNo AS NRIC,--(1)
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
							Spouse_Mobile AS MobileNumber,--(11)
							'' AS EmailAddress,--(12)
							CASE 
								WHEN BankName_Spouse  = 'BANK 01' THEN  '01'
								WHEN BankName_Spouse  = 'BANK 02' THEN  '02'
								WHEN BankName_Spouse  = 'BANK 03' THEN  '03'
								WHEN BankName_Spouse  = 'BANK 04' THEN  '04'
								WHEN BankName_Spouse  = 'BANK 05' THEN  '05'
								WHEN BankName_Spouse  = 'BANK 06' THEN  '06'
								WHEN BankName_Spouse  = 'BANK 07' THEN  '07'
								WHEN BankName_Spouse  = 'BANK 09' THEN  '09'
								WHEN BankName_Spouse  = 'BANK 10' THEN  '10'
								WHEN BankName_Spouse  = 'BANK 11' THEN  '11'
								WHEN BankName_Spouse  = 'BANK 12' THEN  '12'
								WHEN BankName_Spouse  = 'BANK 13' THEN  '13'
								WHEN BankName_Spouse  = 'BANK 14' THEN  '14'
								WHEN BankName_Spouse  = 'BANK 15' THEN  '15'
								WHEN BankName_Spouse  = 'BANK 16' THEN  '16'
								WHEN BankName_Spouse  = 'BANK 17' THEN  '17'
								WHEN BankName_Spouse  = 'BANK 18' THEN  '18'
								WHEN BankName_Spouse  = 'BANK 22' THEN  '22'
								WHEN BankName_Spouse  = 'BANK 23' THEN  '23'
								WHEN BankName_Spouse  = 'BANK 24' THEN  '24'
								WHEN BankName_Spouse  = 'BANK 27' THEN  '27'
								WHEN BankName_Spouse  = 'BANK 28' THEN  '28'
								WHEN BankName_Spouse  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14) FullName_Bank_Spouse Spouse_BankAccountNumber
							'1' AS MaritalStatus,--(15)
							 'P3_HH Case 7_SpouseWithNoApplicant' AS SourceFile,--(16)
							CASE 
								WHEN Disabled_Spouse  = 'Y' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17)
							 CASE WHEN substring(Spouse_ICNo, 3, 2) = '01' AND substring (Spouse_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Spouse_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Spouse_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Spouse_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) = '01' AND SUBSTRING(DateofBirth_Spouse,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) > '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Spouse,3,2) < '25' AND SUBSTRING(DateofBirth_Spouse,6,2) >= '01' AND SUBSTRING(DateofBirth_Spouse,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Spouse,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
 INTO #P3_HH_Case_7_SpouseWithNoApplicant
  FROM SRC_P3_TYPE_7 
  WHERE  Applicant_IDNumber = ''
  --#P3_HH_Case_7_SpouseWithNoApplicant

		 	SELECT x.* INTO  #P3_AllEligibilityCriteriaCombined   
	FROM 
	(
SELECT * FROM #P3_Single_NoSpouse_DisabilityStatus_No WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #P3_Single_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
UNION
SELECT * FROM #P3_SeniorCitizen_NoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #P3_SeniorCitizen_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
UNION
SELECT * FROM #P3_SingleParent_Applicant_with_NoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
UNION
SELECT * FROM #P3_HH_Case_4__Applicant_with_SpouseMalaysianCitizen  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
UNION
SELECT * FROM #P3_HH_Case_4_SpouseMalaysianCitizen_of_Applicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
UNION
SELECT * FROM #P3_HH_Case_5_ApplicantWithSpouseMalaysianCitizen  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #P3_HH_Case_5_ApplicantWithSpouseNonMalaysian  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #P3_HH_Case_6_ApplicantWithNoSpouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM #P3_HH_Case_7_SpouseWithNoApplicant  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66
	 	) x


/*
D) P4
SELECT * FROM SRC_P4_TYPE_1--  Single Applicant
SELECT * FROM SRC_P4_TYPE_2 -- Single Parent No Children
SELECT * FROM SRC_P4_TYPE_3 -- Applicant and Spouse
SELECT * FROM SRC_P4_TYPE_4 -- Applicant , Spouse NonMalaysian
SELECT * FROM SRC_P4_TYPE_5 -- Applicant , Spouse MalaysianCitizen
SELECT * FROM SRC_P4_TYPE_6 -- Spouse MalaysianCitizen
SELECT * FROM SRC_P4_TYPE_7 -- Senior Citizen
*/

/****** P4 Processing ******/

SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P4_Single_DisabilityStatus_No' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_Single_NoSpouse_DisabilityStatus_No
  FROM  SRC_P4_TYPE_1  AS t
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
  --#P4_SingleNoSpouse_DisabilityStatus_No


  SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'3' AS MaritalStatus,--(15)
							 'P4_Single_DisabilityStatus_Yes' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_Single_NoSpouse_DisabilityStatus_Yes
  FROM  SRC_P4_TYPE_1  AS t
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
  --#P4_P_SingleNoSpouse_DisabilityStatus_Yes

		 SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_SingleParent' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_SingleParent_Applicant_with_NoSpouse
 FROM SRC_P4_TYPE_2 AS t
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
  --#P4_SingleParent_Applicant_with_NoSpouse

	
			 SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_HH Case 4_Applicant_with_SpouseMalaysianCitizen' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_HH_Case_4__Applicant_with_SpouseMalaysianCitizen
 FROM SRC_P4_TYPE_3 AS t
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
 where Applicant_ICNo !='' AND  Spouse_Citizenship = 'MalaysianCitizen' 
  --#P4_HH_Case_4__Applicant_with_SpouseMalaysianCitizen


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
									WHEN BankName_Spouse  = 'BANK 01' THEN  '01'
									WHEN BankName_Spouse  = 'BANK 02' THEN  '02'
									WHEN BankName_Spouse  = 'BANK 03' THEN  '03'
									WHEN BankName_Spouse  = 'BANK 04' THEN  '04'
									WHEN BankName_Spouse  = 'BANK 05' THEN  '05'
									WHEN BankName_Spouse  = 'BANK 06' THEN  '06'
									WHEN BankName_Spouse  = 'BANK 07' THEN  '07'
									WHEN BankName_Spouse  = 'BANK 09' THEN  '09'
									WHEN BankName_Spouse  = 'BANK 10' THEN  '10'
									WHEN BankName_Spouse  = 'BANK 11' THEN  '11'
									WHEN BankName_Spouse  = 'BANK 12' THEN  '12'
									WHEN BankName_Spouse  = 'BANK 13' THEN  '13'
									WHEN BankName_Spouse  = 'BANK 14' THEN  '14'
									WHEN BankName_Spouse  = 'BANK 15' THEN  '15'
									WHEN BankName_Spouse  = 'BANK 16' THEN  '16'
									WHEN BankName_Spouse  = 'BANK 17' THEN  '17'
									WHEN BankName_Spouse  = 'BANK 18' THEN  '18'
									WHEN BankName_Spouse  = 'BANK 21' THEN  '21'
									WHEN BankName_Spouse  = 'BANK 22' THEN  '22'
									WHEN BankName_Spouse  = 'BANK 23' THEN  '23'
									WHEN BankName_Spouse  = 'BANK 24' THEN  '24'
									WHEN BankName_Spouse  = 'BANK 26' THEN  '26'
									WHEN BankName_Spouse  = 'BANK 27' THEN  '27'
									WHEN BankName_Spouse  = 'BANK 28' THEN  '28'
									WHEN BankName_Spouse  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_HH Case 4_SpouseMalaysianCitizen_of_Applicant' AS SourceFile,--(16)
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
INTO #P4_HH_Case_4_SpouseMalaysianCitizen_of_Applicant 
  FROM SRC_P4_TYPE_3 AS t
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
  --#P4_HH_Case_4_SpouseMalaysianCitizen_of_Applicant


					SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_HH Case 5_ApplicantWithSpouseMalaysianCitizen' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_HH_Case_5_Applicant
 FROM SRC_P4_TYPE_4 AS t
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

  --#P4_HH_Case_5_Applicant


 SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_HH_Case_6_ApplicantWithNoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_HH_Case_6_ApplicantWithNoSpouse
 FROM SRC_P4_TYPE_5 AS t
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
  --#P4_HH_Case_6_ApplicantWithNoSpouse

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
									WHEN BankName_Spouse  = 'BANK 01' THEN  '01'
									WHEN BankName_Spouse  = 'BANK 02' THEN  '02'
									WHEN BankName_Spouse  = 'BANK 03' THEN  '03'
									WHEN BankName_Spouse  = 'BANK 04' THEN  '04'
									WHEN BankName_Spouse  = 'BANK 05' THEN  '05'
									WHEN BankName_Spouse  = 'BANK 06' THEN  '06'
									WHEN BankName_Spouse  = 'BANK 07' THEN  '07'
									WHEN BankName_Spouse  = 'BANK 09' THEN  '09'
									WHEN BankName_Spouse  = 'BANK 10' THEN  '10'
									WHEN BankName_Spouse  = 'BANK 11' THEN  '11'
									WHEN BankName_Spouse  = 'BANK 12' THEN  '12'
									WHEN BankName_Spouse  = 'BANK 13' THEN  '13'
									WHEN BankName_Spouse  = 'BANK 14' THEN  '14'
									WHEN BankName_Spouse  = 'BANK 15' THEN  '15'
									WHEN BankName_Spouse  = 'BANK 16' THEN  '16'
									WHEN BankName_Spouse  = 'BANK 17' THEN  '17'
									WHEN BankName_Spouse  = 'BANK 18' THEN  '18'
									WHEN BankName_Spouse  = 'BANK 21' THEN  '21'
									WHEN BankName_Spouse  = 'BANK 22' THEN  '22'
									WHEN BankName_Spouse  = 'BANK 23' THEN  '23'
									WHEN BankName_Spouse  = 'BANK 24' THEN  '24'
									WHEN BankName_Spouse  = 'BANK 26' THEN  '26'
									WHEN BankName_Spouse  = 'BANK 27' THEN  '27'
									WHEN BankName_Spouse  = 'BANK 28' THEN  '28'
									WHEN BankName_Spouse  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Spouse  AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_HH Case 7_SpouseMalaysianCitizen_of_Applicant' AS SourceFile,--(16)
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
INTO #P4_HH_Case_7_SpouseWithNoApplicant
  FROM SRC_P4_TYPE_6 AS t
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
  --#P4_HH_Case_7_SpouseWithNoApplicant


SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_Senior Citizen_NoSpouse' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_SeniorCitizen_NoSpouse
 FROM SRC_P4_TYPE_7   AS t
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
 --#P4_SeniorCitizen_NoSpouse


 
			SELECT Applicant_ICNo AS NRIC,--(1)
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
									WHEN Applicant_BankName  = 'BANK 01' THEN  '01'
									WHEN Applicant_BankName  = 'BANK 02' THEN  '02'
									WHEN Applicant_BankName  = 'BANK 03' THEN  '03'
									WHEN Applicant_BankName  = 'BANK 04' THEN  '04'
									WHEN Applicant_BankName  = 'BANK 05' THEN  '05'
									WHEN Applicant_BankName  = 'BANK 06' THEN  '06'
									WHEN Applicant_BankName  = 'BANK 07' THEN  '07'
									WHEN Applicant_BankName  = 'BANK 09' THEN  '09'
									WHEN Applicant_BankName  = 'BANK 10' THEN  '10'
									WHEN Applicant_BankName  = 'BANK 11' THEN  '11'
									WHEN Applicant_BankName  = 'BANK 12' THEN  '12'
									WHEN Applicant_BankName  = 'BANK 13' THEN  '13'
									WHEN Applicant_BankName  = 'BANK 14' THEN  '14'
									WHEN Applicant_BankName  = 'BANK 15' THEN  '15'
									WHEN Applicant_BankName  = 'BANK 16' THEN  '16'
									WHEN Applicant_BankName  = 'BANK 17' THEN  '17'
									WHEN Applicant_BankName  = 'BANK 18' THEN  '18'
									WHEN Applicant_BankName  = 'BANK 21' THEN  '21'
									WHEN Applicant_BankName  = 'BANK 22' THEN  '22'
									WHEN Applicant_BankName  = 'BANK 23' THEN  '23'
									WHEN Applicant_BankName  = 'BANK 24' THEN  '24'
									WHEN Applicant_BankName  = 'BANK 26' THEN  '26'
									WHEN Applicant_BankName  = 'BANK 27' THEN  '27'
									WHEN Applicant_BankName  = 'BANK 28' THEN  '28'
									WHEN Applicant_BankName  = 'BANK 29' THEN  '29'

								ELSE ' '
								END	AS BankName, --(13)

							BankAccountNumber_Applicant AS BankAccountNumber,--(14)
							'1' AS MaritalStatus,--(15)
							 'P4_Senior Citizen_NoSpouse_NoSpouse_DisabilityStatus_Yes' AS SourceFile,--(16)
							CASE 
								WHEN Ind_DisabilityStatus_Applicant  = 'Yes' THEN  'Y'
								ELSE 'N'
								END	AS  Indicator_DisabilityStatus_,--(17),--(17)
							 CASE WHEN substring(Applicant_ICNo, 3, 2) = '01' AND substring (Applicant_ICNo, 5, 2) = '01' 
								 THEN CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1 + 1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 + 1 END
								 ELSE CASE WHEN CAST(LEFT(Applicant_ICNo, 2) AS INT) < 20 THEN 2026 - CONCAT('20', LEFT(Applicant_ICNo, 2))*1
										   ELSE 2026 - CONCAT('19', LEFT(Applicant_ICNo, 2))*1 END
								 END AS ANB_FromNRIC, --(18)

							CASE WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) = '01' AND SUBSTRING(DateofBirth_Applicant,9,2) = '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1 + 1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) > '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('19',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   WHEN SUBSTRING(DateofBirth_Applicant,3,2) < '25' AND SUBSTRING(DateofBirth_Applicant,6,2) >= '01' AND SUBSTRING(DateofBirth_Applicant,9,2) >= '01' THEN '2026' - CONCAT('20',SUBSTRING(DateofBirth_Applicant,3,2))*1
							   ELSE  '999' END AS ANB_FromDateofBirth --(19)
INTO #P4_SeniorCitizen_NoSpouse_DisabilityStatus_Yes 
  FROM SRC_P4_TYPE_7 AS t
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
  --#P4_SeniorCitizen_NoSpouse_DisabilityStatus_Yes


     	SELECT x.* INTO  #P4_AllEligibilityCriteriaCombined     
	FROM 
	(
SELECT * FROM  #P4_Single_NoSpouse_DisabilityStatus_No WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM  #P4_Single_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y' 
UNION
SELECT * FROM  #P4_SingleParent_Applicant_with_NoSpouse  WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM  #P4_HH_Case_4__Applicant_with_SpouseMalaysianCitizen WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66   
UNION
SELECT * FROM  #P4_HH_Case_4_SpouseMalaysianCitizen_of_Applicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66   
UNION
SELECT * FROM  #P4_HH_Case_5_Applicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66	
UNION
SELECT * FROM  #P4_HH_Case_6_ApplicantWithNoSpouse WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 
UNION
SELECT * FROM  #P4_HH_Case_7_SpouseWithNoApplicant WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66	
UNION
SELECT * FROM  #P4_SeniorCitizen_NoSpouse WHERE ANB_FromDateofBirth >= 22 AND ANB_FromDateofBirth <=66	
UNION
SELECT * FROM  #P4_SeniorCitizen_NoSpouse_DisabilityStatus_Yes WHERE  ANB_FromDateofBirth >= 19 AND ANB_FromDateofBirth <=66 AND Indicator_DisabilityStatus_ ='Y'  
 
	 	) x
		
     SELECT x.* INTO  #AllEligibilityCriteriaCombined      
	FROM 
	(
SELECT * FROM  #P1_AllEligibilityCriteriaCombined
UNION
SELECT * FROM  #P2_AllEligibilityCriteriaCombined
UNION
SELECT * FROM  #P3_AllEligibilityCriteriaCombined
UNION
SELECT * FROM  #P4_AllEligibilityCriteriaCombined
	 	) x


--Exclude spouses who are Permanent Residents or Non-Citizens
SELECT * INTO #AllEligibilityCriteriaCombined_ FROM #AllEligibilityCriteriaCombined
WHERE NRIC NOT IN /*IN*/
(SELECT Spouse_NRICNumber  FROM SRC_P4_TYPE_4 where Spouse_Citizenship ='Permanent Resident' OR Spouse_Citizenship ='NonCitizen and Non Permanent Resident') 
--0 Spouse Permanent Resident or NonCitizen and Non Permanent Resident in ##AllEligibilityCriteriaCombined.To exclude

/*
SELECT * INTO [WorkingDB].[dbo].[AllEligibilityCriteriaCombined] FROM #AllEligibilityCriteriaCombined_ /**/
*/


--CheckDuplicateNRIC

SELECT DISTINCT NRIC FROM  #AllEligibilityCriteriaCombined_
	--#AllEligibilityCriteriaCombined: count of unique NRIC
	
	SELECT TOP(10)*FROM  #AllEligibilityCriteriaCombined_
	SELECT TOP(10)*FROm  [WorkingDB].[dbo].[AllEligibilityCriteriaCombined]

	SELECT *FROM  #AllEligibilityCriteriaCombined_ where ANB_FromDateofBirth != ANB_FromNRIC
--Records where ANB_FromDateofBirth != ANB_FromNRIC

	SELECT *FROM  #AllEligibilityCriteriaCombined_ where ANB_FromDateofBirth = '' or  ANB_FromNRIC = ''
	SELECT *FROM  #AllEligibilityCriteriaCombined_ where ANB_FromDateofBirth = '' 
	SELECT *FROM  #AllEligibilityCriteriaCombined_ where ANB_FromNRIC = '' 

	SELECT distinct ANB_FromDateofBirth FROM  #AllEligibilityCriteriaCombined_ GROUP BY ANB_FromDateofBirth ORDER BY ANB_FromDateofBirth ASC
	--ANB 19 to 66
	SELECT distinct ANB_FromNRIC FROM  #AllEligibilityCriteriaCombined_ GROUP BY ANB_FromNRIC ORDER BY ANB_FromNRIC ASC
	--ANB 19 to 86
	SELECT * FROM  #AllEligibilityCriteriaCombined_ WHERE  ANB_FromNRIC > 66
	--Some records would be excluded if ANB_FromNRIC were used instead. To proceed
	 
	SELECT distinct DateofBirth  FROM  #AllEligibilityCriteriaCombined_ GROUP BY DateofBirth ORDER BY DateofBirth ASC /*DESC*/
	--Earliest DateofBirth 1960-01-02, latest DateofBirth 2007-12-31. OK

	SELECT NRIC, SourceFile, COUNT(NRIC) AS OccuranceNNRIC FROM #AllEligibilityCriteriaCombined_ 
	GROUP BY NRIC, SourceFile
	HAVING COUNT(NRIC) > 2 /*2/3/4*/
	ORDER BY NRIC ASC
	--NRICs appearing more than once


		;WITH Ranked AS
		(
			SELECT NRIC,FullName,DateofBirth, Gender,AddressLine1,AddressLine2,AddressLine3,Postcode,City,State,MobileNumber,EmailAddress,BankName,BankAccountNumber,MaritalStatus,
				   ROW_NUMBER() OVER (PARTITION BY NRIC ORDER BY (SELECT NULL)) AS rn
			FROM #AllEligibilityCriteriaCombined_
		)
		SELECT *
		INTO #AllEligibilityCriteriaCombined_DuplicateRemoved 
		FROM Ranked
		WHERE rn = 1;

	_______________________________________________________________________________________________________________________________
--Remove Non Malaysian, Sanctioned Persons & Claims Negative List

SELECT * 
INTO #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved 
FROM #AllEligibilityCriteriaCombined_DuplicateRemoved WHERE NRIC /*IN*/ NOT IN (SELECT NRIC FROM [WorkingDB].[dbo].[SanctionedPersons])

--Records matching the Sanctioned Persons list, to exclude


SELECT *
INTO #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen    
FROM #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved WHERE NRIC /*IN*/  NOT IN (SELECT NRIC from [WorkingDB].[dbo].[NonCitizen])
--Records matching the Non-Citizen list, to exclude
--AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen


 SELECT * 
INTO #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd  
FROM #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen WHERE NRIC /*IN*/  NOT IN (SELECT NRIC FROM [WorkingDB].[dbo].[ClaimsNegativeList])

/*


--Records matching the Claims Negative List, to exclude
*/


AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd


SELECT * INTO  [WorkingDB].[dbo].[AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd] FROM  #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd 

drop table #TEMP_AllYears
______________________________________________________________________________________________________________________________________
--Check new to The Scheme coverage

			SELECT x.* INTO  #TEMP_AllYears

	FROM (
	SELECT '2019' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2019]
	UNION  
	SELECT '2020' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2020]
	UNION  
	SELECT '2021' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2021]
	UNION  
	SELECT '2022' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2022]	
	UNION  
	SELECT '2023' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2023]	
	UNION  
	SELECT '2024' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2024]
	UNION  
	SELECT '2025' AS EligibilityYear,* FROM [EligibilityDB].[dbo].[Eligible_2025]
	) x

	SELECT *
	INTO #TEMPNewtoScheme 
	FROM #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd WHERE NRIC /*IN*/ NOT  IN (SELECT NRIC FROM #TEMP_AllYears)
	--Records ALREADY IN The Scheme under prior years
	--New records to The Scheme. Check why so many & are they in Eligible_2025? If not why?

	SELECT TOP(10)* FROM #TEMPNewtoScheme

	SELECT *
	FROM #TEMPNewtoScheme WHERE NRIC /*IN*/ NOT IN (SELECT NRIC FROM [EligibilityDB].[dbo].[Eligible_2025])
	--are they in Eligible_2025? No

	SELECT DISTINCT DateofBirth, COUNT (DateofBirth)  AS COUNTDateofBirth FROM #TEMPNewtoScheme GROUP BY DateofBirth ORDER BY DateofBirth asc
	/*

	Total born year 2004
	Total born year 2007
	*/

	SELECT DISTINCT MaritalStatus, COUNT (MaritalStatus) AS COUNTMaritalStatus   FROM #TEMPNewtoScheme  GROUP BY MaritalStatus ORDER BY MaritalStatus ASC
	

	--New records to The Scheme split by Marital Status 3 and 1. OK

	______________________________________________________________________________________________________________________________________
--Create Eligible_2026

	SELECT *
	INTO [EligibilityDB].[dbo].[Eligible_2026] 
	FROM #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd

	SELECT COUNT (NRIC) FROM #AllEligibilityCriteriaCombined_DuplicateRemoved_SanctionedRemoved_NonCitizen_ClmNegListRmvd

	select top(10)* from  [EligibilityDB].[dbo].[Eligible_2026]

	SELECT *
	INTO  [WorkingDB].[dbo].[CoreUpload_New] 
	FROM [EligibilityDB].[dbo].[Eligible_2026] WHERE NRIC NOT IN (SELECT NRIC FROM #TEMP_AllYears)

	SELECT *
	INTO  [WorkingDB].[dbo].[CoreUpload_Returning] 
	FROM [EligibilityDB].[dbo].[Eligible_2026] WHERE NRIC  IN (SELECT NRIC FROM #TEMP_AllYears)

	select top(10)* from  [WorkingDB].[dbo].[CoreUpload_Returning] 
	______________________________________________________________________________________________________________________________________
--Amendment to data [EligibilityDB].[dbo].[Eligible_2026]
/*
Due to issue found for
A) Misspelled names in a small number of records.
Correct names were sourced from other reference data and loaded into #NameCorrections (NRIC, CorrectedName).
*/

SELECT e.NRIC, e.FullName, c.CorrectedName
FROM [EligibilityDB].[dbo].[Eligible_2026] e
JOIN #NameCorrections c ON c.NRIC = e.NRIC

UPDATE e
  SET e.FullName = c.CorrectedName
FROM [EligibilityDB].[dbo].[Eligible_2026] e
JOIN #NameCorrections c ON c.NRIC = e.NRIC


/*
B)
Blank AddressLine1, Postcode, City, State
*/

 select count(AddressLine1) from [EligibilityDB].[dbo].[Eligible_2026] where AddressLine1 =''
 --Records with blank AddressLine1
  select count(Postcode) from [EligibilityDB].[dbo].[Eligible_2026] where Postcode =''
--Records with blank Postcode
    select count(City) from [EligibilityDB].[dbo].[Eligible_2026] where City =''
--Records with blank City
    select count(State) from [EligibilityDB].[dbo].[Eligible_2026] where State =''
--Records with blank State


UPDATE [EligibilityDB].[dbo].[Eligible_2026]
  SET AddressLine1 = 'AddressLine1'
  WHERE AddressLine1 = ''

UPDATE [EligibilityDB].[dbo].[Eligible_2026]
  SET Postcode = '10000'
  WHERE Postcode = ''

UPDATE [EligibilityDB].[dbo].[Eligible_2026]
  SET City = 'City'
  WHERE City = ''

UPDATE [EligibilityDB].[dbo].[Eligible_2026]
  SET State = 'State'
  WHERE State = ''


   select count(AddressLine1) from [EligibilityDB].[dbo].[Eligible_2026] where AddressLine1 =''
 --0 records with blank AddressLine1
  select count(Postcode) from [EligibilityDB].[dbo].[Eligible_2026] where Postcode =''
--0 records with blank Postcode
    select count(City) from [EligibilityDB].[dbo].[Eligible_2026] where City =''
--0 records with blank City
    select count(State) from [EligibilityDB].[dbo].[Eligible_2026] where State =''
--0 records with blank State


ALTER TABLE [EligibilityDB].[dbo].[Eligible_2026]
DROP COLUMN rn;

ALTER TABLE [WorkingDB].[dbo].[CoreUpload_Returning] 
DROP COLUMN rn;

ALTER TABLE [WorkingDB].[dbo].[CoreUpload_New] 
DROP COLUMN rn;
