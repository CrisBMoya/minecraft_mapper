## Whole known world
tags$div(
	checkboxInput(inputId=session$ns("nether_mode"), label="Nether Mode", value=FALSE),
	tags$div(id = 'grid_setup' , class='grid-container',
		style=paste0("display: grid; grid-template-columns: ", paste0(rep(x='100px', max_ncol), collapse=' '),"; ",
			"grid-template-rows: ", paste0(rep(x='100px', max_nrow), collapse=' '),";"),
		lapply(1:(max_ncol*max_nrow), function(i) {
			uiOutput(outputId=session$ns(paste0('grid_',i)))
		})
	)
)