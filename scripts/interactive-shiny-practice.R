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
  
  textInput(inputId = "user_input1", label = "Enter your greeting:", 
            value = "Hello, World"),
  textOutput(outputId = "greeting1"),
  
  selectInput(inputId = "user_input2", label = "Choose your greeting:",
              choices = c("Hello, World", "Howdy", "What's up"),
              selected = "What's up"),
  textOutput(outputId = "greeting2"),
  
  radioButtons(inputId = "user_input3", label = "Pick your greeting:",
              choices = c("Hello, World", "Howdy", "What's up"),
              selected = "What's up"),
  textOutput(outputId = "greeting3"),
  
  textInput(inputId = "name", label = "What is your name?"),
  textOutput("greeting4")
)

# SERVER
server <- function(input, output) {
  output$greeting1 <- renderText({
    paste0(input$user_input1, " is the greeting you entered")
  })
  
  output$greeting2 <- renderText({
    paste0(input$user_input2, " is the greeting you entered")
  })
  
  output$greeting3 <- renderText({
    paste0(input$user_input3, " is the greeting you entered")
  })

  output$greeting4 <- renderText({
    paste0(input$greeting4, " ", input$name)
  })
}

# LAUNCH APP
shinyApp(ui = ui, server = server)




