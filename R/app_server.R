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
}
