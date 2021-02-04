## Whole known world
tags$div(
	## Finder header
	tags$div(id = "finder",
		textInput(inputId=session$ns("coord_x"), label="X: ", value=0),
		textInput(inputId=session$ns("coord_y"), label="Y: ", value=0),
		actionButton(inputId=session$ns("find_btn"), label="Find!")
	),
	
	checkboxInput(inputId="nether_mode", label="Nether Mode"),
	tags$div(id = 'grid_setup' , class='grid-container',
		style=paste0("display: grid; grid-template-columns: ", paste0(rep(x='100px', max_ncol), collapse=' '),"; ",
			"grid-template-rows: ", paste0(rep(x='100px', max_nrow), collapse=' '),";"),
		lapply(1:60, function(i) {
			uiOutput(outputId=session$ns(paste0('grid_',i)))
		})
	)
)