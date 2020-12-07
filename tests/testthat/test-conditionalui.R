test_that("conditionalUI works", {
  ui_to_test=shiny::p("Hellooooo")
  empty_taglist = shiny::tagList()
  testthat::expect_identical(conditionalUI(TRUE, ui_to_test), shiny::tagList(ui_to_test))
  testthat::expect_s3_class(conditionalUI(TRUE, ui_to_test), class = "shiny.tag.list")
  testthat::expect_s3_class(conditionalUI(FALSE, ui_to_test), class = "shiny.tag.list")
  testthat::expect_identical(conditionalUI(FALSE, ui_to_test), shiny::tagList())
})
