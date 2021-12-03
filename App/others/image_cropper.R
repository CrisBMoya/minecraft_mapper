library(magick)

coherent_list = c(
	29,33,37,45,49,57,67,71,75,
	80,84,88,93,97,101,111,105,115,
	120,124,128,132,136,141,149,153,157,
	161,169,173,177,181,185,189,193,197,
	215,219,223,227,231,235,239,243,247,
	251,255,259,263,267,271,275,279,283,
	287,291,295)


file_img = list.files(path="C:/Users/tobal/AppData/Roaming/.minecraft/screenshots/tocrop/mod/", full.names=TRUE)

file_name = sub(pattern="mod/.*", replacement="", x=file_img)
file_name = paste0(file_name, paste0("mod/",coherent_list[1:length(file_img)], ".png"))
file_name_short = paste0(coherent_list[1:length(file_img)], ".png")


file.rename(from=file_img, to=file_name)

lapply(X=1:length(file_img), FUN=function(i){
	map_orig_img = image_read(path=file_name[i])
	map_cropped_img = image_crop(image=map_orig_img, geometry="814x814+873+90")
	
	image_write(image=map_cropped_img, path=paste0('C:/Users/tobal/Google Drive/Github/minecraft_mapper/www/',file_name_short[i]))
})
