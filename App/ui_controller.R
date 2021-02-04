## Universal UI Module function.
UniversalUI=function(id, label="UniversalUI"){
  
  ## Mandatory UI start. This is a system necessity to identifie UI component from the server when it comes from foreign scripts, i.e: code outside the server file.
  ns=NS(id)
  
  ## Generate UI Output spaces inside a FluidPage to give an empty space to render UI.
  fluidPage(
  	uiOutput(outputId=ns('map_finder')),
    uiOutput(outputId=ns('world_map')),
    uiOutput(outputId=ns('specific_map'))
  )
}