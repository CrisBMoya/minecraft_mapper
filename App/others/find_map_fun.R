find_map_id = function(user_x, user_z, coord_data){
	res = lapply(X=1:nrow(coord_data), FUN=function(x){
		c1_range = as.numeric(unlist(strsplit(x=coord_data[x,]$c1, split=", ")))
		c4_range = as.numeric(unlist(strsplit(x=coord_data[x,]$c4, split=", ")))
		
		x_range = c(c1_range[1], c4_range[1])
		z_range = c(c1_range[2], c4_range[2])
		
		if ((user_x >= x_range[1] & user_x <= x_range[2]) & (user_z >= z_range[1] & user_z <= z_range[2])){
			return(coord_data[x,]$id)
		} else {
			return(NA)
		}
		
	})
	
	id_res = na.omit(unlist(res))
	if(length(id_res) == 0){
		return("Map Not Found")
	} else {
		return(as.character(id_res))
	}
}

paint_map = function(id_map, coord_data, user_x, user_z){
	
	if(id_map == "Map Not Found"){
		return()
	}
	
	## Get ranges and modify them
	c1_range = as.numeric(unlist(strsplit(x=coord_data[coord_data$id == id_map,]$c1, split=", ")))
	c4_range = as.numeric(unlist(strsplit(x=coord_data[coord_data$id == id_map,]$c4, split=", ")))
	
	x_range = c(c1_range[1], c4_range[1])
	z_range = c(c1_range[2], c4_range[2])
	
	x_pos = abs(c1_range[1] - user_x)
	y_pos = abs(c1_range[2] - user_z)
	
	x_transform = x_pos - abs(x_pos - x_pos*1024/814)
	y_transform = y_pos - abs(y_pos - y_pos*1024/814)
	
	## Get img
	img_temp = image_read(path=paste0("www/",id_map , ".png"))
	
	temp = image_draw(image=img_temp)
	symbols(x=x_transform, y=y_transform, circles=5, add=TRUE, inches=FALSE, fg="red", bg="cyan")
	dev.off()
	image_write(image=temp, path=paste0("www/",id_map,"_mod.png"))
	
}


