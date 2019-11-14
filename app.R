#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
        mainPanel(
            h3("Primary Content"),
            p("Plots, data tables, etc. would go here")
        )
    )
)

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

# Run the application 
shinyApp(ui = ui, server = server)
