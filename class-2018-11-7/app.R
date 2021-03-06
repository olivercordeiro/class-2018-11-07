#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(dplyr)

yellow <- readRDS("class.rds")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Class 11/7/18"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("c",
                  label = "Choose a c",
                  choices = c(yellow$c), 
                  multiple = TRUE)),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("myPlot"))))


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$myPlot <- renderPlot({
    yellow %>% 
      filter(c == input$c) %>% 
      ggplot(aes(x = b)) +
      geom_histogram() 
  })}

# Run the application 
shinyApp(ui = ui, server = server)

