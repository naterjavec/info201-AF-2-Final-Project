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
            h3("Primary Content"),
            p("Plots, data tables, etc. would go here")
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

<<<<<<< HEAD
shinyApp(ui = ui, server = server)
=======

        # Run the application 
        shinyApp(ui = ui, server = server)
>>>>>>> 0363c213daa511ce311acf33db963474ebe9bec8
