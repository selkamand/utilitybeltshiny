
#' Stop App when browser closes
#'
#' WARNING: Not working ATM
#'
#' @description
#' Stops the app running if a user closes their web browser. Useful if distributing your app as a desktop / electron app.
#'
#' Should be placed in the server function
#'
#' @export
close_app_on_browser_exit <- function(){
    session$onSessionEnded(function() {
      stopApp()
    })
  }
