#' Costructor for solution objects
#'
#' @param candidato [named list] contenente il nome, cognome e mat del
#'        candidato
#' @param corso [chr] sigle del corso
#' @param anno [int] anno del corso
#' @param appello [int] numero appello
#' @param tema [chr] id del tema d'esame
#'
#' @return an object of class "<corso>_<anno>_<appello>_<tema>"
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
#' esame_corrado
#' class(esame_corrado)
soluzione <- function(
  candidato = list(
    nome    = getOption("rexam_nome_candidato"),
    cognome = getOption("rexam_cognome_candidato"),
    mat     = getOption("rexam_matricola_candidato")
  ),
  corso   = getOption("rexam_corso"),
  anno    = getOption("rexam_anno"),
  appello = getOption("rexam_appello"),
  tema    = getOption("rexam_id_tema")
) {
  invisible(structure(
    vector("list", length = 0L),
    candidato = candidato,
    corso     = corso,
    anno      = anno,
    appello   = appello,
    tema      = tema,

    class = c(paste(corso, anno, appello, tema, sep = "_"), "rexam")
  ))
}

#' @describeIn soluzione print method for rexam objects
#' @param x a rexam object
#' @param ... further option for the function print
#'
#' @return invisibly x
#' @export
print.rexam <- function(x, ...) {
  cli::cat_line(
    crayon::blue("Esame per il corso di"), ": ", attr(x, "corso"),
    " (anno: ", attr(x, "anno"),
    " - ", "appello: ", attr(x, "appello"), "/", attr(x, "tema"), ")"
  )

  cli::cat_line(
    crayon::blue("Candidato"), ": ",
      paste(attr(x, "candidato")[['nome']], attr(x, 'candidato')[["cognome"]]),
    " (mat: ", attr(x, 'candidato')[["mat"]],")"
  )

  for (answer in seq_along(x)) {
    cli::cat_bullet(crayon::cyan(names(x)[[answer]]))
    cli::cat_line(str(x[[answer]]))
  }
  invisible(x)
}
