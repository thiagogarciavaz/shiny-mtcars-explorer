library(shiny)
library(markdown)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Motor Trend Car Road Tests",
  tabPanel("Explorer",
    sidebarLayout(
      sidebarPanel(
        selectInput('x', 'X-axis', c("mpg", "disp", "hp", "drat", "wt", "qsec")),
        selectInput('color', 'Color', c("cyl", "vs", "am", "gear", "carb")),
        radioButtons("size", "Size:", c("hp", "wt"))
      ),
  
      # Show a plot of the generated distribution
      mainPanel(
         plotlyOutput("distPlot")
      )
    )
  ),
  tabPanel("About", includeMarkdown("README.md"))
  )
)