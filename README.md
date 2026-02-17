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
- Note: This is sunthetic/historical data intended for porffolio use and does not contain any Protected Health Information. 
  
##### Data Structure:

| Column Name | Type | Description |
| ---  | --- | --- |
| Visit ID | nvarchar(50) | Unique Identifier |
| Patient ID | nvarchar(50) | Unique Identifier |
| Hospital ID | nvarchar(50) | Unique Identifier |
| Hospital Name | nvarchar(50) | Name of Hospital |
| Region | nvarchar(50) | Classification as Urban or Rural |
| Visit Date | datetime2(7) | Time and date of visit |

- Visit ID
- Patient ID
- Hospital ID
- Hospital Name
- Region
- Visit Date
- Day of Week
- Season
- Time of Day
- Urgency Level
- Nurse-to-Patient Ratio
- Specialist Availability
- Facility Size (Beds)
- Time to Registration (min)
- Time to Triage (min)
- Time to Medical Professional (min)
- Total Wait Time (min)
- Patient Outcome
- Patient Satisfaction`






