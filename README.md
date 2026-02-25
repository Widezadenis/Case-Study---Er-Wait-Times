# Case-Study--Er-Wait-Times

# Introduction: 
This case study analyzes Emergency Room operational data to identify the root cause of longer wait times. By quantifying bottlenecks in patient flow, this analysis aims to provide data-driven recommendations to reduce the 'Door-to-Doc' time, ultimately improving both patient throughput and satisfaction scores.

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
  
### Data Structure:

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
- Missing Values: Confirmed the dataset contains 0 null values across all 19 columns
- Duplicates: Checked for duplicate Visits IDs. None were found.
- Outliers: Reviewed the Total Wait Time column for any extreme values.
    * Findings: The maximum wait time was 442 minutes. These values were retained for now, as they may represent systemic failures, but they will be noted during visualization to avoid skewed scales.

## Data Analysis
- Average wait Time: 81 minutes
- Median wait time: 60 minutes
Note: This finding shows that the data has a right-skewed distribution. A few patients are waiting for a very long time, which is pulling up the total average wait time. 

##  Root Cause Analysis
-  Wait times are the longest during the evening and afternoons shifts and Mondays.
-  Wait times are longer during the winter season
-  During peak hours, there is a positive correlation between nurse to patient ratio and total wait times. For every increase in the ratio wait times increase.
    * Findings:  Keeping nurse to patient ratio of 2:1 or better during peak hours can keep wait times under 30 minutes. Ratios of 3:1 or more increases wait times, 4:1 causes major delays.
-  The availability of specialist does not reduce wait times.
    * Findings: Increasing specialists provides minimal reduction in total wait times.  Interestingly, wait, registration, triage, and doc times increase by a small amount when the number of specialist increase.
      
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

## Visualizations
- Bar Chart: Average wait time by time of day - Reveals that there's an increase in patient visits in the evening.
<img width="666" height="480" alt="Screenshot 2026-02-25 at 9 15 13 AM" src="https://github.com/user-attachments/assets/97b51361-5c54-45c4-8212-270891d54953" />
  
- Bar Chart: Average wait time by day of the week - Reveals that Mondays are the busiest and Sundays are the slowest.
<img width="669" height="473" alt="Screenshot 2026-02-25 at 9 15 19 AM" src="https://github.com/user-attachments/assets/18a390f1-76c7-4717-a223-6f5e3ca6fee6" />

- Box Plot: Wait time by urgency levels - Reveals that patients who have critical needs are seen faster than non critical patients.
- Scatter Plot: Nurse-to-Patient-Ratio and total wait time correlation - Reveals ratio of 2:1 during evening hours keeps wait times under 30 minutes.
- Stacked Bar Chart: Composition of wait times - Shows how the number of specialist affect wait times.

## Limitations
- The analysis does not account for external factors (flu season, local events)
- "Peak hours" were defined based on volume, not clinical urgency

## Recommendations
- Resource Allocation:
  *  Increase nurse coverage during the evening and on Mondays to improve nurse to patient ratios
  *  Current specialist levels does not have an impact on wait times, resources need to be allocated to nursing staff. 
- Winter Season Planning:
  * Increase nurse to patient ratio
  * Restructure registration process to accommodate patient volume

## Next Steps: 
- Create a real-time dashbord to monitor nurse to patient ratios
- Analyze if the 2:1 threshold changes by season or time of day
