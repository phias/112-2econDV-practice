# map ----
library(osmdata)
library(sf)
library(ggplot2)
library(rmapshaper)

# Construct query for amenities 'university' of NTPU
q_ntpu <- opq(bbox = c(121.3586, 24.9502, 121.3769, 24.9362)) %>% 
  add_osm_feature(key = 'amenity', value = 'university')

# Download data
ntpu_sf <- osmdata_sf(q_ntpu)
ntpu_df <- osmdata_data_frame(q_ntpu)

# Construct query for building 'university' of NTPU
q_building <- opq(bbox = c(121.3586, 24.9502, 121.3769, 24.9362)) %>% 
  add_osm_feature(key = 'building', value = 'university')

# Download data
ntpu_building_sf <- osmdata_sf(q_building)
ntpu_building_df <- osmdata_data_frame(q_ntpu)


# Create base map using OpenStreetMap tiles with theme_minimal
basemap <- ggplot(ntpu_df, aes(x = long, y = lat)) +
  theme_minimal() +
  geom_sf(fill = "skyblue", color = "gray") +  # Removed unnecessary aes
  labs(title = "Map of NTPU", fill = "University (amenity)", 
       subtitle = "", footnote = "Data Source: OpenStreetMap") +
  theme(axis.line.x = element_line(color = "black", size = 1))  # Solid black x-axis


# Add university buildings as another layer
basemap <- basemap + 
  geom_sf(data = ntpu_building_df, fill = "orange", color = "gray") +
  labs(fill = "Building")

print(basemap)
