map_finder=function(input, output, session, coord_data){
	
	source(file=paste0(getwd(), "/App/others/find_map_fun.R"))
	
	## Render
	output$map_finder=renderUI({
		source(file=paste0(getwd(),"/App/map_finder_UI.R"), local=TRUE)$value
	})
	
	## Get user input
	observeEvent(input$find_btn, {
		user_x = as.numeric(input$coord_x)
		user_z = as.numeric(input$coord_z)
		
		id_map = find_map_id(user_x=user_x, user_z=user_z, coord_data=coord_data)
		paint_map(id_map=as.character(id_map), coord_data=coord_data, user_x=user_x, user_z=user_z)
		js$point_map(id_x = paste0(id_map, "_map"), new_src = paste0(id_map, ".png"))
		js$point_map(id_x = paste0(id_map, "_map"), new_src = paste0(id_map, "_mod.png"))
		
		
		output$id_found = renderText({
			id_map
		})
	})
}


