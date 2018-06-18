#' Score
#'
#' @param x a boolean
#'
#' @return 1 if TRUE, -1 if FALSE
score <- function(x) {
  assertive::assert_is_a_bool(x)
  (x - 0.5) * 2
}
