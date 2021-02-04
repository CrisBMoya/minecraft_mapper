library(shiny)
library(dplyr)
library(readxl)
library(shinyjs)
library(magick)

# Define the server code
shinyServer(function(input, output, session){
	observe({
		
		user_url=session$clientData$url_search
		user_url = gsub(pattern='\\?', replacement='', x=user_url)
		
		if(grepl(pattern='map_', x=user_url)){
			
			hide(id='map_finder')
			hide(id='world_map')
			show(id='specific_map')
			hide(id='size_control')
			callModule(module=specific_map, id='UniversalID', extra_data = list("user_url" = user_url, "coord_data" = coord_data))
			
		} else {
			show(id='map_finder')
			hide(id='world_map')
			show(id='specific_map')
			show(id='size_control')
			callModule(module=map_finder, id="UniversalID", coord_data = coord_data)
			callModule(module=world_map, id='UniversalID', extra_data = list("coord_data" = coord_data, "grid_layout" = grid_layout, "grid_size" = grid_size))
			

			
		}
	})
	
	observeEvent(input$change_btn,{
		
		js$size_change(size=input$map_size_px, n_rep = 10)
		})
	
})