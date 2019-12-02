#server
server <- function(input, output) {
    output$cityPlot <- renderPlot(
        data_and_plot(city_temp_data(input$City), city_food_data(input$cm_name))
    )
}
