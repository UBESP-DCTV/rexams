# rexams 0.1.2

* Updated `score()` to return an integer.
* Added `aggiungi_risposta()` to add an answer to the solution of an exam
* Added `soluzione()` as a costructor for object with two class: `rexams` and
        a class named as the exams provided (this to be able to create new
        checks and exams without damage the other)
* Added `controlla_risposta` e `controla esame` as generics and methods to check
        any exams
* Added `tdp_2018_2_a_checks` with the checks for the second exam provided
* Added `1718_tdp_II-a.R` with the second exam provided
 
# rexams 0.0.5

* Added `score()` function to score a single assignment
* Added `submit_my_exam()` to render and open the rendered exam on the Browser
* Added `score_my_exam()` function to score the exam

# rexams 0.0.4

* Check fixes.

# rexams 0.0.3

* Added 11 questions with 10 tests.

# rexams 0.0.2

* First three question for tdp1718 with first check funcitons.
* Reshaped and reformatted the `death_ita` data (all csv and rda versions) and
  updated the corresponding documentation.

# rexams 0.0.1

* Added `inst/exams/tdp1718/tdp1718.R` file as the template for the "Tecniche
  della prevenzione 2017-2018" exam.
* Added `death_ita.rda` and `inst/exams/tdp1718/death_ita.csv` data to use for
  exams.

# rexams 0.0.0.9000

* Setup lifecycle badge to *Experimental*.
* Setup tidy conventions for the package (coc, ci, issues/bug).
* Added support for the `pipe` operator.
* Added a `README.rmd` file has the frontpage for the package.
* Added a `NEWS.md` file to track changes to the package.
