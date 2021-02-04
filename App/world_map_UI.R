## Whole known world
tags$div(
	checkboxInput(inputId="nether_mode", label="Nether Mode"),
	tags$div(id = 'grid_setup' , class='grid-container',
		style=paste0("display: grid; grid-template-columns: ", paste0(rep(x='100px', max_ncol), collapse=' '),"; ",
			"grid-template-rows: ", paste0(rep(x='100px', max_nrow), collapse=' '),";"),
		lapply(1:60, function(i) {
			uiOutput(outputId=paste0('grid_',i))
		})
	)
)