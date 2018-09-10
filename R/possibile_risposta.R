#' Title
#'
#' @param answer_obj
#'
#' @return
#' @export
#'
#' @examples
#' possibile_risposta(answer_1)
#' answer_1 <- 1
#' possibile_risposta(answer_1)
possibile_risposta <- function(answer_obj) {
  answer_chr <- as.character(rlang::enquo(answer_obj))[[2]]
  if (exists(rlang::eval_tidy(answer_chr), inherits = FALSE, envir = globalenv())) {
    answer_obj
  } else {
    NULL
  }
}
