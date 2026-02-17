# Case-Study---Er-Wait-Times

# Introduction: 
This case study analyzes Emergency Room operational data to identify the root causes of longer wait times. By quantifying bottlenecks in patient flow, this analysis aims to provide data-driven recommendations to reduce the 'Door-to-Doc' time, ultimately improving both patient throughput and satisfaction scores.

##### Stakeholders:
Hospital administrators, ER department heads, shift managers

##### Key Questions:
-   What is the current average wait time?
-   What times of the day/week are waiting times the longest?
-   Is there a correlation between 'Nurse-to-Patient-Ratio' and 'Total Wait Time' during peak hours?
-   Does the availability of a speciacilst reduce overall wait time or does it shift wait times? 

## Data Overview

##### Source: 
- River, 2025. Er Wait Time. (Version 2) [Data Set].Kaggle.(https://www.kaggle.com/datasets/rivalytics/er-wait-time/data?select=ER+Wait+Time+Dataset.csv)
- Note: This is sunthetic/historical data intended for porfolio use and does not contain any Protected Health Information. 
  
##### Data Structure:

| Column Name | Type | Description |
| ---  | --- | --- |
| Visit ID | nvarchar(50) | Unique Identifier |
| Patient ID | nvarchar(50) | Unique Identifier |
| Hospital ID | nvarchar(50) | Unique Identifier |
| Hospital Name | nvarchar(50) | Name of Hospital |
| Region | nvarchar(50) | Classification as Urban or Rural |
| Visit Date | datetime2(7) | Time and date of visit |
| Day of Week | nvarchar(50) | Day of Week (Monday, Tuesday) |
| Season | nvarchar(50) | Time of year (Winter, Spring, Summer, Fall) |
| Time of Day | nvarchar(50) | Time visited (Early morning, Afternoon) |
| Urgency Level | nvarchar(50) | (Urgency Classification (Critical, High, Medium, Low.) |
| Nurse-to-Patient Ratio | tinyint | Nurse to patient ratio during visits |
| Specialist Availability| tinyint | Number of specialist available during visits |
| Facility Size (Beds)| tinyint | Number of beds available during visits |
| Time to Registration (min) | tinyint | Check in time |
| Time to Triage (min) | tinyint | Time taken to compelete triage assessment |
| Time to Medical Professional (min) | tinyint | Patient to Doc time |
|  Total Wait Time (min) | smallint | lenth of stay |
|  Patient Outcome | nvarchar(50) | Outcome of visit (Discharged, Admitted, Left Without being seen)|
|  Patient Satisfaction | tinyint | Satifaction score (1 to 5, 5 being the highest) |

## Data Cleaning
- Confirmed there are no missing values
- Removed Duplicates
- Checked for outliers






