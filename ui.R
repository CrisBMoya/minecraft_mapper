library(shiny)
library(dplyr)
library(shinyjs)

## Source modules
source(paste0(getwd(), "/App/others/pre_load.R"))
source(paste0(getwd(), "/App/ui_controller.R"))
source(paste0(getwd(), "/App/world_map.R"))
source(paste0(getwd(), "/App/specific_map.R"))
source(paste0(getwd(), "/App/map_finder.R"))

## Define grid size
grid_size = read.table(file='App/others/map_size.txt', header=TRUE, sep='\t')
max_ncol = grid_size$max_ncol
max_nrow = grid_size$max_nrow

## IMG changer
shiny_extra_fun = "shinyjs.point_map = function(x){
var d = new Date();
var image=x.new_src+'?'+d.getMilliseconds();
document.getElementById(x.id_x).src=image;}

shinyjs.size_change = function(x){

var size_grid = x.size + ' '
var n_rep = x.n_rep


document.getElementById('grid_setup').style.gridTemplateColumns = size_grid.repeat(n_rep);
document.getElementById('grid_setup').style.gridTemplateRows = size_grid.repeat(n_rep);

var container_list = document.getElementsByClassName('container').length;

for(i = 0; i < container_list; i++){
document.getElementsByClassName('container')[i].style.width = x.size;
document.getElementsByClassName('container')[i].style.height = x.size;
}

var map_image_list = document.getElementsByClassName('map_image').length;

for(i = 0; i < map_image_list; i++){
document.getElementsByClassName('map_image')[i].style.width = x.size;
document.getElementsByClassName('map_image')[i].style.height = x.size;
}


};
"

# Define the UI
shinyUI(fluidPage(id="main_page",
	includeCSS("www/styles.css"),
	useShinyjs(),
	extendShinyjs(text = shiny_extra_fun, functions = c("point_map", "size_change")),
	
	tags$div(id="size_control",
		textInput(inputId="map_size_px", label="Map Size PX:"),
		actionButton(inputId="change_btn", label="Apply!")),
	
	UniversalUI(id="UniversalID")
))
