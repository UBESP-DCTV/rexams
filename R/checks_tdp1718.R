#' tdp check 1
#'
#' @param file_to_check [chr] name of a file which should be into the WD
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_1 <- function(file_to_check = "death_ita.csv") {

  message(paste0(
    'Directory di lavoro impostata: ', getwd(), '.\n'
  ))

  if (file.exists(file_to_check)) {
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
  required_names <- "death_ita"
  names_ok <- exists(required_names, envir = parent.frame(), inherits = FALSE)

  if (!all(names_ok)) {
    message(paste0(
      "L'oggetto richiesto '", required_names[!names_ok], "' manca."
    ))
    return(invisible(FALSE))
  }

  if (
    is.data.frame(death_ita) &&
    all(dim(death_ita) == c(765L, 4L))      &&
    (
      all(purrr::map_chr(death_ita, class) == c('character', 'numeric', 'integer', 'character')) ||
      all(purrr::map_chr(death_ita, class) == c('factor', 'numeric', 'integer', 'factor'))
    )
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
  names_ok <- purrr::map_lgl(required_names, exists)

  if (!all(names_ok)) {
    message(paste0(
      "La variabile richiesta '", required_names[!names_ok], "' manca.\n"
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
#' @param main_df a data.frame
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_4 <- function(main_df = death_ita) {
  if ('cause_of_death' %in% colnames(main_df)) {
    message(
      'la colonna `cause_of_death` sembra essere ancora presente nel dataset.\n'
    )
    return(invisible(FALSE))
  } else if (
    !'causa_del_decesso' %in% colnames(main_df)
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
#' @param text_var [chr] name of the variable to transform
#' @param .fun the function requested for the transformation. Note, the
#'        function schould be an idempotent one, i.e.
#'        `.fun(.fun(x)) == .fun(x)`.`
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_5 <- function(text_var = "causa_del_decesso", .fun = toupper) {
  if (all(
    death_ita[[text_var]] ==
    .fun(death_ita[[text_var]])
  )) {
    message("L'esercizio sembra essere corretto.\n")
    return(invisible(TRUE))
  } else {
    message("L'esercizio non sembra essere corretto...\n")
    return(invisible(FALSE))
  }
}










#' tdp check 6
#'
#' @param text_var [chr] name of the variable to transform
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_6 <- function(text_var = "causa_del_decesso") {
  if (all(
    death_ita[[text_var]] ==
    gsub(" ", "_", death_ita[[text_var]])
  )) {
    message("L'esercizio sembra essere corretto.\n")
    return(invisible(TRUE))
  } else {
    message("L'esercizio non sembra essere corretto...\n")
    return(invisible(FALSE))
  }
}










#' tdp check 7
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_7 <- function() {
  if (!exists('max_perc_death')) {
    message("Il dataframe `max_perc_death` sembra non essere stato creato...\n")
    return(invisible(FALSE))
  } else if (!is.data.frame(max_perc_death)) {
    message("`max_perc_death` sembra non essere un dataframe...\n")
    return(invisible(FALSE))
  } else if (
    nrow(max_perc_death) != 1 ||
    max_perc_death[['causa_del_decesso']] != 'PREMATURITY' ||
    max_perc_death[['anno']] != 2000 ||
    (!max_perc_death[['mesi']] %in% c('0-1', 'neonato'))
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
#' @param df_name [chr] the name of the principal data.frame
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_8 <- function(df_name   = "death_ita",
                            ord_one   = 'percentuale',
                            ord_two   = 'anno',
                            ord_three = 'mesi'
) {
  reference <- read.csv(
    system.file("exams/tdp1718/death_ita.csv", package = "rexams")
  )[-1]
  reference[[ord_three]] <- as.integer(reference[[ord_three]])
  reference <- reference[
    order(reference$percentuale, reference$anno, reference$mesi),
  ]

  if (!exists(df_name)) {
    message("The main dataframe seams not imported...\n")
    return(invisible(FALSE))
  }

  if (!is.data.frame(death_ita)) {
    message("The main dataframe seams not to be a dataframe...\n")
    return(invisible(FALSE))
  }

  if (any(
    purrr::map_lgl(c(ord_one, ord_two, ord_three),
      ~is.null(death_ita[[.]])
    )
  )) {
    message("The main dataframe's variables seams not to be correct...\n")
    return(invisible(FALSE))
  }

  to_check <- death_ita[-1] %>% as.data.frame()
  to_check[[ord_three]] <- as.integer(to_check[[ord_three]])
  to_check <- to_check[
    order(to_check[[ord_one]], to_check[[ord_two]], to_check[[ord_three]]),
    ]

  if (
    isTRUE(all.equal(reference, to_check)) &&
    setequal(
      levels(death_ita[[ord_three]]),
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
#' @param matrix_name [chr] the name of the requested matrix
#'
#' @return logical (invisibly)
#' @export
tdp1718_check_9 <- function(matrix_name = "median_p_death_causes") {
  if (!exists(matrix_name)) {
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
  df_requested <- c('bot_fan_2000', 'bot_fan_2016')
  df_ok <- purrr::map_lgl(df_requested, exists)
  df_provided <- df_requested[df_ok]


  if (!all(df_ok)) {
    message("Sembra che almeno uno dei due dataset non sia stato creato...\n")
  }

  mark  <- FALSE
  first <- TRUE
  score <- 0L

  try(silent = TRUE, {
    if (!is.data.frame(bot_fan_2000)) {
      message('`bot_fan_2000` sembra non essere un dataframe...\n')
      mark <- FALSE
    } else if (
        bot_fan_2000[['causa_del_decesso']][1:2] ==
          c('PERTUSSIS', 'TETANUS')          &&

        bot_fan_2000[['percentuale']][2:3] == c(0.0, 0.0) &&

        all(bot_fan_2000[['anno']] == 2000)                 &&

        all(bot_fan_2000[['mesi']] %in% c('fanciullo', '1-59'))
    ) {
      message('`bot_fan_2000` sembra essere corretto.\n')
      mark <- TRUE
    } else {
      message('`bot_fan_2000` sembra non essere corretto...\n')
      mark <- FALSE
    }

    score <- score + score(mark)
    if (score(mark) > 0L) {
      score <- score + 1L
      first <- FALSE
    }
  })

  mark <- FALSE
  try(silent = TRUE, {
    if (!is.data.frame(bot_fan_2016)) {
      message('`bot_fan_2016` sembra non essere un dataframe...\n')
      mark <- FALSE
    } else if (
      bot_fan_2016[['causa_del_decesso']][1:2] ==
      c('HIV/AIDS', 'TETANUS')            &&

      bot_fan_2016[['percentuale']][2:3] == c(0.0, 0.0) &&

      all(bot_fan_2016[['anno']] == 2016)                 &&

      all(bot_fan_2016[['mesi']]  %in% c('fanciullo', '1-59'))
    ) {
      message('`bot_fan_2016` sembra essere corretto.\n')
      mark <- TRUE
    } else {
      message('`bot_fan_2016` sembra non essere corretto...\n')
      mark <- FALSE
    }

    score <- score + score(mark)
    if (first) {
      score <- score + score(mark)
      first <- FALSE
    }
  })

  if (score < 0) {
    score <- score - first
  }

  invisible(score)
}










#' tdp score overall
#'
#' @return the final score
#' @export
score_my_exam <- function() {
  suppressMessages({
    partial_score <-
      tdp1718_check_3() +
      tdp1718_check_4() +
      tdp1718_check_5() +
      tdp1718_check_6() +
      2L * tdp1718_check_7() +
      2L * tdp1718_check_8() +
      2L * tdp1718_check_9() +
      tdp1718_check_10()
  })

  if (partial_score == 0L) {
    final_score <-
      score(tdp1718_check_1) +
      score(tdp1718_check_2)
  } else {
    suppressMessages({
      final_score <-
        rexams:::score(tdp1718_check_3()) +
        rexams:::score(tdp1718_check_4()) +
        rexams:::score(tdp1718_check_5()) +
        rexams:::score(tdp1718_check_6()) +
        2L * rexams:::score(tdp1718_check_7()) +
        2L * rexams:::score(tdp1718_check_8()) +
        2L * rexams:::score(tdp1718_check_9()) +
        tdp1718_check_10() + 2L
    })
  }

  message(paste0(
    "Punteggio finale stimato per questo esame: ", final_score, ".\n"
  ))
}









#' Submit exam
#'
#' @param x filename
#'
#' @export
submit_my_exam <- function(x = 'tdp1718.R') {
  rmarkdown::render(x, encoding = "UTF-8", envir = new.env())
  utils::browseURL(stringr::str_replace_all(x, "(.+)\\..+?$", "\\1\\.nb\\.html"))
}
