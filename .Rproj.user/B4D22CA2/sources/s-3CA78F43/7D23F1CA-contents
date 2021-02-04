library(shiny)
library(dplyr)
library(readxl)
library(shinyjs)
library(magick)


## Define grid size
grid_size = read.table(file='App/others/map_size.txt', header=TRUE, sep='\t')
max_ncol = grid_size$max_ncol
max_nrow = grid_size$max_nrow

## Get image list
img_list = list.files(path='www/')
img_list = img_list[grep(pattern='_', x=img_list)]

img_list_new = gsub(pattern='.*_', replacement='', x=img_list)

## Rename if so
file.rename(from=paste0('www/', img_list), 
	to=paste0('www/', img_list_new))

## Create excel sequences
col_seq = c(LETTERS, paste0(LETTERS[1],LETTERS), paste0(LETTERS[2],LETTERS))
row_seq = 1:100

full_excel = read_excel(path='App/others/minecraft_maps.xlsx', sheet=2, col_names=FALSE)
init_pos='A1'
end_pos=paste0(col_seq[dim(full_excel)[2]],dim(full_excel)[1])

col_index = seq(from=1, to=length(col_seq), by=5)
row_index = seq(from=1, to=max(row_seq), by=3)

coord_excel_list = list()
for(i in 1:10){
	temp_list = list()
	for(x in 1:6){
		temp_list[[x]] = paste0(col_seq[col_index[i]], row_seq[row_index[x]], ':', col_seq[col_index[i+1] - 1],row_seq[row_index[x+1] - 1], ' - ', i,',',x)
	}
	coord_excel_list[[i]] = unlist(temp_list)
}
coord_excel = unlist(coord_excel_list)

coord_data_lapply = lapply(X=coord_excel, FUN=function(x){
	
	sep_item = unlist(strsplit(x=x, split=' - '))
	range_temp = sep_item[1]
	col_temp = unlist(strsplit(x=sep_item[2], split=','))[1]
	row_temp = unlist(strsplit(x=sep_item[2], split=','))[2]
	
	map_data = suppressMessages({read_excel(path='App/others/minecraft_maps.xlsx', sheet=2, range=range_temp, col_names=FALSE)})
	
	if(nrow(map_data)==0){
		return(NULL)
	}
	
	colnames(map_data) = c('ca_x','ca_y','id_center','cb_x','cb_y')
	
	id_center = unlist(strsplit(x=map_data$id_center[2], split='\r\n'))
	
	coord = data.frame('c1' = paste0(map_data$ca_x[1], ', ' ,map_data$ca_y[1]),
		'c2' = paste0(map_data$cb_x[1], ', ' ,map_data$cb_y[1]),
		'c3' = paste0(map_data$ca_x[3], ', ' ,map_data$ca_y[3]),
		'c4' = paste0(map_data$cb_x[3], ', ' ,map_data$cb_y[3]),
		'center' = paste0(id_center[2], ', ', id_center[3]),
		'id' = id_center[1],
		'excel_coord' = range_temp,
		'col_pos' = col_temp,
		'row_pos' = row_temp)
	
	return(coord)
})

coord_data = bind_rows(coord_data_lapply)
coord_data = coord_data[coord_data$id != "",]
coord_data$col_pos = as.numeric(coord_data$col_pos)
coord_data$row_pos = as.numeric(coord_data$row_pos)

## Create dummy layout
grid_layout = matrix(data=1:(max_ncol * max_nrow), nrow=max_nrow, ncol=max_ncol, byrow=TRUE)


## Specific map layout
slice_map = expand.grid(c(0, 204, 408, 612),c(0, 204, 408, 612))
coordinates_slices = paste0('204x204+', slice_map$Var1 ,'+', slice_map$Var2)

# Define the server code
shinyServer(function(input, output, session){
	observe({
		callModule(module=world_map, id='UniversalID', extra_data = list("coord_data" = coord_data, "grid_layout" = grid_layout, "grid_size" = grid_size))
	})
	
})

# server = function(input, output, session) {
# 	
# 	observe({
# 		user_url=session$clientData$url_search
# 		user_url = gsub(pattern='\\?', replacement='', x=user_url)
# 		
# 		if(grepl(pattern='map_', x=user_url)){
# 			hide(id='grid_setup')
# 			show(id='map_spec')
# 			map_name = gsub(pattern='map_', replacement='', x=user_url)
# 			
# 			output$map_spec = renderUI({
# 				tags$div(
# 					#tags$img(src=paste0(map_name,'.png'), class = 'map_image_spec'),
# 					
# 					tags$div(id = 'grid_setup_spec' , class='grid-container',
# 						style=paste0("display: grid; grid-template-columns: ", paste0(rep(x='204px', 4), collapse=' '),"; ",
# 							"grid-template-rows: ", paste0(rep(x='204px', 4), collapse=' '),";", 
# 							"background-image: url(",paste0(map_name,'.png'),"); width: 814px; height: 814px"),
# 						
# 						lapply(1:16, function(i) {
# 							tags$div(class = 'container_spec',
# 								tags$div(class = 'text_hover_container_c1_spec', coord_data[1,]$c1),
# 								tags$div(class = 'text_hover_container_c2_spec', coord_data[1,]$c2),
# 								tags$div(class = 'text_hover_container_c3_spec', coord_data[1,]$c3),
# 								tags$div(class = 'text_hover_container_c4_spec', coord_data[1,]$c4)
# 							)
# 						})
# 					)
# 				)
# 			})
# 			
# 		} else {
# 			hide(id='map_spec')
# 			show(id='grid_setup')
# 			
# 			
# 			lapply(X=1:nrow(coord_data), FUN=function(x){
# 				grid_id = grid_layout[coord_data[x,]$row_pos, coord_data[x,]$col_pos]
# 				
# 				output[[paste0('grid_', grid_id)]]=renderUI({
# 					
# 					tags$div(class = 'container',
# 						tags$a(href = paste0('?map_', coord_data[x,]$id),
# 							tags$img(src=paste0(coord_data[x,]$id,'.png'), class = 'map_image'),
# 							
# 							tags$div(class = 'text_hover_container_c1', coord_data[x,]$c1),
# 							tags$div(class = 'text_hover_container_c2', coord_data[x,]$c2),
# 							tags$div(class = 'text_hover_container_c3', coord_data[x,]$c3),
# 							tags$div(class = 'text_hover_container_c4', coord_data[x,]$c4),
# 							tags$div(class = 'text_hover_container_center', tags$div(class = 'inner_centered', 
# 								paste0(coord_data[x,]$id, '\n', coord_data[x,]$center)))
# 						)
# 					)
# 					
# 				})
# 			})
# 			
# 		}
# 	})
# }

