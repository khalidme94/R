library(tidyverse)
library(nycflights13)

fl = flights
View(fl)

#Filter Function
jan1= filter(flights, month==1, day== 1,)

jan_to_mar = filter(flights,(month == 1 )|(month== 2)|( month== 3))

no_delay = filter(flights, dep_delay == 0 & arr_delay ==0)

not_late = filter(flights, arr_delay ==0)

#Arrange Function
arrange(flights,year,month,day)
arrange(flights,(dep_time))

#Select Function
select(flights,dep_delay)

M_flights = flights[starts_with('M',vars= flights$dest),]
M_flights

select(flights,dep_delay,everything())

#Mutate Function
flights_sml = select(flights, year:day,
                     ends_with('delay'),
                     distance,
                     air_time)

flights_sml_add = mutate(flights_sml,
                         gain= dep_delay + arr_delay,
                         speed= distance / air_time * 60,
                         hours= air_time / 60,
                         gain_per_hour= gain/hours)

transmute(flights_sml,
          gain= dep_delay + arr_delay,
          hours= air_time / 60,
          gain_per_hour= gain/hours)

#Summarise Function
summarise(flights,delay= mean(dep_delay,na.rm = TRUE))
by_day= group_by(flights,year,month,day)
by_day

by_dest= group_by(flights,dest)
by_dest

delay = summarise(by_dest,
                  count= n(),
                  dist=mean(distance,na.rm = TRUE),
                  delay=mean(arr_delay,na.rm= TRUE))

ggplot(data = delay, mapping = aes(x= dist,y= delay))+
  geom_point(aes(size= count), alpha=1/3)+
  geom_smooth(se=FALSE)

delay= filter(delay, count>20,dest != 'HNL')

ggplot(data = delay, mapping = aes(x= dist,y= delay))+
  geom_point(aes(size= count), alpha=1/3)+
  geom_smooth(se=FALSE)

## Using Pipes ##
delays= flights %>%
  group_by(dest) %>%
  summarise(
    count= n(),
    dist= mean(distance,na.rm=TRUE)
  )%>%
  filter(count>20,dest != 'HNL')%>%
  ggplot(data = delay,mapping=aes(x=dist,y= delay))+
  geom_point(aes(size = count),alpha=1/3)+
  geom_smooth(se=FALSE)
delays

## Missing Values ##

not_cancelled = flights %>%
  filter(!is.na(dep_delay),!is.na(arr_delay))
not_cancelled

not_cancelled_report=not_cancelled%>%
  group_by(year,month,day)%>%
  summarise(mean= mean(dep_delay))
not_cancelled_report

delays = not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    count= n()
  )
delays

ggplot(data = delays, mapping = aes(x= count,y=delay))+
  geom_point(alpha=1/10)
  

delays_plot = delays %>%
  filter(count > 25) %>%
  ggplot(data = delays,mapping = aes(x=count,y=delay))+
  geom_point(alpha = 1/10)
delays_plot

