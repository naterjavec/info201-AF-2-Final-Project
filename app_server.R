server <- function(input, output) {
  output$city_plot <- renderPlotly({
    data_and_plot(input$city_select, input$food)
  })
  output$food_plot <- renderPlotly({
    create_bar_chart(input$pg2_food)
  })
  temp_url <- a("here",
                href = "https://www.kaggle.com/berkeleyearth/climate-change-earth-surface-temperature-data")
  output$tab <- renderUI({
    tagList("To learn more about global temperatures, click", temp_url)
  })
  food_url <- a("here",
                href = "https://www.kaggle.com/jboysen/global-food-prices")
  output$tab2 <- renderUI({
    tagList("To learn more about food prices, click", food_url)
  })
  output$temp_chart <- renderPlot(
    create_temp_trends()
  )
}