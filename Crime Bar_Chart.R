library(ukpolice)
library(leaflet)
library(dplyr)
library(heatwaveR)
library(ggplot2)
library(cowplot)

#remotes::install_github("njtierney/ukpolice")
#crime data on different months in plymouth
crime_data<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-02")
crime_data1<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-03")
crime_data2<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-04")
crime_data3<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-05")
crime_data4<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-06")
crime_data5<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-07")
crime_data6<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-08")
crime_data7<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-09")

#mapping
crime_data %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(popup = ~category)

###############################################################################
#categories stats(barchart): creating plots on different months
data1<-crime_data %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data$date[1])) +
  coord_flip() +
  theme_minimal()

data2<-crime_data1 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data1$date[1])) +
  coord_flip() +
  theme_minimal()


data3<-crime_data2 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data2$date[1])) +
  coord_flip() +
  theme_minimal()

data4<-crime_data3 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data3$date[1])) +
  coord_flip() +
  theme_minimal()

data5<-crime_data4 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data4$date[1])) +
  coord_flip() +
  theme_minimal()

data6<-crime_data5 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data5$date[1])) +
  coord_flip() +
  theme_minimal()

data7<-crime_data6 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data6$date[1])) +
  coord_flip() +
  theme_minimal()

title <- ggdraw() + 
  draw_label(
    "Plymouth Crime by Categories",
    fontface = 'bold'
  ) 

###############################################################################
#plotting different bargraph on different months on the same plot
plot_grid(data1, data2, data3, data4, data5, data6,data7,ncol=3,nrow=3)



data1

