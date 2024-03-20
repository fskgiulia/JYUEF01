library(ggplot2)
library(dplyr)

data <- read.csv(file='harjoitustyondata.csv',sep=";",header=TRUE)

names(data) <- c('time','score')

data

attach(data)

min(score)
max(score)

# converting date-time strings into a datetime object
datetime <- strptime(time, format = "%d.%m.%Y %H:%M")
detach(data)
df <- data.frame(datetime,score)

# plot of datatime-scores
x11()
ggplot(df, aes(x = datetime, y = score)) +
  geom_point() +  labs(x = "Datetime", y = "Score", title = "Score Over Time")

# students
df <- df %>% 
  mutate(student = as.factor(as.numeric(factor(score, levels = unique(score)))))

length(unique(df$student))

detach(data)