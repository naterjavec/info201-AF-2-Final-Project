#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
            "Second Page",
            sidebarLayout(
              sidebarPanel(
                #stuff goes here
              ),
              mainPanel(
                  #stuff
              )
            )
        )
        
page_three <- tabPanel(
            "Third Page",
            sidebarLayout(
                sidebarPanel(
                    #stuff here
                ),
                mainPanel(
                    #stuff here
                )
            )
        )
        
page_four <- tabPanel(
            "Fourth Page",
            sidebarLayout(
                sidebarPanel(
                    #stuff here
                ),
                mainPanel(
                    #stuff here
                )
            )
        )
        
page_five <- tabPanel(
            "Fifth Page",
            sidebarLayout(
                sidebarPanel(
                    #stuff here
                ),
                mainPanel(
                    #stuff here
                )
            )
        )
        
page_six <- tabPanel(
            "Sixth Page",
            sidebarLayout(
                sidebarPanel(
                    #stuff here
                ),
                mainPanel(
                    #stuff here
                )
            )
        )

ui <- navbarPage(
            "My Application",
            page_one,
            page_two,
            page_three,
            page_four, 
            page_five,
            page_six
        )
        
server <- function(input, output) {
            
        }

shinyApp(ui = ui, server = server)




