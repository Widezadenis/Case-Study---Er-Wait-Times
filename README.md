# Case-Study---Er-Wait-Times

# Introduction: 
This case study analyzes Emergency Room operational data to identify the root causes of longer wait times. By quantifying bottlenecks in patient flow, this analysis aims to provide data-driven recommendations to reduce the 'Door-to-Doc' time, ultimately improving both patient throughput and satisfaction scores.

##### Stakeholders:
Hospital administrators, ER department heads, shift managers

##### Key Questions:
-   What is the current average wait time?
-   What times of the day/week are waiting times the longest?
-   Is there a correlation between 'Nurse-to-Patient-Ratio' and 'Total Wait Time' during peak hours?
-   Does the availability of a specialist reduce overall wait time or does it shift the bottleneck to another stage of the process (registration or triage)? 

## Data Overview

##### Source: 
- River, 2025. Er Wait Time. (Version 2) [Data Set].Kaggle.(https://www.kaggle.com/datasets/rivalytics/er-wait-time/data?select=ER+Wait+Time+Dataset.csv)
- Note: This is synthetic/historical data intended for portfolio use and does not contain any Protected Health Information. 
  
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
| Time to Triage (min) | int | Time taken to complete triage assessment |
| Time to Medical Professional (min) | int | Patient to Doc time |
|  Total Wait Time (min) | int | length of stay |
|  Patient Outcome | nvarchar(50) | Outcome of visit (Discharged, Admitted, Left Without being seen)|
|  Patient Satisfaction | int | Satisfaction score (1 to 5, 5 being the highest) |

## Data Cleaning
- Missing Values: Confirmed the dateset contains 0 null values across all 19 columns
- Duplicates: Checked for duplicate Visits IDs. None were found.
- Outliers: Reviewed the Total Wait Time column for any extreme values.
  * Findings: The maximum wait time was 442 minutes. These values were retained for now, as they may represent systemic failures, but they will be noted during visualization to avoid skewed scales.

## Data Analysis
- Average wait Time: 81 minutes
- Median wait time: 60 minutes
Note: This finding shows that the data has a right-skewed distribution. A few patients are waiting for a very long time, which is pulling up the total average wait time. 

#### Visualizations
- Bar Chart: Average wait time by time of day - Reveals that there's an increase in patient visits in the evening.
- Bar Chart: Average wait time by day of the week - Reveals that Mondays are the busiest and Sundays are the slowest. 
- Box Plot: Wait time by urgency levels - Reveals that patients who have critical needs are seen faster than non critical patients.

####  Root Cause Analysis
-  Wait times are the longest during the evening shift and Mondays.
-  Wait times are longer during the winter season
-  When the nurse to patient ratio is high during peak hours (evening) the wait time is longer
-  The availability of specialist keeps wait times about the same and doea not shift bottleneck to registration, time to doctor, or triage.
  
| Specialist | Avg Wait | Avg Registration | Avg Triage | Avg Doc Time |
| ---  | --- | --- | --- | --- |
| 0 | 77 | 11 | 23 | 42 |
| 1 | 79 | 11 | 23 | 43 |
| 2 | 83 | 11 | 25 | 45 |
| 3 | 88 | 12 | 27 | 49 |
| 4 | 80 | 11 | 24 | 44 |
| 5 | 76 | 11 | 23 | 42 |
| 6 | 80 | 11 | 24 | 44 |
| 7 | 86 | 12 | 25 | 48 |
| 8 | 78 | 11 | 23 | 43 |
| 9 | 78 | 11 | 23 | 44 |
| 10 | 84 | 11 | 25 | 47|
