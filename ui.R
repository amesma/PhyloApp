
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Taxonomic Classification"),
  
  fluidRow(
    
    column(3, offset = 1,
           
           textInput("genus_text", label = "", value = "Enter Genus")
    ),
    
    column(3, offset = 3,
           
           textInput("species_text", label = "", value = "Enter Species")
    )
    #Input box: genus
    #Input box: species
    
    #run through columns of csv and match
    #submit box
    #Output box
    
  ),
  fluidRow(
    
    column(6, offset = 3, align = "center",
           actionButton("submit_form", label = "Submit"), tags$style(type='text/css', "#button { vertical-align- middle; height- 50px; width- 100%; font-size- 30px;}")
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
