
#' Download Dataframes
#'
#' A shiny module that adds a download button to
#'
#' @param id Internal parameters for {shiny}
#' @inheritParams shinyWidgets::downloadBttn
#' @param tooltip_text text to appear when cursor hovers over download button (string)
#' @param tooltip_pos Where the tooltip should appear relative to its target (top, bottom, left, or right). Defaults to "right"
#' @export
mod_download_dataframe_ui <- function(id, label = "Download", tooltip_text ="", tooltip_pos = "right", style = "unite", color = "default", size="sm"){
  ns <- NS(id)
  tagList(
    shinyWidgets::downloadBttn(outputId = ns("out_download_bttn"), label = label, style = style, color = color, size = size) %>%
      shinyBS::tipify(title=tooltip_text, placement = tooltip_pos)
    )
}


#' Download Dataframe
#'
#' Downloads a dataframe or datatable.
#'
#' @param id Internal parameters for {shiny}
#' @param data_to_write dataframe or datatable (dataframe / data.table) (can be a reactive or non-reactive object)
#' @param filename_full Name to save file under. Include any extensions (string)
#' @param rownames Save row names? (boolean)
#' @param colnames Save column names? (boolean)
#'
#' @return None, Run for its side effects. Downloads a dataframe/data.table to the local machine.
#' @export
mod_download_dataframe_server <- function(id, data_to_write, filename_full, rownames=FALSE, colnames=TRUE){
  moduleServer(id,
    function(input, output, session){

      utilitybelt::assert_that(assertthat::is.flag(rownames))
      utilitybelt::assert_that(assertthat::is.flag(colnames))
      utilitybelt::assert_non_empty_string(filename_full)
      utilitybeltshiny::assert_reactive(data_to_write)

      output$out_download_bttn <- downloadHandler(filename = filename_full, content = function(file) {
        utilitybelt::assert_that(is.data.frame(data_to_write()) || data.table::is.data.table(data_to_write()), msg = utilitybelt::fmterror("mod_download_dataframe_server: data_to_write() must be a dataframe or a datatable, not a ", class(data_to_write())))
        utils::write.table(x=data_to_write(), file = file, append = FALSE, quote = TRUE, sep = "\t", row.names = rownames, col.names = colnames)
        })
  }
  )
}



# Copy in UI

# download_dataframe_ui("some_id")

# Copy in server

# download_dataframe_server("some_id", optional_argument)
