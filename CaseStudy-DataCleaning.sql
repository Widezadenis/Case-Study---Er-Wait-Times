-- Preview Dataset
SELECT * 
FROM dbo.ER_Wait_Times;

-- Checks for Nulls
SELECT *
FROM dbo.ER_Wait_Times
WHERE Visit_ID is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Patient_ID is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Hospital_ID is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Hospital_Name is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Region is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Visit_Date is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Day_of_Week is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Season is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Time_of_Day is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Urgency_Level is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Nurse_to_Patient_Ratio is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Specialist_Availability is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Facility_Size_Beds is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Time_to_Registration_min is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Time_to_Triage_min is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Time_to_Medical_Professional_min is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Total_Wait_Time_min is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Patient_Outcome is NULL;

SELECT *
FROM dbo.ER_Wait_Times
WHERE Patient_Satisfaction is NULL;

-- Removes Duplicates
SELECT DISTINCT *
FROM dbo.ER_Wait_Times;

-- Check for outliers
SELECT Hospital_Name, Total_Wait_Time_min
FROM dbo.ER_Wait_Times
ORDER BY Total_Wait_Time_min;