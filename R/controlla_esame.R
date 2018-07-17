#' controlla esame intero
#'
#' @param soluzione an object of class rexams
#'
#' @return the score for the test
#' @export
controlla_esame <- function(soluzione) {
  UseMethod("controlla_esame")
}

#' @describeIn controlla_esame default methods
#' @inheritParams controlla_esame
#' @export
controlla_esame.default <- function(soluzione) {
  stop("Qualcosa non va", call. = FALSE)
}


#' @describeIn controlla_esame default methods
#' @inheritParams controlla_esame
#' @export
controlla_esame.tdp_2018_2_a <- function(soluzione) {

  purrr::map_int(seq_along(mia_soluzione),
    ~controlla_risposta(soluzione, .)
  ) %>%
    sum()
}
