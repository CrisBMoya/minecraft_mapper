library(shiny)
library(dplyr)
library(shinyjs)

## Source modules
source(paste0(getwd(),"/App/ui_controller.R"))
source(paste0(getwd(),"/App/world_map.R"))
source(paste0(getwd(),"/App/specific_map.R"))

## Define grid size
grid_size = read.table(file='App/others/map_size.txt', header=TRUE, sep='\t')
max_ncol = grid_size$max_ncol
max_nrow = grid_size$max_nrow

# Define the UI
shinyUI(fluidPage(id="main_page",
	includeCSS("www/styles.css"),
	useShinyjs(),
	
	UniversalUI(id="UniversalID")
))