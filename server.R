
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)

phy <- read.csv("PFC_clean_classification.csv", header = TRUE)

#put scripts that are only run once here, load i csv files
shinyServer(function(input, output) {
  #clear input for uppercase
  user_genus <- input$genus_text
  user_species <-input$species_text
  order <- phy$order
  family <- phy$family
  genus <-phy$genus
  species <-phy$species
  
  #check if columns exist in csv file
  
  #order, family, genus, genus+species
  output$species_output <- renderText
  ({
    input$submit_form
    if (is.element(user_genus, genus) == TRUE && is.element(user_species, species) == TRUE){
      paste("The species is: ", order, family, genus, species)
    }
    else  {
      paste("Oops, this species doesn't exist in the directory!")
    }
    #if genus and species exist
    #then output the selected variables
    
    
  })
})