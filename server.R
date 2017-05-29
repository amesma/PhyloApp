
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)

#csv should only be loaded in once
phy <- read.csv("PFC_clean_classification.csv", header = TRUE)

#put scripts that are only run once here
shinyServer(function(input, output) {
  
  #csv_species <- NULL
  
  observeEvent(
    eventExpr = input[["submit_button"]],
    handlerExpr = {
      print("PRESSED") #simulation code can go here

  
  show_spe <- FALSE
  show_fam <- FALSE
  show_ord <- FALSE
  show_cla <- FALSE
  
  final_spe <- NULL
  
  cla <- ""
  ord <- ""
  fam <- ""
  
  #clear input for uppercase
 
  #check if columns exist in csv file
  
  #species <- strsplit(phy$genus.species, " ")[[1]]
  
  #order, family, genus, genus+species
  output$species_output <- renderText({
    
    #right now, case sensitive
    
    #csv_species <- (input$species_text)
    
    if (input$species_text %in% phy$genus.species)
    {
      species <- (input$species_text)
    #now you get a data frame consisting of all the matched species, just match first row
    #if user_data has more than one row, alert:
      csv_sub <- subset(phy, genus.species == input$species_text)
     
      #csv_sub <- subset(csv_sub, !duplicated(csv_sub[c(input$species_text)]), select = c(input$species_text)
      csv_sub <- csv_sub[1,]
    
    #obtains user input about which taxonomic orders to show
    
    order <- "Order"       %in% input$order_choices
    class <- "Class"     %in% input$order_choices
    family <- "Family"  %in% input$order_choices
    
    if (class)
    {
      show_cla <- TRUE
      cla <- csv_sub$class
      
    }
    
    if (order)
    {
      show_ord <- TRUE
      ord <- csv_sub$order
      
    }
    
    if (family)
    {
      show_fam <- TRUE
      fam <- csv_sub$family
    }
  
    #match to csv
    #if exist, output selected elements as a concatenation of different strings
    #if not exist, output error message
    #save the output to a csv file
    
      #if (is.element(input$genus_text, genus) == TRUE && is.element(input$species_text, species) == TRUE){
      # paste("The species is: ", order, " ", family, " ", genus, " ", species)
      #}
      
          paste(cla, " ", ord, " ", fam, " ", species)

    }
    else  {
      paste("Oops, this species doesn't exist in the directory!")
    }
    #if genus and species exist
    #then output the selected variables
  })
    })
})