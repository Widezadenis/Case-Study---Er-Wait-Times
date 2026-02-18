--Checks for Average wait time for patients (81 minutes)
SELECT 
    AVG(Total_Wait_Time_min) as Avg_wait_time
FROM dbo.ER_Wait_Times;

--Checks for what season/day/time has the highest wait time
SELECT  
    Season, 
    MAX(Total_Wait_Time_min) As Max_wait_time
FROM dbo.ER_Wait_Times
GROUP BY Season
ORDER BY Max_wait_time DESC;

SELECT 
    Day_of_Week, 
    MAX(Total_Wait_Time_min) As Max_wait_time
FROM dbo.ER_Wait_Times
GROUP BY Day_of_Week
ORDER BY Max_wait_time DESC;

SELECT 
    Time_of_Day, 
    MAX(Total_Wait_Time_min) As Max_wait_time
FROM dbo.ER_Wait_Times
GROUP BY Time_of_Day
ORDER BY Max_wait_time DESC;

-- Checks for Correlation between 'Nurse-to-Patient-Ratio' and 'Total Wait Time' during peak hours
SELECT 
    Nurse_to_Patient_Ratio, 
    Time_of_Day, 
    Avg(Total_Wait_Time_min) AS avg_wait
FROM dbo.ER_Wait_Times
WHERE Time_of_Day IN ('Evening')
GROUP BY Nurse_to_Patient_Ratio, Time_of_Day
ORDER BY Nurse_to_Patient_Ratio

-- Checks if availability of a specialist reduces overall wait time
SELECT Specialist_Availability, 
    AVG(Total_Wait_Time_min) AS avg_total_wait
FROM dbo.ER_Wait_Times
GROUP BY Specialist_Availability
ORDER BY Specialist_Availability ASC;

-- Checks if specialist availability shifts the bottleneck to another stage of the process (registration or triage)
SELECT 
    Specialist_Availability, 
    AVG(Total_Wait_Time_min) AS avg_wait,
    AVG(Time_to_Registration_min) AS avg_rigstration_time,
    AVG(Time_to_Triage_min) AS avg_triage_time, 
    AVG(Time_to_Medical_Professional_min) AS avg_doc_time,
    -- Calculates what percentage of total wait is spent at each stage
    AVG(Time_to_Registration_min) * 1.0 / AVG(Total_Wait_Time_min) * 100 AS registration_percentage,
    AVG(Time_to_Triage_min) * 1.0 / AVG(Total_Wait_Time_min) * 100 AS triage_percentage,
    AVG(Time_to_Medical_Professional_min) * 1.0 / AVG(Total_Wait_Time_min) * 100 AS doc_time_percentage
FROM dbo.ER_Wait_Times
GROUP BY Specialist_Availability
ORDER BY Specialist_Availability;