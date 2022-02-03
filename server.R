library(shiny)
library(fpp3)

sales_df <- read.csv("data/clean_sales.csv")
sales_df$date <- as.Date(sales_df$date)
sales_df <- as_tsibble(sales_df, key = c("scode", "pcode"), index = "date")

server <- function(input, output) {
output$debug <- renderPrint({
  input$selected_product
  input$selected_store


  sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_product,]
  })
output$ts_plot <- renderPlot({
  plot_df <-  sales_df[sales_df$scode == input$selected_store & sales_df$pcode == input$selected_product,]

  autoplot(plot_df)
})
}

