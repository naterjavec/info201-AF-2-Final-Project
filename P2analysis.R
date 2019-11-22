
#P2 Analysis for Shiny App

#Download Libraries
library(dplyr)
library(ggplot2)
library(plotly)
library(lintr)
lint("P2analysis.R")


#Download data sets as variables
food_prices <- read.csv("data/wfp_market_food_prices.csv")
global_temp <- read.csv("data/GlobalLandTemperaturesByMajorCity.csv")


#See what unique major cities are in the data set to choose from

cities_temp <- unique(global_temp$City)
cities_food <- unique(food_prices$adm1_name)

View(cities_temp)


#Select from list of cities in both datasets
cities_list <- intersect(cities_food, cities_temp)
View(cities_list)



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



#Fix best fit line, just connecting top - not regression
scatter_plot <- function(df) {
  return(plot_ly(df, x = ~date, y = ~AverageTemperature,
                 name = "Average Temperature",
                 type = "scatter") %>%
           add_trace(y = ~mp_price, name = "Market Price") %>%
           add_lines(x = ~date, y = fitted(~mp_price)))
}

line_plot <- function(df) {
  return(plot_ly(df, x = ~date, y = ~AverageTemperature,
                 name = "Average Temperature",
                 type = "scatter", mode = "lines",
                 line = list(color = "rgb(205, 12, 24)", width = 4)) %>%
           add_trace(y = ~mp_price, name = "Market Price",
                     line = list(color = 'rgb(22, 96, 167)',
                                 width = 4)))
}

data_and_plot <- function(city, food){
  city_data <- merge_data(city_food_data(city, food), city_temp_data(city))
  return(line_plot(city_data))
}


#Lima And Maize tests
lima_plot <- data_and_plot("Lima", "Maize (local)")
print(Lima_plot)


#Delhi and mustard oil
delhi_plot <- data_and_plot("Delhi", "Oil (mustard)")
print(Delhi_plot)



#Delhi and wheat
delhi_wheat <- data_and_plot("Delhi", "Wheat")
print(Delhi_wheat)


#Unique Delhi Foods
delhi_foods <- food_prices %>%
  filter(adm1_name == "Delhi")

delhi_foods_u <- unique(Delhi_foods$cm_name)
View(delhi_foods_u)




# App server stuff - have it do it for every 
# have a couple cities, have the options for mutliple different foods for each city
# two different y axis? one with Degrees Celsius and one with market price / KG

# percent change for both market price of food and temp
# Do this based on the same month of 2006 to 2013 (i.e. March)


