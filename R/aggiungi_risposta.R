#' Add answer
#'
#' @param a solution object
#' @param domanda [int] the number(s) of the question(s) to answer
#' @param risposta [any] the object(s) with the answer to the question(s)
#'
#' @return a solution object
#' @export
#'
#' @examples
#' esame_corrado <- soluzione(
#'   candidato = list(nome = "Corrado", cognome = "Lanera", mat = 1234),
#'   corso     = "tdp",
#'   anno      = 2018,
#'   appello   = 2,
#'   tema      = "a"
#' )
#' esame_corrado <- aggiungi_risposta(esame_corrado, 2, TRUE)
#' esame_corrado
aggiungi_risposta <- function(a, domanda, risposta) {

  a[domanda][[1]] <- risposta
  names(a)[seq_len(domanda)] <- paste0("R", seq_len(domanda))
  a
}
