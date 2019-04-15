server <- function(input, output) {

  filtered <- reactive({
    latam %>% filter(Year >= input$year[1],
                     Year <= input$year[2],
                     Country == input$country)
  })
  
 #Create plot
 output$barplot <- renderPlotly({
   print(
     ggplotly(
        ggplot(filtered(), aes(x = Year, y = Arrivals, group = Country, fill = Arrivals)) + 
           geom_col() +
           scale_fill_gradient(high = "#5b86e5", low = "#36d1dc") +
           theme_minimal()
            )
         )
  })
 
 #Table with tourist arrivals data
 output$view <- renderDataTable({
   filtered()
 })

 #Mean
 output$value1 <- renderValueBox({
   mean <- mean(filtered()$Arrivals, na.rm = TRUE)
   valueBox(
     formatC(mean, format = "d", big.mark = ','),
     paste('Mean'),
     icon = icon("chart-bar",lib = "font-awesome"),
     color = "teal")  
 })
 
 #Median
 output$value2 <- renderValueBox({
   median <- median(filtered()$Arrivals, na.rm = TRUE)
   valueBox(
     formatC(median, format = "d", big.mark = ','),
     paste('Median'),
     icon = icon("chart-pie",lib = "font-awesome"),
     color = "aqua")  
 })
 
 #Standard dev
 output$value3 <- renderValueBox({
   sd <- sd(filtered()$Arrivals, na.rm = TRUE)
   valueBox(
     formatC(sd, format = "d", big.mark = ','),
     paste('Standard Deviation'),
     icon = icon("chart-area",lib = "font-awesome"),
     color = "blue")  
 })
 
}