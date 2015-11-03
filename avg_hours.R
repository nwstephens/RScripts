library(dplyr)
library(ggplot2)
library(flights2)

trip <- flights2 %>%
  filter(origin == "LGA", dest == "BOS")

hour_avgs <- trip %>% 
  group_by(hour) %>% 
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE))
hour_avgs

smallest <- hour_avgs$hour[which.min(hour_avgs$avg_delay)]
paste0(smallest %% 12, ifelse(smallest %/% 12, ":00 pm", ":00 am"))

qplot(clock, arr_delay, data = trip, geom = "smooth") +
  xlab("Scheduled departure time") +
  ylab("Expected arrival delay (m)")
