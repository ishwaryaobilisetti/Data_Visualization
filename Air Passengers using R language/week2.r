#load the dataset 
AirPassengers
?AirPassengers
#Verify the dataset
class(AirPassengers)
View(AirPassengers)

#Convert the dataset to dataframe
ap_df<-data.frame(
  year=time(AirPassengers),
  passengers=as.numeric(AirPassengers)
)
ap_df

ap_df_months<-data.frame(
  year=floor(time(AirPassengers)),
  month=cycle(time(AirPassengers)),
  passengers=as.numeric(AirPassengers)
)
ap_df_months
#basic plot
plot(AirPassengers)

#plot with title,Axis labels and color
plot(AirPassengers,
     type='l',#type='o'
     lwd=4,
     col = "red",
     main = "Air Passengers Over Time",
     xlab = "Month",
     ylab = "Number of Passengers"
     )
#to change the shape and color of the graph in plots
points(AirPassengers,
       type='o',
       pch=17,
       col="blue")
grid()

 # ggplot line plot
library(ggplot2)

ggplot(ap_df_months, 
       aes(x = interaction(year, month), 
           y = passengers, group = 1)) +
  geom_line(color = "red", linewidth = 1.2) +
  labs(
    title = "Air Passengers Over Time (ggplot)",
    x = "Time",
    y = "Number of Passengers"
  ) +
  theme_light()
 


ggplot(ap_df, 
       aes(x = year, 
           y = passengers)) +
  geom_line(color = "purple", linewidth = 1.5) +
  labs(
    title = "Trend Analysis of Air Passengers",
    caption="Using Air Passengers Dataset",
    subtitle = "From 1949-1960",
    x = "Month",
    y = "Number of Passengers"
  ) +
  geom_point(color="green")+
  geom_smooth(se=FALSE,color="orange")+
  theme_minimal()+
  theme(
    axis.title.x = element_text(color = "blue"),
    axis.title.y = element_text(color = "red")
  )
 