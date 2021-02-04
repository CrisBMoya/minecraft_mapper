library(magick)

map_orig_img = image_read(path='C:/Users/tobal/AppData/Roaming/.minecraft/screenshots/test.png')
map_cropped_img = image_crop(image=map_orig_img, geometry="814x814+873+90")

image_write(image=map_cropped_img, path='C:/Users/tobal/Google Drive/Github/minecraft_mapper/www/newmap.png')
