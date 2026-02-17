# Case-Study---Er-Wait-Times

# Introduction: 
This case study analyzes Emergency Room operational data to identify the root causes of longer wait times. By quantifying bottlenecks in patient flow, this analysis aims to provide data-driven recommendations to reduce the 'Door-to-Doc' time, ultimately improving both patient throughput and satisfaction scores.

##### Stakeholders:
Hospital administrators, ER department heads, shift managers

##### Key Questions:
-   What is the current average wait time?
-   What times of the day/week are waiting times the longest?
-   Is there a correlation between 'Nurse-to-Patient-Ratio' and 'Total Wait Time' during peak hours?
-   Does the availability of a specialist reduce overall wait time or does it shift to another stage of the process? 

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
| Visit Date | datetime(7) | Time and date of visit |
| Day of Week | nvarchar(50) | Day of Week (Monday, Tuesday) |
| Season | nvarchar(50) | Time of year (Winter, Spring, Summer, Fall) |
| Time of Day | nvarchar(50) | Time visited (Early morning, Afternoon) |
| Urgency Level | nvarchar(50) | (Urgency Classification (Critical, High, Medium, Low.) |
| Nurse-to-Patient Ratio | decimal(2,1) | Nurse to patient ratio during visits |
| Specialist Availability| int | Number of specialist available during visits |
| Facility Size (Beds)| int | Number of beds available during visits |
| Time to Registration (min) | int | Check in time |
| Time to Triage (min) | int | Time taken to compelete triage assessment |
| Time to Medical Professional (min) | int | Patient to Doc time |
|  Total Wait Time (min) | int | lenth of stay |
|  Patient Outcome | nvarchar(50) | Outcome of visit (Discharged, Admitted, Left Without being seen)|
|  Patient Satisfaction | int | Satifaction score (1 to 5, 5 being the highest) |

## Data Cleaning
- Missing Values: Confirmed the dateset contains 0 null values accross all 19 columns
- Duplicates: Checked for duplicate Visits IDs. None were found.
- Outliers: Reviewed the Total Wait Time column for any extreme values.
  * Findings: The maximum wait time was 442 minutes. These values were retained for now, as they may represent systemic failures, but they will be noted during visualization to avoid skewed scales.

## Data Analysis
- Average wait TIme: 81 minutes
- Median wait time: 60 minutes
Note: This finding shows that the data has a right-skewed distribution. A few patients are waiting for a very long time, which is pulling up the total average wait time. 



