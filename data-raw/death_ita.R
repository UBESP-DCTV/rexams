death_ita_url <- 'http://apps.who.int/gho/athena/data/GHO/MORT_300?filter=CHILDCAUSE:*;COUNTRY:ITA&x-sideaxis=CHILDCAUSE&x-topaxis=YEAR;GHO;COUNTRY;AGEGROUP&profile=crosstable&format=csv'


death_ita <- readr::read_csv(death_ita_url, skip = 3L) %>%
  janitor::clean_names() %>%
  tidyr::gather('age', 'prop', -cause_of_death) %>%
  dplyr::mutate(
    age = stringr::str_replace(age, "s[_]*([0-9]*)$", "s-\\1"),
    age = stringr::str_replace(age, "-$", "-0")
  ) %>%
  tidyr::separate(age, c('age', 'year'), sep = "-", convert = TRUE) %>%
  dplyr::mutate(
    anno    = 2016 - year,
    classe  = factor(age,
      levels = c('x0_27_days', 'x1_59_months', 'x0_4_years'),
      labels = c('neonato', 'fanciullo', 'prescolare')
    ),
    mesi = c('0-1', '2-59', '0-59')[classe]
  ) %>%
  dplyr::select(-age, -year, -classe) %>%
  tidyr::unite(anno_mesi, anno, mesi) %>%
  tidyr::spread(anno_mesi, prop) %>%
  janitor::clean_names()

readr::write_csv(death_ita, 'inst/exams/tdp1718/death_ita.csv')
use_data(death_ita)
