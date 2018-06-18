tdp1718_check_1 <- function(requested_wd = NULL) {

  message(paste0(
    'Directory di lavoro impostata: ', getwd(), '.\n'
  ))

  if (file.exists('death_ita.csv')) {
    message(paste0(
      'Sembra essere corretta.\n'
    ))

    return(invisible(TRUE))
  } else {
    message(paste0(
      'Sembra non essere quella corretta...\n'
    ))
    return(invisible(FALSE))
  }

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
    message('La base di dati sembra importata correttamente.\n')
    return(invisible(TRUE))
  } else {
    message('La base di dati non sembra importata correttamente...')
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

  if (
    numero_righe   == 765 &&
    numero_colonne == 4   &&
    setequal(nomi_colonne, c("cause_of_death", "percentuale", "anno", "mesi" ))
  ) {
    message('Le risposte sembrano essere tutte corrette.\n')
    return(invisible(TRUE))
  } else {
    message('Almeno una risposta sembra non essere corretta...')
    return(invisible(FALSE))
  }

}




tdp1718_check_4 <- function() {
  if ('cause_of_death' %in% colnames(death_ita)) {
    message(
      'la colonna `cause_of_death` sembra essere ancora presente nel dataset.\n'
    )
    return(invisible(FALSE))
  } else if (
    !'causa_del_decesso' %in% colnames(death_ita)
  ) {
    message(
      'la colonna `causa_del_decesso` non sembra presente nel dataset.\n'
    )
    return(invisible(FALSE))
  } else {
    message(
      "L'esercizio sembra essere corretto.\n"
    )
    return(invisible(TRUE))
  }
}
