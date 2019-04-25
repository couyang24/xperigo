inputPanel(
  sliderInput("lng", label = "Longtitude:",
              min = -74.630, max = -73.179, value = -74, step = 0.001),
  
  sliderInput("lat", label = "Latitude:",
              min = 40.5, max = 41, value = 40.75, step = 0.001)
)

renderLeaflet({
  x <- data_frame(LONGITUDE= input$lng, LATITUDE= input$lat)
  (cluster_num <- cl_predict(data_kmeans,x))
  
  result <- data1 %>% filter(cluster==cluster_num)
  
  
  round_num <- 3
  top20 <- result %>% group_by(lng=round(LONGITUDE,round_num),lat=round(LATITUDE,round_num)) %>% 
    count() %>% arrange(desc(n)) %>% head(20)
  top20 %>% 
    leaflet() %>% 
    addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
    addCircleMarkers(~lng, ~lat, radius = 1,
                     color = "firebrick", fillOpacity = 0.001)%>%
    addMarkers(~lng, ~lat, icon = greentaxi, label = ~as.character(paste("Number of Pick ups:",top20$n)))
  
})