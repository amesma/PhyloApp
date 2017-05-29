
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Taxonomic Classification"),
  
  fluidRow(
    
    column(6, offset = 1,
           h3("Enter the genus and species you wish to find separated by a space"),
           textInput("species_text", label = "")
    )
    #Input box: genus
    #Input box: species
    
    #run through columns of csv and match
    #submit box
    #Output box
    
  ),
  fluidRow(
    column(12,
    h3("Check the taxonomic data you wish to save."),
    checkboxGroupInput("order_choices", "Choose which data to show:", c("Order", "Class", "Family"), selected = NULL)
    )
  ),
  
  fluidRow(
    
    column(6, offset = 3, align = "center",
           actionButton("submit_button", "Submit"), tags$style(type='text/css', "#button { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;}")
    )
    
  ),
  fluidRow(
    column(12,
           h2("Output of species")
    )
  ),
  
  fluidRow(
    column(4,
           textOutput("species_output")
    ),
    column(4,
           textOutput("error_bool"))
  )
  #export taxonomic data in csv form
  
))
