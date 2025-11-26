setwd('/Users/venkateshrakurthi/Desktop/580Project')
library(stringr)
data <- read.csv('traffic.csv')
colnames(data)[colnames(data) == "Traffic.Volume.Count.Location..Address"] <- "Location"
colnames(data)[colnames(data) == "Total.Passing.Vehicle.Volume"] <- "TotalTraffic"
data$TotalTraffic
#High traffic streets
avg_traffic <- tapply(data$TotalTraffic, data$Street, mean)
plot_data <- data.frame(Street = names(avg_traffic), Avg_Traffic = avg_traffic)
high_traffic_threshold <- 50000
high_traffic_streets <- names(avg_traffic[avg_traffic > high_traffic_threshold])
high_traffic_plot_data <- plot_data[plot_data$Street %in% high_traffic_streets, ]
library(ggplot2)
ggplot(high_traffic_plot_data, aes(x = reorder(Street, -Avg_Traffic), y = Avg_Traffic)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  labs(title = "Streets with Highest Traffic",
       x = "Street",
       y = "Average Traffic Volume") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5, vjust = 2, size = 14, face = "bold"))
#traffic across the seasons
print(head(data))
names(data)[names(data) == 'Date of Count'] <- 'Date'
print(names(data))
data$Date <- as.Date(data$Date, format="%m/%d/%y")
data$Month <- as.integer(format(data$Date, "%m"))
season_mapping <- c('Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer', 'Summer', 'Fall', 'Fall', 'Fall', 'Winter')
data$Season <- season_mapping[data$Month]
winter_traffic <- subset(data, Season == 'Winter')$Total.Passing.Vehicle.Volume
spring_traffic <- subset(data, Season == 'Spring')$Total.Passing.Vehicle.Volume
summer_traffic <- subset(data, Season == 'Summer')$Total.Passing.Vehicle.Volume
fall_traffic <- subset(data, Season == 'Fall')$Total.Passing.Vehicle.Volume

barplot(seasonal_traffic$Total.Passing.Vehicle.Volume, names.arg = seasonal_traffic$Season, 
        xlab = 'Season', ylab = 'Total Passing Vehicle Volume', 
        main = 'Total Passing Vehicle Volume Across Seasons', col = 'skyblue')
#map
install.packages("leaflet")
library(leaflet)
map <- leaflet(data) %>%
  addTiles() %>%
  addCircleMarkers(lng = ~Longitude, lat = ~Latitude, 
                   color = "red", fillColor = "red", fillOpacity = 0.1,
                   radius = 0.05, popup = ~paste("Location: ", Location, "<br>Total Passing Vehicle Volume: ", data$high_traffic_streets))
map

