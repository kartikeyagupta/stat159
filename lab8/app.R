
library(shiny)

ui <- fluidPage(
  selectInput(inputId = "reg",
              label = "Choose a regression to run",
              choices = c("Tv" = "TV",
                          "Radio" = "Radio",
                          "Newspaper" = "Newspaper")),
  plotOutput("regout")
)

server <- function(input, output) {
 data = read.csv("Advertising.csv", row.names = 1 )

 output$regout = renderPlot({
   plot(data[,input$reg],data$Sales)
   })
}

shinyApp(ui = ui, server = server)