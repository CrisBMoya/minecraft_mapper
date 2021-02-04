library(shiny)
library(dplyr)
library(shinyjs)

## Source modules
source(paste0(getwd(),"/App/ui_controller.R"))
source(paste0(getwd(),"/App/world_map.R"))

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

# ui <- fluidPage(
# 	includeCSS("www/styles.css"),
# 	
# 	useShinyjs(),
# 	
# 	## Finder header
# 	tags$div(id = "finder",
# 		textInput(inputId="coord_x", label="X: ", value=0),
# 		textInput(inputId="coord_y", label="Y: ", value=0),
# 		actionButton(inputId="find_btn", label="Find!")
# 	),
# 	
# 	## Zoom to 1 map
# 	uiOutput(outputId = "map_spec"),
# 	
# 	## Whole known world
# 	tags$div(
# 		checkboxInput(inputId="nether_mode", label="Nether Mode"),
# 		tags$div(id = 'grid_setup' , class='grid-container', 
# 			style=paste0("display: grid; grid-template-columns: ", paste0(rep(x='100px', max_ncol), collapse=' '),"; ",
# 				"grid-template-rows: ", paste0(rep(x='100px', max_nrow), collapse=' '),";"),
# 			lapply(1:60, function(i) {
# 				uiOutput(outputId=paste0('grid_',i))
# 			})
# 		)
# 	)
# )

