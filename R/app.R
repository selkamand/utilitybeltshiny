library(shiny)

ui <- fluidPage(
  mod_download_dataframeUI(id = "mod_download_dataframe_test")
)

server <- function(input, output, session) {
  download_dataframeServer("mod_download_dataframe_test")
}

shinyApp(ui, server)
