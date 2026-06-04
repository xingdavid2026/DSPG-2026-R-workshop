# Shiny Practice App
# David Xing
# June 4th, 2026

# Load packages
library(shiny)
library(shinythemes)
library(shinyjs)
library(tidyverse)

# UI: Layouts and Inputs/Outputs

ui <- fluidPage(
  # add ui code here
  titlePanel("Exploring the Normal Distribution"),
  plotOutput(outputId = "normal_plot"),
  textOutput(outputId = "context_discussion")
  
)

# Server: Logic and Reactivity
server <- function(input, output) {
  # add server code here
  
  output$normal_plot <- renderPlot({
    set.seed(seed = 7)
    samples <- rnorm(1000, 0, 1)
    
    hist(samples, breaks = 30, col = "maroon", 
         main = "Histogram of Normal Samples", xlab = "Value")
  })
  
  output$context_discussion <- renderText({
    "This histogram shows 1000 values randomly drawn from a standard normal distribution."
  })
  
}

# Launch App
shinyApp(ui = ui, server = server)




