world_map = function(input, output, session, extra_data){
	
	coord_data = extra_data$coord_data
	grid_layout = extra_data$grid_layout
	grid_size = extra_data$grid_size
	max_ncol = grid_size$max_ncol
	max_nrow = grid_size$max_nrow
	
	## Render UI for world map generation
	output$world_map=renderUI({
		source(file=paste0(getwd(),"/App/world_map_UI.R"), local=TRUE)$value
	})

	lapply(X=1:nrow(coord_data), FUN=function(x){
		grid_id = grid_layout[coord_data[x,]$row_pos, coord_data[x,]$col_pos]

		output[[paste0('grid_', grid_id)]]=renderUI({

			tags$div(class = 'container',
				tags$a(href = paste0('?map_', coord_data[x,]$id),
					tags$img(src=paste0(coord_data[x,]$id,'.png'), class = 'map_image'),

					tags$div(class = 'text_hover_container_c1', coord_data[x,]$c1),
					tags$div(class = 'text_hover_container_c2', coord_data[x,]$c2),
					tags$div(class = 'text_hover_container_c3', coord_data[x,]$c3),
					tags$div(class = 'text_hover_container_c4', coord_data[x,]$c4),
					tags$div(class = 'text_hover_container_center', tags$div(class = 'inner_centered',
						paste0(coord_data[x,]$id, '\n', coord_data[x,]$center)))
				)
			)

		})
	})
}