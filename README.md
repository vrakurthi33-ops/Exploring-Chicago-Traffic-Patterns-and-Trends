Exploring Chicago Traffic Patterns and Trends

This project analyzes traffic patterns, seasonal trends, and directional flow differences across the city of Chicago. Using AWS services, SQL, R, and Python, the study uncovers insights that can support urban planning and infrastructure optimization.

Overview
Urban traffic congestion continues to impact productivity, pollution, and city infrastructure needs. This project examines Chicago’s public traffic dataset to understand seasonal variation, identify high-traffic streets, and find locations where directional traffic flow differs significantly. The analysis includes data cleaning, statistical exploration, and visualizations.

Research Questions
1.	Does traffic vary significantly across seasons?
2.	Which streets consistently experience high traffic volume?
3.	Can we identify locations with significant directional traffic flow differences?

Dataset
The dataset is sourced from the City of Chicago and includes:
•	Traffic volume count location
•	Street name
•	Date of count
•	Total passing vehicle volume
•	Directional traffic volume
•	Latitude and longitude
It contains nominal, ordinal, interval, and ratio data types, enabling a detailed analysis.

Architecture and Tools
Data Cleaning
•	AWS Glue DataBrew
Data Exploration and Analysis
•	AWS RDS (MySQL)
•	RStudio (R programming)
•	Python (Spyder)
Visualization
•	Leaflet in R
•	R and Python plotting libraries

Methodology
1.	Initial cleaning in AWS DataBrew by removing rows with missing values
2.	SQL queries and R-based exploratory analysis
3.	Extraction of months and mapping to seasons
4.	Grouping and evaluation of high-traffic streets
5.	Python-based secondary cleaning for directional data
6.	Creation of maps and visualizations for all research questions

Results
Seasonal Variation
Traffic volume is highest in fall and lowest in winter, indicating strong seasonal shifts.

High-Traffic Streets
Using a threshold of 50,000 vehicles, five streets were identified as high-volume locations. Lake Shore Drive showed the highest overall traffic.

Directional Traffic Differences
After cleaning directional variables, significant imbalances were found at specific locations, including 7139 South.

Discussion
The study demonstrates clear seasonal traffic variation, highlights high-traffic corridors, and identifies directional flow issues. The use of multiple tools strengthens analysis reliability and provides actionable insights for urban planning and traffic management.

Limitations
•	No time-of-day data for hourly comparisons
•	No weather information to correlate traffic behavior
•	One-way traffic entries limit directional analysis scope

Future Work
•	Integration of real-time traffic data
•	Machine learning models for traffic prediction
•	Incorporating weather data
•	Time-based traffic trend analysis

<img width="468" height="642" alt="image" src="https://github.com/user-attachments/assets/c58878f4-97a8-4a49-bf7a-a146d2c4823f" />
