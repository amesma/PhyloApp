
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
 
  #check if columns exist in csv file
  
  order <- phy$order
  family <- phy$family
  genus <-phy$genus
  species <-phy$species
  
  #order, family, genus, genus+species
  output$species_output <- renderText({
    
      if (is.element(input$genus_text, genus) == TRUE && is.element(input$species_text, species) == TRUE){
        paste("The species is: ", order, " ", family, " ", genus, " ", species)
      }
      else  {
        paste("Oops, this species doesn't exist in the directory!")
      }
    
    #if genus and species exist
    #then output the selected variables
  })
  
})