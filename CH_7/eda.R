library(tidyverse)

#discrete variablees
ggplot(data= diamonds)+
  geom_bar(mapping = aes(x=cut))

#continuse variables
ggplot(data= diamonds)+
  geom_histogram(mapping = aes(x=carat),binwidth = 0.5)

#changing bin size
smaller = diamonds%>%
  filter(carat<3)
ggplot(data= smaller)+
  geom_histogram(mapping = aes(x=carat),binwidth = 0.1)

#overlaying different histograms
ggplot(data = smaller, mapping = aes(x= carat, colour= cut))+
  geom_freqpoly(binwidth=0.1)

# Questions after seeing a graph
ggplot(data = smaller, mapping = aes(x= carat))+
  geom_histogram(binwidth=0.01)

#continuous variables
ggplot(data = diamonds, mapping = aes(x= price))+
  geom_freqpoly(mapping=aes(colour = cut), binwidth=500)

#adding density instead of count
ggplot(data = diamonds, mapping = aes(x= price, y= ..density..))+
  geom_freqpoly(mapping=aes(colour = cut), binwidth=500)

#box plot
ggplot(data = diamonds, mapping = aes(x=cut ,y= price))+
  geom_boxplot()

#categorecal value
ggplot(data = diamonds)+
  geom_count(mapping = aes(x=cut,y=color))

diamonds %>%
  count(color,cut)%>%
  ggplot(mapping = aes(x=cut,y=color))+
  geom_tile(mapping = aes(fill = n))

#2 continuous variables
ggplot(data = diamonds)+
  geom_point(mapping = aes(x=carat,y=price))

#tile 2d

ggplot(data = smaller)+
  geom_bin2d(mapping = aes(x=carat, y=price))

ggplot(data = smaller,mapping = aes(x=carat,y=price))+
  geom_boxplot(mapping = aes(group=cut_width(carat,0.1)))