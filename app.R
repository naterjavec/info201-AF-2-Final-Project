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
    
    # This content uses a sidebar layout
    sidebarLayout(
        sidebarPanel("The stakeholders within this situation are the people
who food prices are relevant to - those who have their
quality of life or even survival fluctuate with food
prices. The opposite stakeholders would be industries
that affect those prices. Their values and quality of
life over profitability may be in direct contrast with
each other. It is the policymakers’ task to determine
whether limiting industries or risking people’s livelihood
are the beneficial choices for their constituency."),
        mainPanel(
            h3("Primary Content"),
            p("Plots, data tables, etc. would go here")
        )
    )
)
        
        page_two <- tabPanel(
            "Second Page"
        )
        
        # Define content for the third page
        page_three <- tabPanel(
            "Third Page"
        )
        
        page_four <- tabPanel(
            "Fourth Page"
        )
        
        page_five <- tabPanel(
            "5th Page"
        )
        
        page_six <- tabPanel(
            "Sixth Page"
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

        # Run the application 
        shinyApp(ui = ui, server = server)