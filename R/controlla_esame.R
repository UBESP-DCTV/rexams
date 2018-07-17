controlla_esame <- function(soluzione) {
  UseMethod("controlla_esame")
}

controlla_esame.default <- function(soluzione) {
  stop("Qualcosa non va", call. = FALSE)
}


controlla_esame.tdp_2018_2_a <- function(soluzione) {

  purrr::map_int(seq_along(mia_soluzione),
    ~eval(parse(
      text = paste0("tdp_2018_2_a_check_", .x, "(soluzione[[", .x, "]])")
    ))
  ) %>%
    sum()
}
