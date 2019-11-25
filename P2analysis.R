
#P2 Analysis for Shiny App

#Download Libraries
library(dplyr)
library(ggplot2)
library(plotly)
library(data.table)

#Download data sets as variables
food_prices <- read.csv("data/wfp_market_food_prices.csv")
global_temp <- read.csv("data/GlobalLandTemperaturesByMajorCity.csv")


#----------------------General Data Analysis--------------------------

#See what unique major cities are in the data set to choose from
cities_temp <- unique(global_temp$City)
cities_food <- unique(food_prices$adm1_name)


#Select from list of cities in both datasets
cities_list <- intersect(cities_food, cities_temp)



#----------------------Creating Line / Scatter Plot--------------------------

#Methods for filtering data to city of choice
#Used methods so city or food can be esily manipulated


#filters to city and food of choice then selects relevant columns
#excludes data points from after 2013 so it wil correspond with
#temperature data
city_food_data <- function(city, food) {
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
city_temp_data <- function(city) {
  temp <- global_temp %>%
    filter(City == city) %>%
    mutate(year = as.numeric(substring(dt, 1, 4))) %>%
    mutate(date = paste(year, "-", as.numeric
                        (substring(dt, 6, 7)), sep = "")) %>%
    filter(year > 2005) %>%
    select(date, AverageTemperature)
  return(temp)
}

#Method to merge the two data sets into one for plot
merge_data <- function(df1, df2) {
  return(merge(df1, df2, by = "date"))
}


#Merge isnt working - Ethan will fix dates
example <- merge_data(city_food_data("Delhi", "Wheat"), city_temp_data("Delhi"))
View(example)



#Fix best fit line, rn just connecting top - not regression
scatter_plot <- function(df){
  return(plot_ly(df, x = ~date, y = ~AverageTemperature, name = 'Average Temperature',
                 type = 'scatter') %>%
           add_trace(y = ~mp_price, name = 'Market Price') %>%
           add_lines(x = ~date, y = fitted(~mp_price)))
}



#working fine but not preferable


#TO DO: make into scatterplot with regression lines
#Change x and y axis titles
#Add title that changes with city and food?
line_plot <- function(df, city, food){
  title <- paste(food, "in", city, "Over Time")
  return(plot_ly(df, x = ~date, y = ~AverageTemperature,
                 name = 'Average Temperature',
                 type = 'scatter', mode = 'lines',
                 line = list(color = 'rgb(205, 12, 24)', width = 4)) %>%
           add_trace(y = ~mp_price, name = 'Market Price',
                     line = list(color = 'rgb(22, 96, 167)', width = 4)) %>%
           layout(title = title,
                  xaxis = list(title = "Date"),
                  yaxis = list(title = "Price (local currnecy) and Average Temperature (*C)")))

}


#takes in city and food and returns information as plot
data_and_plot <- function(city, food){
  city_data <- merge_data(city_food_data(city, food), city_temp_data(city))
  return(line_plot(city_data, city, food))
}



#Tests and Plots

#Lima And Maize plot
Lima_plot <- data_and_plot("Lima", "Maize (local)")
print(Lima_plot)


#Delhi and mustard oil plot
Delhi_plot <- data_and_plot("Delhi", "Oil (mustard)")
print(Delhi_plot)

#Delhi and wheat plot
Delhi_wheat <- data_and_plot("Delhi", "Wheat")
print(Delhi_wheat)


#Unique Delhi Foods
delhi_foods <- food_prices %>%
  filter(adm1_name == "Delhi")

delhi_foods_u <- unique(delhi_foods$cm_name)


#---------------------- adding percent changes--------------------------


# Mutating the temperature data set so that it contains only the month of October
# from 2006 to 2012 so that the data is consistent from beginning year to end. Then,
# the difference of the two temperatures is calculated and divided by the Temp in
# October of 2006 to get a percent change between the two years. The percent change is
# added to the data set

temp_w_percent <- global_temp %>%
  mutate(month = substring(dt, 6, 7),
         year = as.numeric(substring(dt, 1, 4))) %>%
  filter(month == "10") %>%
  group_by(City) %>%
  filter(year == 2006 | year == 2012) %>%
  mutate(change = AverageTemperature - lag(AverageTemperature, default = AverageTemperature[1])) %>%
  mutate(percent_change = change / lag(AverageTemperature, default = AverageTemperature[1]) * 100) %>%
  filter(percent_change != 0) %>%
  select(City, Country, percent_change, Longitude, Latitude)



# Mutating the food data set so that it contains only the month of October
# from 2006 to 2014 (most cities did not have data for 2012). The difference of 
# the two prices for each food is calculated and divided by the price in
# October of 2006 to get a percent change between the two years. The percent change is
# added to the data set

food_change<- food_prices %>%
  filter(mp_month == 10) %>%
  group_by(adm1_name, cm_name) %>%
  filter(mp_year == 2006 | mp_year == 2014) %>%
  mutate(price_change = mp_price - lag(mp_price, default = mp_price[1]),
         City = adm1_name) %>%
  mutate(food_percent = price_change / lag(mp_price, default = mp_price[1]) * 100) %>%
  filter(price_change != 0) %>%
  select(City, adm0_name, adm1_name, cm_name, food_percent, mp_month, mp_year)


#Data with percent changes for both food and temperature
percent_change <- merge(food_change, temp_w_percent, by = "City")


#----------------------Bar Graph With Percent Change--------------------------

#Function to create bar plot based on specific foods
#Returns barchart with any city that has data about the food parameter entered
# includes "like" function so that similar foods will be included in graph
create_bar_chart <- function(food){
  specific_data <- percent_change[percent_change$cm_name %like% food, ]
  return(plot_ly(specific_data,
                 x = ~City,
                 y = ~percent_change,
                 type = 'bar',
                 name = 'Temperature Percent Change') %>%
           add_trace(y = ~food_percent,
                     name = 'Food Price Percent Change') %>%
           layout(yaxis = list(title = 'Percent')))
}



#Bar chart tests

#Rice tests
print(create_bar_chart("Rice"))

#Wheat test
print(create_bar_chart("Oil"))

#Foods that are best for shiny app:
#Oil, Rice, Wheat, Sugar, Lentils, Maize, Bread


#----------------------Global Temp Heat Map (w/ Percent Change)--------------------------






#----------------------To Do--------------------------

# App server stuff - have it do it for every 
# have a couple cities, have the options for mutliple different foods for each city

# App server stuff - have it do it for every have a couple cities, have the 
# options for mutliple different foods for each city

# two different y axis? one with Degrees Celsius and one with market price / KG
# Sierra ^^

# heat map 
# using original data sets of both with longitude and lat


