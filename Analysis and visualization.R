## Creates df
ErWaitTimes <- read.csv("~/Downloads/ER Wait Time Dataset.csv")

## Sets environment
library(tidyverse)
library(ggplot2)
library(dplyr)

## Previews dataset
glimpse(ErWaitTimes)

## Gets the average and median wait times
avg_wait <- summarize(ErWaitTimes, mean(Total.Wait.Time..min.))
median_wait <- summarize(ErWaitTimes, median(Total.Wait.Time..min.))

## Transforms total wait time from minutes to hours
mutate_ErWaitTimes <- ErWaitTimes %>% 
  mutate(Total.Wait.Time.hour = (Total.Wait.Time..min. / 60))
View(mutate_ErWaitTimes)

## Average Wait time by time of day
ggplot(mutate_ErWaitTimes, 
       aes(x = Time.of.Day, y = Total.Wait.Time.hour)) +
  geom_bar(stat = "summary", 
           fun = "mean", 
           fill = "#66c2a5") + 
  labs(title = "Average Wait By Time of Day",  #Adds a title
       x = "Time of Day", 
       y = "Average Wait Time (Hour)") + # Labels x and y axis
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))  #Centers the title
 

## Average Wait time by day of the week
ggplot(mutate_ErWaitTimes, 
       aes(x = factor(Day.of.Week, 
      levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")), 
      y = Total.Wait.Time.hour)) +
  geom_bar(stat = "summary", 
           fun = "mean", 
           fill ="#fc8d62") + 
  labs(title = "Average Wait By Day of The Week", #Adds a title
       x = "Weekday", 
       y = "Average Wait Time (Hour)",) + # Labels x and y axis
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45,), #Angles text on x-axis
        plot.title = element_text(hjust = 0.5, face = "bold")) #Centers the title

## Wait time by urgency levels
ggplot(mutate_ErWaitTimes, 
       aes( x = Urgency.Level, 
            y = Total.Wait.Time.hour, 
            fill = Urgency.Level)) +
  geom_boxplot() +
  labs(title = "Wait Time by Urgency Level",
       x = "Urgency Level (1=Critical, 5=Non-Urgent)",
       y = "Total Wait Time (Hour)") +
  theme_minimal() + 
  scale_fill_brewer(palette = "Set2") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

## Creates df
ntp_cor <- read_csv("~/Documents/SQL/NurseToPatientCorrelation.csv")
colnames(ntp_cor)

## Correlation between 'Nurse-to-Patient-Ratio' and 'Total Wait Time' during peak hours
peak_hours <- ntp_cor %>% 
  filter(Time_of_Day == "Evening")

ggplot(peak_hours, aes(x = Nurse_to_Patient_Ratio, y = Total_Wait_Time_min)) +
  geom_point(color = "#8da0cb") + 
  geom_smooth(method = "lm", se = TRUE, color = "#fc8d62", fill = "#66c2a5") + 
  labs(title = "Correlation During Evening Peak Hours",
       x = "Nurse to Patient Ratio",
       y = "Wait Time") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))

## Plots composition of wait time stage (Registration, Triage, To Doctor)
specialist_avail <- read_csv("~/Documents/SQL/SpecialistAvailability.csv")
glimpse(specialist_avail)

specialist_long <- specialist_avail %>% 
  select(Specialist_Availability, avg_registration_time, avg_triage_time, avg_doc_time) %>% #Selects columns from dataset
  pivot_longer(cols = c(avg_registration_time, avg_triage_time, avg_doc_time), #Converts the data from wode to long
               names_to = "stage", # New column for the stage names
               values_to = "minutes") %>%  # New column for the actual times
  mutate(stage = case_when( #Creates the stage column and starts a condition to change the column names
    stage == "avg_registration_time" ~ "Registration",
    stage == "avg_triage_time" ~ "Triage",
    stage == "avg_doc_time" ~ "Wait for Doctor",
    TRUE ~ stage
  ))

ggplot(specialist_long, aes(x = factor(Specialist_Availability),
                            y = minutes,
                            fill = stage)) + 
  geom_col(position = "stack") + 
  geom_text(aes(label = round(minutes, 0)), #Adds labels to chart
            position =  position_stack(vjust = 0.5),
            size = 3,
            color = "white") + 
  labs(title = "Composition of Wait Time by Specialist Availability", #adds titles to chart and labels x and y axis
       x = "Number of Specialists Available",
       y = "Average Wait Time (minutes)",
       fill = "Stage") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + #Centers the title 
  scale_fill_brewer(palette = "Set2") 

