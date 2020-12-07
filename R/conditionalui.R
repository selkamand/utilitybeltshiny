
#' @title Conditional UI
#' @description
#' This function takes some UI element and a compiletime-evaluated expression and returns the UI element ONLY if the condition is true
#'
#' WARNING: Do NOT use this function for runtime-dynamic UI elements. Only works with compiletime variables.
#' For dynamic UI see ?shiny::conditionalPanel()
#'
#' @param expression compile-time evaluated expression (no server/reactive variables)
#' @param ui_element the UI element to display if
#'
#' @return if expression==TRUE: taglist wrapping passed UI element. If expression == FALSE, empty taglist
#' @export
#'
#' @examples
#' \donttest{
#' #In UI:
#' somevariable=TRUE
#' shinyWidgets::panel(heading="constitutivepanel",
#'    conditionalUI(somevariable, shinyWidgets::panel(somevariable, heading="ConditionalPanel")),
#'
#'    shiny::h1("constitutive title"),
#'    shiny::p("constitutive paragraph")
#'    )
#' }
#'
conditionalUI <- function(expression, ui_element){
  utilitybelt::assert_that(is.logical(expression), msg="expression needs to be logical")
  if(expression)
    return(shiny::tagList(ui_element))
  else
    return(shiny::tagList())
}
