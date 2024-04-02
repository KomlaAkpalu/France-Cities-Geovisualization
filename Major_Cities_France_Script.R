# Set working directory
setwd("C:/Users/julien/Desktop/GITHUB/France")

# Install and load required packages
if (!require(leaflet)) install.packages("leaflet")
library(leaflet)

# Create a map of France
france_map <- leaflet() %>%
  addTiles() %>%
  setView(lng = 2.3522, lat = 48.8566, zoom = 6) # Center on Paris

# Define coordinates of major cities
cities <- data.frame(
  name = c("Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Lille"),
  lat = c(48.8566, 43.2965, 45.7640, 43.6047, 43.7102, 47.2184, 48.5734, 43.6108, 44.8378, 50.6292),
  lng = c(2.3522, 5.3698, 4.8357, 1.4442, 7.2620, -1.5536, 7.7521, 3.8767, -0.5792, 3.0573)
)

# Add markers for each city
for(i in 1:nrow(cities)) {
  france_map <- france_map %>%
    addMarkers(lng = cities$lng[i], lat = cities$lat[i], popup = cities$name[i])
}

# Add a title using addLegend with dummy 'colors' and 'labels' arguments
france_map <- france_map %>% 
  addLegend(position = "topright", 
            title = "Interactive Map of Major Cities in France",
            labels = c(""), # Single dummy label
            colors = c("white"), # Single dummy color
            opacity = 0)  # Adjust opacity as needed

# Display the map
france_map
