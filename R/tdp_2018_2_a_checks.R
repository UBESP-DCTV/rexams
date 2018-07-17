#' tdp 2018, appello 2, tema a, check 1
#'
#' @param wd [chr] working directory
#' @param file_to_check [chr] path of a file to check into the wd
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_1 <- function(wd = getwd(), file_to_check = "death_ita.csv"){

  old_wd <- setwd(wd)
  on.exit(setwd(old_wd), add = TRUE)

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







#' tdp 2018, appello 2, tema a, check 2
#'
#' @param provided_names names included in the workspace
#' @param required_names variable'names required
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_2 <- function(
  provided_names = NULL,
  required_names = "death_ita"
) {
  if (is.null(provided_names)) {
    names_ok <- exists(required_names, envir = parent.frame(), inherits = FALSE)
  } else {
    names_ok <- required_names %in% provided_names
  }
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









#' tdp 2018, appello 2, tema a, check 3
#'
#' @param data a list of data to check
#' @param reference a list of real data
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_3 <- function(data, reference) {

  required_names <- c("numero_righe", "numero_colonne", "nomi_colonne")
  names_ok <- purrr::map_lgl(required_names, exists)

  if (!all(names_ok)) {
    message(paste0(
      "La variabile richiesta '", required_names[!names_ok], "' manca.\n"
    ))
    return(invisible(FALSE))
  }

  message(paste0(
    'Numero di righe proposte: ',   numero_righe,   ';\n',
    'Numero di colonne proposte: ', numero_colonne, ';\n',
    'Nomi proposti per le colonne: ',
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









#' tdp 2018, appello 2, tema a, check 4
#'
#' @param main_df a data.frame
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_4 <- function(main_df) {
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














#' tdp 2018, appello 2, tema a, check 5
#'
#' @param text_var [chr] name of the variable to transform
#' @param .fun the function requested for the transformation. Note, the
#'        function schould be an idempotent one, i.e.
#'        `.fun(.fun(x)) == .fun(x)`.`
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_5 <- function(main_df, .fun = tolower
) {
  if (is.null(main_df[["causa_del_decesso"]])) {
    message("L'esercizio non sembra essere corretto...\n")
    message("variabile causa_del_decesso non presente nel dataset")
    return(invisible(FALSE))
  }
  if (all(
    main_df[["causa_del_decesso"]] ==
    .fun(read.csv("death_ita.csv", stringsAsFactors = FALSE)[["cause_of_death"]])
  )) {
    message("L'esercizio sembra essere corretto.\n")
    return(invisible(TRUE))
  } else {
    message("L'esercizio non sembra essere corretto...\n")
    return(invisible(FALSE))
  }
}













#' tdp 2018, appello 2, tema a, check 6
#'
#' @param main_df [data.frame] main dataframe
#' @param new_value [chr] character used to substitute the white spaces
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_6 <- function(main_df, new_value = '') {
  if (is.null(main_df[["causa_del_decesso"]])) {
    message("L'esercizio non sembra essere corretto...\n")
    message("variabile causa_del_decesso non presente nel dataset")
    return(invisible(FALSE))
  }
  if (all(
    tolower(main_df[["causa_del_decesso"]]) ==
    tolower(gsub(" ", new_value,
      read.csv("death_ita.csv", stringsAsFactors = FALSE)[["cause_of_death"]]
    ))
  )) {
    message("L'esercizio sembra essere corretto.\n")
    return(invisible(TRUE))
  } else {
    message("L'esercizio non sembra essere corretto...\n")
    return(invisible(FALSE))
  }
}














#' tdp 2018, appello 2, tema a, check 7
#'
#' @param main_df [data.frame] main dataframe
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_7 <- function(main_df) {
  if (
    all.equal(
      main_df[["percentuale"]],
      read.csv("death_ita.csv", stringsAsFactors = FALSE) %>%
        `[[`("percentuale") %>%
        `[`(. > 0)
    )
  ){
    message('Il risultato sembra corretto.\n')
    return(invisible(TRUE))
  } else {
    message('Il risultato sembra non essere quello corretto...\n')
    return(invisible(FALSE))
  }
}








#' tdp 2018, appello 2, tema a, check 8
#'
#' @param main_df [chr] main data.frame
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_8 <- function(main_df,
                            ord_one   = 'percentuale',
                            ord_two   = 'anno',
                            ord_three = 'mesi'
) {
  reference <- read.csv("death_ita.csv", stringsAsFactors = FALSE)[-1]
  reference[["mesi"]] <- factor(reference[["mesi"]],
    levels = c("0-1", "2-59", "0-59"),
    labels = c("neonato", "fanciullo", "prescolare")
  )
  reference <- reference[
    order(reference$percentuale, reference$anno, as.character(reference$mesi)),
    ]

  if (!is.data.frame(main_df)) {
    message("The object provided seams not to be a dataframe...\n")
    return(invisible(FALSE))
  }

  if (any(
    purrr::map_lgl(c(ord_one, ord_two, ord_three), ~is.null(main_df[[.]]))
  )) {
    message("The main dataframe's variables seams not to be correct...\n")
    return(invisible(FALSE))
  }

  to_check <- main_df[-1] %>% as.data.frame()
  to_check <- to_check[
    order(to_check[[ord_one]], to_check[[ord_two]], as.character(to_check[[ord_three]])),
    ]

  reference[['mesi']] <- as.character(reference[['mesi']])
  to_check[['mesi']]  <- as.character(to_check[['mesi']])
  if (
    isTRUE(all.equal(reference, to_check)) &&
    setequal(
      levels(main_df[[ord_three]]),
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







#' tdp 2018, appello 2, tema a, check 9
#'
#' @param main_table [matrix] the requested matrix
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_9 <- function(main_table) {
  if (!is.matrix(main_table)) {
    message("L'oggetto fornito sembra non essere una tabella/matrice.\n")
    return(invisible(FALSE))
  }

  ref <- read.csv("death_ita.csv", stringsAsFactors = FALSE)
  ref[["mesi"]] <- factor(ref[["mesi"]],
    levels = c("0-1", "2-59", "0-59"),
    labels = c("neonato", "fanciullo", "prescolare")
  )

  reference <- tapply(
    X     = ref$percentuale,
    INDEX = list(ref$cause_of_death, ref$mesi),
    FUN   = max, na.rm = TRUE
  ) %>%
    as.data.frame() %>%
    dplyr::select(neonato, prescolare, fanciullo) %>%
    dplyr::arrange(neonato, prescolare, fanciullo) %>%
    as.matrix() %>%
    as.vector()

  to_check <- as.data.frame(main_table) %>%
    dplyr::select(neonato, prescolare, fanciullo) %>%
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

















#' tdp 2018, appello 2, tema a, check 10
#'
#' @param main_data A list with one or two dataframe
#'
#' @return logical (invisibly)
#' @export
tdp_2018_2_a_check_10 <- function(main_data) {
  df_requested <- c('top_fan_2000', 'top_fan_2016')
  df_ok <- purrr::map_lgl(df_requested, ~ . %in% names(main_data))
  df_provided <- df_requested[df_ok]


  if (!all(df_ok)) {
    message("Sembra che almeno uno dei due dataset non sia stato creato...\n")
  }

  mark  <- FALSE
  first <- TRUE
  score <- 0L

  top_fan_2000 <- main_data[["top_fan_2000"]]
  top_fan_2016 <- main_data[["top_fan_2016"]]

  try(silent = TRUE, {
    if (!is.data.frame(top_fan_2000)) {
      message('`top_fan_2000` sembra non essere un dataframe...\n')
      mark <- FALSE
    } else if (
      top_fan_2000[['causa_del_decesso']][1:2] ==
      c('prematurity', 'congenitalanomalies')          &&

      top_fan_2000[['percentuale']][2:3] == c(28.7, 13.5) &&

      all(top_fan_2000[['anno']] == 2000)                 &&

      all(top_fan_2000[['mesi']] %in% c('neonato', '0-1'))
    ) {
      message('`top_fan_2000` sembra essere corretto.\n')
      mark <- TRUE
    } else {
      message('`top_fan_2000` sembra non essere corretto...\n')
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
    if (!is.data.frame(top_fan_2016)) {
      message('`top_fan_2016` sembra non essere un dataframe...\n')
      mark <- FALSE
    } else if (
      top_fan_2016[['causa_del_decesso']][1:2] ==
      c('prematurity', 'congenitalanomalies')            &&

      top_fan_2016[['percentuale']][2:3] == c(23.4, 21.7) &&

      all(top_fan_2016[['anno']] == 2016)                 &&

      all(top_fan_2016[['mesi']]  %in% c('neonato', '0-1'))
    ) {
      message('`top_fan_2016` sembra essere corretto.\n')
      mark <- TRUE
    } else {
      message('`top_fan_2016` sembra non essere corretto...\n')
      mark <- FALSE
    }

    score <- score + score(mark)
    if (first) {
      score <- score + score(mark)
      first <- FALSE
    }
  })

  if (score < 0L) {
    score <- score - first
  }

  invisible(score)
}

