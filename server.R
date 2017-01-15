library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                        labels=c("3gears","4gears","5gears")) 
  mtcars$am <- factor(mtcars$am,levels=c(0,1),
                      labels=c("Automatic","Manual")) 
  mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                       labels=c("4cyl","6cyl","8cyl")) 
  
  output$distPlot <- renderPlotly({
    plot_ly(mtcars, x = mtcars[,input$x], y = mtcars$mpg, mode = "markers", color = as.factor(mtcars[, input$color]), size = mtcars[, input$size], type="scatter")
  })
  
})
