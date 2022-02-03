library(shiny)

ui <- fluidPage(
  selectInput(inputId = "selected_store", label = "Select store:", choices = unique(sales_df$scode)),
  selectInput(inputId = "selected_product", label = "Select product:", choices = unique(sales_df$pcode)),
  plotOutput('ts_plot'),
  verbatimTextOutput("debug"),



)
