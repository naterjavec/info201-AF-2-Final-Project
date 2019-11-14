#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
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

# Define the first page content; uses `tabPanel()` and `sidebarLayout()`
# layout functions together (as an example)
page_one <- tabPanel(
    "First Page", # label for the tab in the navbar
    titlePanel("Page 1"), # show with a displayed title
    
    # This content uses a sidebar layout
    sidebarLayout(
        sidebarPanel(
            textInput(inputId = "username", label = "What is your name?")
        ),

# Define content for the second page
page_two <- tabPanel(
    "Second Page" # label for the tab in the navbar
    # ...more content would go here...
)

# Define content for the third page
page_three <- tabPanel(
    "Third Page" # label for the tab in the navbar
    # ...more content would go here...
)

page_four <- tabPanel(
    "Fourth Page" # label for the tab in the navbar
    # ...more content would go here...
)

page_five <- tabPanel(
    "5th Page" # label for the tab in the navbar
    # ...more content would go here...
)

page_six <- tabPanel(
    "Sixth Page" # label for the tab in the navbar
    # ...more content would go here...
)
# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
    "My Application", # application title
    page_one,         # include the first page content
    page_two,         # include the second page content
    page_three,
    page_four, 
    page_five,
    page_six          # include the third page content
)

# Define server logic 
server <- function(input, output) {


}
=======
# Define server logic required to draw a histogram
# server <- function(input, output) {
# 
#     output$distPlot <- renderPlot({
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white')
#     })
# }


# Run the application 
shinyApp(ui = ui, server = server)

