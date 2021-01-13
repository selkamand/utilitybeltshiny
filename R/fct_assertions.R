#' assert_reactive
#'
#' @param object object to test
#' @param msg msg to be appended to the hard-coded default (string)
#'
#' @inherit utilitybelt::assert_that return
#' @export
assert_reactive <- function(object, msg = "")
{
  name_of_calling_function=utilitybelt::get_calling_function()
  utilitybelt::assert_that(shiny::is.reactive(object), msg = fmterror("[",name_of_calling_function,"] assert_reactive: The object [",
                                                            substitute(object), "] must be a reactive, not a ", class(object),
                                                            ". Check you didn't accidentally add parenthesis when passing the argument ", msg))
}


#' assert_reactive
#'
#' @param object object to test
#' @param msg msg to be appended to the hard-coded default (string)
#'
#' @inherit utilitybelt::assert_that return
#' @export
assert_non_reactive <- function(object, msg = "")
{
  name_of_calling_function=utilitybelt::get_calling_function()
  utilitybelt::assert_that(!shiny::is.reactive(object), msg = fmterror("[",name_of_calling_function,"] assert_reactive: The object [",
                                                                      substitute(object), "] must NOT be a reactive, not a ", class(object), msg))
}
