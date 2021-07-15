#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic
  mt <- reactive(mtcars)
  mod_download_dataframe_server("mod_download_dataframe_test", data_to_write = mt, filename_full = "mtcars.tsv", rownames = FALSE, colnames = TRUE)



  a <- reactiveVal(1)
  observeEvent( input$input_change_background_to_red , {
    if(a()==1){
      message("Clicked")
      shinyBS::updateButton(session = session, inputId = "input_change_background_to_red", label = "HAHAHA", style = "success")
      isolate(a(2))
    }
    else{
      shinyBS::updateButton(session = session, inputId = "input_change_background_to_red",  label = a(), style = "danger")
      isolate(a(1))
    }

  })

}
