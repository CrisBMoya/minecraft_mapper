tags$div(
		## Finder header
	tags$div(id = "finder",
		textInput(inputId=session$ns("coord_x"), label="X: ", value=0),
		textInput(inputId=session$ns("coord_z"), label="Z: ", value=0),
		actionButton(inputId=session$ns("find_btn"), label="Find!"),
		
		textOutput(outputId=session$ns("id_found"))
		
	)
	)