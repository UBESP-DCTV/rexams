tdp1718_check_1 <- function() {

  message(paste0(
    'La directory di lavoro impostata è: ', actual_wd, '.\n'
  ))

  invisible(TRUE)

}

tdp1718_check_2 <- function() {
  required_names <- c("death_ita")
  names_ok <- required_names %in% ls('.GlobalEnv')

  if (!all(names_ok)) {
    message(paste0(
      "L'oggetto richiesto '", required_names[!names_ok], "' manca."
    ))
    return(invisible(NULL))
  }

  if (
    'data.frame' %in% class(death_ita) &&
    dim(death_ita) == c(765L, 4L)      &&
    purrr::map_chr(death_ita, class) == c('factor', 'numeric', 'integer', 'factor')
  ) {
    message('Base di dati importata correttamente.\n')
    return(invisible(TRUE))
  } else {
    message('Base di dati non importata correttamente.')
    return(invisible(FALSE))
  }
}




tdp1718_check_3 <- function() {
  required_names <- c("numero_righe", "numero_colonne", "nomi_colonne")
  names_ok <- required_names %in% ls('.GlobalEnv')

  if (!all(names_ok)) {
    message(paste0(
      "La variabile richiesta '", required_names[!names_ok], "' manca."
    ))
    return(invisible(FALSE))
  }

  message(paste0(
    'Il numero di righe della base di dati è: ',   numero_righe,   ';\n',
    'Il numero di colonne della base di dati è: ', numero_colonne, ';\n',
    'I nomi delle colonne della base di dati sono: ',
    paste(nomi_colonne, collapse = ", "), '.\n'
  ))
  invisible(TRUE)
}
