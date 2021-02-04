specific_map = function(input, output, session, extra_data){
	
	user_url = extra_data$user_url
	coord_data = extra_data$coord_data
	
	output$specific_map=renderUI({
		source(file=paste0(getwd(),"/App/specific_map_UI.R"), local=TRUE)$value
	})
	
	map_name = gsub(pattern='map_', replacement='', x=user_url)
	
	output$map_spec = renderUI({
		tags$div(
			tags$div(id = 'grid_setup_spec' , class='grid-container',
				style=paste0("display: grid; grid-template-columns: ", paste0(rep(x='204px', 4), collapse=' '),"; ",
					"grid-template-rows: ", paste0(rep(x='204px', 4), collapse=' '),";",
					"background-image: url(",paste0(map_name,'.png'),"); width: 814px; height: 814px"),
				
				lapply(1:16, function(i) {
					tags$div(class = 'container_spec',
						tags$div(class = 'text_hover_container_c1_spec', coord_data[1,]$c1),
						tags$div(class = 'text_hover_container_c2_spec', coord_data[1,]$c2),
						tags$div(class = 'text_hover_container_c3_spec', coord_data[1,]$c3),
						tags$div(class = 'text_hover_container_c4_spec', coord_data[1,]$c4)
					)
				})
			)
		)
	})
	
	
}