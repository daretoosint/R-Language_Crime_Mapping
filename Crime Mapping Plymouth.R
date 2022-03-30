library(ukpolice)
library(leaflet)
library(dplyr)
library(heatwaveR)
library(ggplot2)
library(cowplot)
library(plotly)

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
crime_data8<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-10")
crime_data9<-ukp_crime(lat=50.381036, lng= -4.126839, date="2019-11")





#mapping
crime_data %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers(popup = ~category)

###############################################################################
#categories stats(barchart): creating plots on different months
ata1<-crime_data %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data$date[1])) +
  coord_flip() +
  theme_minimal()





ata2<-crime_data1 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data1$date[1])) +
  coord_flip() +
  theme_minimal()



ata3<-crime_data2 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data2$date[1])) +
  coord_flip() +
  theme_minimal()




ata4<-crime_data3 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data3$date[1])) +
  coord_flip() +
  theme_minimal()




ata5<-crime_data4 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data4$date[1])) +
  coord_flip() +
  theme_minimal()




ata6<-crime_data5 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data5$date[1])) +
  coord_flip() +
  theme_minimal()



ata7<-crime_data6 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data6$date[1])) +
  coord_flip() +
  theme_minimal()



ata8<-crime_data7 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data7$date[1])) +
  coord_flip() +
  theme_minimal()



ata9<-crime_data8 %>%
  count(category) %>%
  ggplot(aes(x = reorder(category, n),
             y = n)) + 
  geom_col() + 
  labs(x = "Crime Type",
       y = "Number of Crimes",
       title = paste0("Crimes commited in ",crime_data8$date[1])) +
  coord_flip() +
  theme_minimal()


data1<-ggplotly(ata1)
data2<-ggplotly(ata2)
data3<-ggplotly(ata3)
data4<-ggplotly(ata4)
data5<-ggplotly(ata5)
data6<-ggplotly(ata6)
data7<-ggplotly(ata7)
data8<-ggplotly(ata8)
data9<-ggplotly(ata9)




title <- ggdraw() + 
  draw_label(
    "Plymouth Crime by Categories",
    fontface = 'bold'
  ) 

###############################################################################
#plotting different bargraph on different months on the same plot
plot_grid(ata1, ata2, ata3, ata4, ata5, ata6,ata7,ata8,ata9,ncol=3,nrow=3)




