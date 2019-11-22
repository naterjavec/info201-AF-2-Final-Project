#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
source("P2analysis.R")

#First page, describes the project.
page_one <- tabPanel(
    "About",
    titlePanel("About"),
    sidebarLayout(
        sidebarPanel(
        h4("Who Cares"),
        p("The stakeholders within this situation are the people
who food prices are relevant to - those who have their
quality of life or even survival fluctuate with food
prices. The opposite stakeholders would be industries
that affect those prices. Their values and quality of
life over profitability may be in direct contrast with
each other. It is the policymakers’ task to determine
whether limiting industries or risking people’s livelihood
are the beneficial choices for their constituency.")),
        mainPanel(
            h3("Ask Yourself..."),
            h4("Is the price of food in major cities affected
            by global temperatures?"),
            h4("Will climate change be a factor in raising food prices?"),
            h3("The Issue"),
            p("There are varying levels of doubt about
            the effects or even existence of climate
            change. A typical counterpoint against
            climate change legislation is the fact that
            it limits industry, and by extension, the many
            affected by industry growth. However, these same
            people could suffer effects far outweighing those
            of industry limitation in the near future, yet
            the legitimacy of these effects is still struggling
            to be recognized in legislation."),
            h3(#add hyperlinks to datasets here
                )
            )
        )
)

page_two <- tabPanel(
            "Problem Situation",
            sidebarLayout(
              sidebarPanel(
                #From Project Proposal
              ),
              mainPanel(
                  p("If the scope of climate change extends to food prices, 
                    then many countries will find themselves at an extreme
                    disadvantage in the global market, and citizens of
                    those countries that depend on their natural resources
                    for food could go hungry, heavily increasing the need 
                    for a solution to world hunger. While it is already 
                    prevalent in the United States that a discrepancy
                    exists between reasonably priced food and its quality,
                    this change would create yet another opportunity for
                    companies to wedge a gap between the upper class and
                    the middle and lower class, creating more divide than 
                    our nation already faces."),  
              )
            )
        )
        
page_three <- tabPanel(
            "Data Critique",
            sidebarLayout(
                sidebarPanel(
                    #Strengths and weaknesses from project proposal
                ),
                mainPanel(
                    p("A strength is that both data sets are comprehensive,
                    with very little missing values. 
                    The columns they do have are very consistent in their values.
                    A weakness is that cities are the only locations considered,
                    showcasing the impact of this global phenomenon for only a certain
                    group of people. The cities included in these data sets also must
                    overlap, otherwise no trend between temperature and price can be
                    made. In addition, climate change is a slow process, and our 
                    specific data set for food prices spans many locations but
                    only dates about a decade back.")
                )
            )
        )
        
page_four <- tabPanel(
            "Visualization",
            sidebarLayout(
                sidebarPanel(
                    #Commentary on visualization
                ),
                mainPanel(
                    data_and_plot("Delhi", "Wheat")
                    #graph
                )
            )
        )
        
page_five <- tabPanel(
            "Further Inquiry",
            sidebarLayout(
                sidebarPanel(
                    #Analysis on results and further questions.
                ),
                mainPanel(
                    p("In the project, we found ourselves wanting to
                      compare many different types of crops in order 
                      to get a better picture of the effects of 
                      climate change, however, were unable to do
                      so because of time constraints. In addition,
                      comparing different times of the year, as 
                      opposed to solely June 1st of each year, would
                      have also provided us with more credibility.
                      At the same time, we believe that our
                      consistency among variables such as time
                      of year and crop are what makes the project
                      reliable and appeals to the ease of
                      readability for the user. From this, 
                      we learned how to apply Shiny to real-world 
                      scenarios and get results. From here, one
                      may want to pursue using a different data
                      set for food prices that goes back further
                      in time and provide more cities in Europe 
                      and North America in order to see a more
                      accurate trend.")
                    
                )
            )
        )
        


ui <- navbarPage(
            "The Effect of Climate Change on Food Prices",
            page_one,
            page_two,
            page_three,
            page_four, 
            page_five
        )
        
server <- function(input, output) {
            
        }

shinyApp(ui = ui, server = server)




