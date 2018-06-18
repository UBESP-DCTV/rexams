#' tdp check 1
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_1 <- function() {

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










#' tdp check 2
#'
#' @return logical (invisibly)
#' @export
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
    is.data.frame(death_ita) &&
    dim(death_ita) == c(765L, 4L)      &&
    purrr::map_chr(death_ita, class) == c('factor', 'numeric', 'integer', 'factor')
  ) {
    message('La base di dati sembra importata correttamente.\n')
    return(invisible(TRUE))
  } else {
    message('La base di dati non sembra importata correttamente...\n')
    return(invisible(FALSE))
  }
}










#' tdp check 3
#'
#' @return logical (invisibly)
#' @export
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
    message('Almeno una risposta sembra non essere corretta...\n')
    return(invisible(FALSE))
  }

}










#' tdp check 4
#'
#' @return logical (invisibly)
#' @export
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










#' tdp check 5
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_5 <- function() {
  if (all(
    death_ita[['causa_del_decesso']] ==
    tolower(death_ita[['causa_del_decesso']])
  )) {
    message(
      "L'esercizio sembra essere corretto.\n"
    )
    return(invisible(TRUE))
  } else {
    message(
      "L'esercizio non sembra essere corretto...\n"
    )
    return(invisible(FALSE))
  }
}










#' tdp check 6
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_6 <- function() {
  if (all(
    death_ita[['causa_del_decesso']] ==
    gsub(" ", "_", death_ita[['causa_del_decesso']])
  )) {
    message(
      "L'esercizio sembra essere corretto.\n"
    )
    return(invisible(TRUE))
  } else {
    message(
      "L'esercizio non sembra essere corretto...\n"
    )
    return(invisible(FALSE))
  }
}










#' tdp check 7
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_7 <- function() {
  if (!'max_perc_death' %in% ls('.GlobalEnv')) {
    message("Il dataframe `max_perc_death` sembra non essere stato creato...\n")
    return(invisible(FALSE))
  } else if (!is.data.frame(max_perc_death)) {
    message("`max_perc_death` sembra non essere un dataframe...\n")
    return(invisible(FALSE))
  } else if (
    nrow(max_perc_death) != 1 ||
    max_perc_death[['causa_del_decesso']] != 'prematurity' ||
    max_perc_death[['anno']] != 2000 ||
    max_perc_death[['mesi']] != '0-1'
  ) {
    message('Il risultato sembra non essere quello corretto...\n')
    return(invisible(FALSE))
  } else {
    message('Il risultato sembra corretto.\n')
    return(invisible(TRUE))
  }
}










#' tdp check 8
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_8 <- function() {
  reference <- read.csv("inst/exams/tdp1718/death_ita.csv")[-1]
  reference[['mesi']] <- as.integer(reference[['mesi']])
  reference <- reference[
    order(reference$percentuale, reference$anno, reference$mesi),
  ]

  to_check <- death_ita[-1]
  to_check[['mesi']] <- as.integer(to_check[['mesi']])
  to_check <- to_check[
    order(to_check$percentuale, to_check$anno, to_check$mesi),
    ]

  if (
    all.equal(reference, to_check) &&
    setequal(
      levels(death_ita[['mesi']]),
      c("neonato", "prescolare", "fanciullo")
    )
  ) {
    message('Il risultato sembra essere quello corretto.\n')
    return(invisible(TRUE))
  } else {
    message('Il risultato non sembra essere quello corretto...\n')
    return(invisible(FALSE))
  }
}










#' tdp check 9
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_9 <- function() {
  if (!'median_p_death_causes' %in% ls('.GlobalEnv')) {
    message(
      "La tabella `median_p_death_causes` sembra non essere stata creata...\n"
    )
    return(invisible(FALSE))
  } else if (!is.matrix(median_p_death_causes)) {
    message("`median_p_death_causes` sembra non essere una tabella/matrice.\n")
    return(invisible(FALSE))
  }

  reference <- tapply(
      X     = death_ita$percentuale,
      INDEX = list(death_ita$causa_del_decesso, death_ita$mesi),
      FUN   = median, na.rm = TRUE
    ) %>%
    as.data.frame() %>%
    dplyr::arrange(neonato, prescolare, fanciullo) %>%
    as.matrix() %>%
    as.vector()

  to_check <- as.data.frame(median_p_death_causes) %>%
    dplyr::arrange(neonato, prescolare, fanciullo) %>%
    as.matrix() %>%
    as.vector()

  if (all(reference == to_check)) {
    message('Il risultato sembra essere quello corretto.\n')
    return(invisible(TRUE))
  } else {
    message('Il risultato non sembra essere quello corretto...\n')
    return(invisible(FALSE))
  }
}










#' tdp check 10
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_10 <- function() {
  df_requested <- c('top_neo_2000', 'top_neo_2016')
  df_ok <- df_requested %in% ls('.GlobalEnv')
  df_provided <- df_requested[df_ok]


  if (!all(df_ok)) {
    warning(
      "Sembra che almeno uno dei due dataset non sia stato creato...\n"
    )
  }

  mark <- 0

  try(
    if (!is.data.frame(top_neo_2000)) {
      message('`top_neo_2000` sembra non essere un dataframe...\n')
    } else if (
        top_neo_2000[['causa_del_decesso']][1:2] ==
          c('prematurity', 'congenital_anomalies')          &&

        top_neo_2000[['percentuale']][2:3] == c(28.7, 13.5) &&

        all(top_neo_2000[['anno']] == 2000)                 &&

        all(top_neo_2000[['mesi']] == 'neonato')
    ) {
      message('`top_neo_2000` sembra essere corretto.\n')
      mark <- mark + 1
    }
  )

  try(
    if (!is.data.frame(top_neo_2016)) {
      message('`top_neo_2016` sembra non essere un dataframe...\n')
    } else if (
      top_neo_2016[['causa_del_decesso']][1:2] ==
      c('prematurity', 'congenital_anomalies')            &&

      top_neo_2016[['percentuale']][2:3] == c(23.4, 21.7) &&

      all(top_neo_2016[['anno']] == 2016)                 &&

      all(top_neo_2016[['mesi']] == 'neonato')
    ) {
      message('`top_neo_2016` sembra essere corretto.\n')
      mark <- mark + 1
    }
  )

  if (mark == 2) {
    mark <- 3
  }
  return(invisible(mark))
}
