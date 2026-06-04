# Shiny Interactivity Practice App
# David Xing
# June 4th, 2026

# Load packages
library(shiny)
library(shinythemes)
library(shinyjs)
library(tidyverse)

# UI
ui <- fluidPage(
  titlePanel("Interactive Greeting Application"),
  textInput(inputId = "user_input", label = "Enter your greeting:", 
            value = "Hello, World"),
  textOutput(outputId = "greeting")
  
)

# SERVER
server <- function(input, output) {
  output$greeting <- renderText({
    paste0(input$user_input, " is the greeting you entered")
  })
  
}

# LAUNCH APP
shinyApp(ui = ui, server = server)




