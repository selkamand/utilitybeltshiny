
#' Download Dataframes
#'
#' A shiny module that adds a download button to
#'
#' @param id Internal parameters for {shiny}
#' @inheritParams shinyWidgets::downloadBttn
#' @param tooltip_text text to appear when cursor hovers over download button (string)
#' @export tooltip_pos Where the tooltip should appear relative to its target (top, bottom, left, or right). Defaults to "right"
#'
mod_download_dataframeUI <- function(id, label = "Download", tooltip_text ="", tooltip_pos = "right", style = "unite", color = "default", size="sm"){
  ns <- NS(id)
  tagList(
    shinyWidgets::downloadBttn(outputId = ns("out_download_bttn"), label = label, style = style, color = color, size = size) %>%
      shinyBS::tipify(title=tooltip_text, placement = tooltip_pos)
    )
}


#' Download Dataframe
#'
#' Should also work for datatables. May want to create another function that uses data.table to do this faster
#'
#' @param id Internal parameters for {shiny}
#' @param data_to_write dataframe or datatable (dataframe / data.table)
#' @param filename_full "filepath to save file as" (string)
#' @param rownames "Save Rownames (boolean)"
#' @param colnames ""
#'
#' @return None, Run for its side effects.
#' @export
mod_download_dataframeServer <- function(id, data_to_write, filename_full= "table.tsv", rownames=FALSE, colnames=TRUE){
  moduleServer(id,
    function(input, output, session){
      output$out_download_bttn <- downloadHandler(filename = filename_full, content = function(file) {
        write.table(x=data_to_write, file = file, append = FALSE, quote = TRUE, sep = "\t", row.names = rownames, col.names = colnames)
        })
  }
  )
}

# Copy in UI

# download_dataframeUI("some_id")

# Copy in server

# download_dataframeServer("some_id", optional_argument)
