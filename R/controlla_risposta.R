#' controlla risposta
#'
#' @param soluzione an object of class rexams
#' @param domanda the number of question to check
#'
#' @return a the output of the test
#' @export
controlla_risposta <- function(soluzione, domanda) {
  UseMethod("controlla_risposta")
}

#' @describeIn controlla_risposta default methods
#' @inheritParams controlla_risposta
#' @export
controlla_risposta.default <- function(soluzione, domanda) {
  stop("Qualcosa non va, contatta un responsabile", call. = FALSE)
}


#' @describeIn controlla_risposta default methods
#' @inheritParams controlla_risposta
#' @export
controlla_risposta.tdp_2018_2_a <- function(soluzione, domanda) {
  if (domanda == 1 && check_esiste(soluzione, 1)) {
    tdp_2018_2_a_check_1(soluzione[[1]])
  } else if (domanda == 2 && check_esiste(soluzione, 2)) {
    tdp_2018_2_a_check_2(soluzione[[2]])
  } else if (domanda == 3 && check_esiste(soluzione, 3)) {
    tdp_2018_2_a_check_3(soluzione[[3]])
  } else if (domanda == 4 && check_esiste(soluzione, 4)) {
    tdp_2018_2_a_check_4(soluzione[[4]])
  } else if (domanda == 5 && check_esiste(soluzione, 5)) {
    tdp_2018_2_a_check_5(soluzione[[5]])
  } else if (domanda == 6 && check_esiste(soluzione, 6)) {
    tdp_2018_2_a_check_6(soluzione[[6]])
  } else if (domanda == 7 && check_esiste(soluzione, 7)) {
    tdp_2018_2_a_check_7(soluzione[[7]])
  } else if (domanda == 8 && check_esiste(soluzione, 8)) {
    tdp_2018_2_a_check_8(soluzione[[8]])
  } else if (domanda == 9 && check_esiste(soluzione, 9)) {
    tdp_2018_2_a_check_9(soluzione[[9]])
  } else if (domanda == 10 && check_esiste(soluzione, 10)) {
    tdp_2018_2_a_check_10(soluzione[[10]])
  } else {
    message(paste0("domanda o risposta ", domanda, " non presente nell'esame."))
    return(invisible(0L))
  }
}
