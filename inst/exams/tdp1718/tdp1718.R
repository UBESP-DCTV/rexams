#'---
#'title: "Esame di R per il percorso di Tecniche della Prevenzione"
#'date: "19 giugno 2018"
#'author: "NOME_DEL_CANDIDATO"
#'output: html_notebook
#'---
#'<!-- ===================================================================== -->
#'<!-- ======================== PARTE DA IGNORARE ========================== -->
#'
#' ```{r setup, include = FALSE}
#' knitr::opts_chunk$set(
#'   comment  = '#>',
#'   error    = TRUE,
#'   collapse = TRUE
#' )
#' if (!require("rexams") || packageVersion('rexams') < '0.0.1') {
#'   devtools::install_github(DCTV-UBESP/rexams, ref = 'tdp1718')
#'   library(rexams)
#' }
#' ```
#'<!-- =================== FINE DELLA PARTE DA IGNORARE===================== -->
#'<!-- ===================================================================== -->





#'<!-- ===================================================================== -->
#' # ISTRUZIONI
#'
#'<!-- ===================================================================== -->

#' Il presente script R è strutturato in modo tale da guidare lo studente nella
#' risoluzione dell'esame. Inoltre, al termine, si potrà produrre un documento
#' riportante líntera soluzione con ogni output riportato.
#'




#' ## Informazioni preliminari
#'
#' * Chi lo desiderasse, può appoggiare il proprio cellulare sulla
#'   cattedra a faccia in sotto. Questo per evitare spiacevoli inconvenienti:
#'   chiunque infatti fosse trovato con un cellulare in mano durante il periodo
#'   di svolgimento del compito, così come il proprietario di qualunque
#'   cellulare che dovesse suonare (senza trovarsi appoggiato sulla cattedra),
#'   si vedrà annullato il compito e sarà allontanato dall'aula.
#'
#'
#' * È inoltre vietato parlare o scambiare informazioni di qualunque tipo con
#'   i colleghi che stiano svolgendo l'esame o terzi diversi dallínsegnate o
#'   il supervisore presente in aula. Chi venisse trovato a parlare, porgere o
#'   ricevere informazioni di qualunque natura a/da un collega si vedrà
#'   annullato il compito e sarà allontanato dall'aula.
#'
#'
#' * Per svolgere l'esame, il candidato dovrà completare questo stesso script
#'   negli spazi indicati, con codice R in grado di ottenere quanto di volta
#'   in volta richiesto nelle istruzioni del punto considerato.
#'
#'
#' * Quando non diversamente segnalato, ogni domanda avrà il valore di un punto.
#'   Ogni risposta corretta aggiungerà quindi un punto al totale, ogni risposta
#'   non data non modificherà il punteggio totale, ogni risposta sbagliata
#'   sottrarrà uno al punteggio totale.
#'
#'
#' * Saranno presenti domande con punteggio superiore (sia positivo se
#'   correttamente assolta, sia parimenti negativo se errata) e/o domande
#'   "propedeutiche", ovvero alle quali sarà necessario dare una risposta per
#'   poter proseguire.
#'
#'
#' * PER OTTENERE L'IDONEITÀ SARÀ NECESSARIO (E SUFFICIENTE) TOTALIZZARE ALMENO
#'   6 (SEI) PUNTI.
#'
#'
#' * In ogni momento durante lo svolgimento del compito salvando il presente
#'   script (senza rinominarlo) e lanciando dalla console il comando
#'
#'   > check_my_exam()
#'
#'   sarà possibile avere una stima in tempo reale del punteggio ottenuto fino
#'   a quel momento. Tale stima resta comunque da considerarsi tale, ovvero
#'   provvisoria: la valutazione finale del compito consegnato sarà comunque
#'   univocamente demandata al docente a posteriori.
#'
#'
#' * Una volta terminato l'esame, salvare (senza rinominare) il presente script
#'   e lanciare dalla console il comando
#'
#'   > submit_my_exam()
#'
#'   Questo, produrrà il documento con il proprio esame, riportante tutto il
#'   codice prodotto in un file HTML includendo sia ogni output generato dal
#'   codice, sia questo stesso file salvato al suo interno.
#'
#'
#' * Durante lo svolgimento del compito è consentito usare gli appunti
#'   personali, mentre non è consentito utilizzare dispositivi di comunicazione
#'   con terzi (cellulare, internet, ...)
#'




#' ## Prima di cominciare
#'
#' * Inserire il proprio nome e cognome al posto di NOME_DEL_CANDIDATO alla
#'   quarta riga di questo script, affianco alla voce author (lasciando quanto
#'   si scrive incluso tra le virgolette). Se questo non dovesse avvenire,
#'   il compitò sarà considerato nullo e non attribuibile a nessuno in nessun
#'   caso.
#'










#'<!-- ===================================================================== -->
#' # ESAME
#'
#'<!-- ===================================================================== -->
#'<!-- ===================================================================== -->
#' ## Domanda 1 (punteggio = 1, propedeutica: si)
#'
#' Per prima cosa è necessario impostare la cartella di lavoro (Working
#' Directory).
#'
#' Nel caso si usi del codice per eseguire questa operazione lo si scriva qui
#' sotto nello spazio senza i caratteri di commento iniziali `#'`.
#'
#' > NOTA: non è necessario impostare la cartella di lavoro tramite codice,
#'         è possibile infatti farlo anche "punta e clicca" da RStudio.
#'         Eseguire l'esercizio come si preferisce.
#'





#'<!-- --------------------------------------------------------------------- -->
#' Una volta impostata la cartella di lavoro, eseguire la seguente
#' istruzione (selezionarla e premere `CTRL + INVIO`). perchè lésercizio sia
#' giusto, quanto visualizzato nella console dovrebbe corrispondere
#' all'indirizzo richiesto. Dopodiché, passare alla domanda seguente.
#'
tdp1718_check_1()
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#'<!-- ===================================================================== -->
#' ## Domanda 2 (punteggio = 1, propedeutica: si)
#'
#' A questo punto si possono caricare i dati.
#'
#' Completare il codice seguente per importare il dataset che si trova
#' all'interno del file `death_ita.csv` (che si trova già allínterno della
#' cartella di lavoro) in un dataframe dal nome `death_ita`.
#'
#' ESEMPIO:
#'
#' death_ita <- ...........
#'
#'<!-- ===================================================================== -->


death_ita <- read.csv('inst/exams/tdp1718/death_ita.csv')


#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
tdp1718_check_2()
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 3 (punteggio = 1, propedeutica: no)
#'
#'  Iniziare a investigare la base di dati ricavando il numero di righe e
#'  colonne, e il nome delle colonne.
#'
#' Scrivere, nello spazio non commentato, il codice per trovare le informazioni
#' richieste, assegnandole rispettivamente alle variabili: `numero_righe`,
#' `numero_colonne` e `nomi_colonne`.
#'
#'
#' ESEMPIO:
#'
#' numero_righe   <- ...............
#'
#' numero_colonne <- ...............
#'
#' nomi_colonne   <- ...............


numero_righe   <- nrow(death_ita)

numero_colonne <- ncol(death_ita)

nomi_colonne   <- colnames(death_ita)



#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
#' Quanto visualizzato nella console sarà la risposta dello studente alla
#' domanda. Dopodiché, passare alla domanda seguente.
tdp1718_check_3()
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 4 (punteggio = 1, propedeutica: no)
#'
#' Per uniformità di linguaggio, rinominare le colonne con nome inglese in
#' italiano.
#'
#' In particolare, scrivere nello spazio non commentato qui sotto, il codice
#' utile a modificare il nome della colonna `cause_of_death` in
#' `causa_del_decesso`.
#'
#'<!-- ===================================================================== -->





#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
#' Quanto visualizzato nella console sarà la risposta dello studente alla
#' domanda. Dopodiché, passare alla domanda seguente.
tdp1718_check_4()
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 5 (punteggio = 1, propedeutica: no)
#'
#'<!-- ===================================================================== -->



#'<!-- ===================================================================== -->
#' ## Domanda 6 (punteggio = 1, propedeutica: no)
#'
#'<!-- ===================================================================== -->



#'<!-- ===================================================================== -->
#' ## Domanda 7 (punteggio = 1, propedeutica: no)
#'
#'<!-- ===================================================================== -->



#'<!-- ===================================================================== -->
#' ## Domanda 8 (punteggio = 1, propedeutica: no)
#'
#'<!-- ===================================================================== -->



#'<!-- ===================================================================== -->
#' ## Domanda 9 (punteggio = 2, propedeutica: no)
#'
#'<!-- ===================================================================== -->



#'<!-- ===================================================================== -->
#' ## Domanda 10 (punteggio = 2, propedeutica: no)
#'
#'<!-- ===================================================================== -->






