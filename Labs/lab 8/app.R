
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
   abline(lm(data$Sales ~ data[,input$reg]), col = "red")
   })
}

shinyApp(ui = ui, server = server)


MN EARN WNE MALE0 P6
ui <- fluidPage(

)

server <- function(input, output) {
  output$data <- renderTable({
    mtcars[, c("mpg", input$variable), drop = FALSE]
  }, rownames = TRUE)
}

shinyApp(ui, server)