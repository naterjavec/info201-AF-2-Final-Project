#P2 Analysis for Shiny App


#Download Libraries
library(dplyr)
library(ggplot2)
library(plotly)


#Download data sets as variables
food_prices <- read.csv("data/wfp_market_food_prices.csv")
global_temp <- read.csv("data/GlobalLandTemperaturesByMajorCity.csv")


#See what unique major cities are in the data set to choose from

cities_temp <- unique(global_temp$City)
cities_food <- unique(food_prices$adm1_name)


#Select from list of cities in both datasets
cities_list <- intersect(cities_food, cities_temp)
View(cities_list)



#Methods for filtering data to city of choice
#Used methods so city or food can be esily manipulated


#filters to city and food of choice then selects relevant columns
#excludes data points from after 2013 so it wil correspond with
#temperature data
city_food_data <- function(city, food){
  food_data <- food_prices %>%
    filter(adm1_name == city,
           cm_name == food,
           mp_year < 2014) %>%
    mutate(date = paste(mp_year, "-", mp_month, sep = "")) %>%
   select(date, mp_price)
  return(food_data)
}

#food data starts in 2006 and global temp data begins in 1881
#To make sure we show data that we have collected for both years
#This function includes filtering years > 2006 then selects
#only the columns needed for the Info Vis
city_temp_data <- function(city){
  temp <- global_temp %>%
    filter(City == city) %>%
    mutate(year = as.numeric(substring(dt, 1, 4))) %>%
    mutate(date = paste(year, "-", as.numeric(substring(dt, 6, 7)), sep = "")) %>%
    filter(year > 2005) %>%
    select(date, AverageTemperature)
  return(temp)
}


#Method to merge the two data sets into one for plot
merge_data <- function(df1, df2){
  return(merge(df1, df2, by = "date"))
}


#This is awful
p <- plot_ly(Lima_data, x = ~AverageTemperature, y = ~mp_price, type = 'scatter', mode = 'lines')

print(p)

#Thoughts?

line_plot <- function(df){
  return(plot_ly(df, x = ~date, y = ~AverageTemperature, name = 'Average Temperature',
                 type = 'scatter', mode = 'lines',
                 line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
           add_trace(y = ~mp_price, name = 'Maket Price',
                     line = list(color = 'rgb(22, 96, 167)', width = 4)))
}

data_and_plot <- function(city, food){
  city_data <- merge_data(city_food_data(city, food), city_temp_data(city))
  return(line_plot(city_data))
}


#Lima And Maize tests
Lima_plot <- data_and_plot("Lima", "Maize (local)")
print(Lima_plot)


#Delhi and mustard oil
Delhi_plot <- data_and_plot("Delhi", "Oil (mustard)")
print(Delhi_plot)
