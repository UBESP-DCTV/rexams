#'---
#'title: "Esame di R per il percorso di Tecniche della Prevenzione"
#'date: "19 luglio 2018 (secondo appello)"
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
#' ```
#'<!-- =================== FINE DELLA PARTE DA IGNORARE===================== -->
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' # ISTRUZIONI
#'
#'<!-- ===================================================================== -->

#' Il presente script R è strutturato in modo tale da guidare lo studente nella
#' risoluzione dell'esame. Inoltre, al termine, si potrà produrre un documento
#' riportante l'intera soluzione con ogni output riportato.
#'
#'
#'
#'
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
#'   i colleghi che stiano svolgendo l'esame o terzi diversi dall'insegnate o
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
#'   correttamente assolta, sia parimenti negativo se errata).
#'
#'
#' * PER OTTENERE L'IDONEITÀ SARÀ NECESSARIO (E SUFFICIENTE) TOTALIZZARE ALMENO
#'   9 (NOVE) PUNTI. Il punteggio massimo è pari a 15 + 1 punti. Il punto extra
#'   si riferisce all'ultima domanda, facoltativa: tale punto, a differenza
#'   degli altri, non può essere "perso" (ovvero sottratto in caso di risposta
#'   sbagliata) ma solo guadagnato.
#'
#'
#' * In ogni momento durante lo svolgimento del compito eseguendo i comandi che
#'   via via si trovano sotto ogni esercizio si può avere un'opinione in diretta
#'   sullo stato della domanda. Da notare che la risposta è puramente indicativa
#'   e a uso e consumo dello studente. Test sono stati fatti sulla correttezza
#'   dei controlli automatici ma non c'è garanzia siano infallibili. Sia che
#'   segnalino un errore sia che confermino una risposta esatta, la valutazione
#'   finale del compito e di ogni singola risposta sarà comunque univocamente
#'   demandata al docente a posteriori.
#'
#'
#' * Una volta terminato l'esame, salvare (senza rinominare) il presente script
#'   e lanciare dalla console il comando
#'
#'   > submit_my_exam()
#'
#'   Questo, produrrà il documento con il proprio esame, il risultato
#'   dell'esecuzione di ogni riga di codice scritto e il resoconto finale sul
#'   punteggio stimato. Il file generato sarà un HTML e al suo interno conterrà
#'   questo stesso script così come è stato salvato.
#'
#'
#' * Durante lo svolgimento del compito è consentito usare gli appunti
#'   personali, mentre non è consentito utilizzare dispositivi di comunicazione
#'   con terzi (cellulare, internet, ...)
#'
#'
#'
#'
#'
#'
#'
#'
#'
#'
#' ## Prima di cominciare
#'
#' * Inserire il proprio nome e cognome al posto di NOME_DEL_CANDIDATO alla
#'   quarta riga di questo script, affianco alla voce author (lasciando quanto
#'   si scrive incluso tra le virgolette).
#'
#'   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#'
#'   SE QUESTO NON DOVESSE AVVENIRE, IL COMPITO SARÀ CONSIDERATO NULLO E NON
#'   ATTRIBUIBILE AD ALCUNO STUDENTE IN NESSUN CASO.
#'
#'   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#'
#'
#'  * Si consiglia di scrivere tutte le chiamate a `library()` per caricare i
#'    pacchetti che si utilizzeranno (se se ne utilizzerano...) nello spazio
#'    non commentato immediatamente qui sotto, prima della parte di inizio
#'    dell'esame. In questo modo sarà più agevole e facilitata la lettura
#'    dello script. Seguire questa convenzione non è necessario ma vivamente
#'    consigliato.
#'

#+ package_loading, include = FALSE
library(rexams)


#+ setup_exam, include = FALSE
options(
  rexam_nome_candidato      = "Nome",
  rexam_cognome_candidato   = "Cognome",
  rexam_matricola_candidato = 12345,

  rexam_corso   = "tdp",
  rexam_anno    = 2018,
  rexam_appello = 2,
  rexam_id_tema = "a"
)

mia_soluzione <- soluzione()










#'<!-- ===================================================================== -->
#' # ESAME
#'
#'<!-- ===================================================================== -->
#'<!-- ===================================================================== -->
#' ## Domanda 1 (punteggio = 1)
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
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 1,
  risposta = getwd()
)

controlla_risposta(mia_soluzione, 1)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#'<!-- ===================================================================== -->
#' ## Domanda 2 (punteggio = 1)
#'
#' A questo punto si possono caricare i dati.
#'
#' Completare il codice seguente per importare il dataset che si trova
#' all'interno del file `death_ita.csv` (che si trova già all'interno della
#' cartella di lavoro) in un dataframe dal nome `death_ita`.
#'
#' ESEMPIO:
#'
#' death_ita <- ...........
#'
#'<!-- ===================================================================== -->




#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire le seguenti istruzioni
#' (selezionarla e premere `CTRL + INVIO`).
#'
#' Dopodiché, passare alla domanda seguente.
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 2,
  risposta = if (exists("death_ita", inherits = FALSE, envir = globalenv())) death_ita else NULL
)

controlla_risposta(mia_soluzione, 2)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 3 (punteggio = 1)
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
#'



#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
   domanda  = 3,
   risposta = if (any(
     purrr::map_lgl(
      c("numero_righe", "numero_colonne", "nomi_colonne"),
      exists, inherits = FALSE, envir = globalenv()
     )
   )) {
     list(
       numero_righe   = if (exists("numero_righe", inherits = FALSE, envir = globalenv())) numero_righe else NULL,
       numero_colonne = if (exists("numero_colonne", inherits = FALSE, envir = globalenv())) numero_colonne else NULL,
       nomi_colonne   = if (exists("nomi_colonne", inherits = FALSE, envir = globalenv())) nomi_colonne else NULL
    )
   } else {
    NULL
  }
)

controlla_risposta(mia_soluzione, 3)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 4 (punteggio = 1)
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
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 4,
  risposta = if (exists("death_ita", inherits = FALSE, envir = globalenv())) death_ita else NULL
)

controlla_risposta(mia_soluzione, 4)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 5 (punteggio = 1)
#'
#' Trasformare tutto il testo all'interno della variabile `causa_del_decesso` in
#' caratteri tutti minuscoli Per esempio, `Diarrhoeal disease` deve diventare
#' `diarrhoeal disease`.
#'
#' Scrivere il codice che svolge il compito nello spazio non comentato qui
#' sotto.
#'
#'<!-- ===================================================================== -->




#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 5,
  risposta = if (exists("death_ita", inherits = FALSE, envir = globalenv())) death_ita else NULL
)

controlla_risposta(mia_soluzione, 5)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 6 (punteggio = 1)
#'
#' Rimuovere (modificando) nelle descrizioni dei decessi (dentro la variabile
#' `causa_del_decesso` del dataframe `death_ita`) ogni occorrenza dello spazio.
#' Per esempio, `diarrhoeal disease` deve diventare `diarrhoealdisease`.
#'
#'<!-- ===================================================================== -->



#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 6,
  risposta = if (exists("death_ita", inherits = FALSE, envir = globalenv())) death_ita else NULL
)

controlla_risposta(mia_soluzione, 6)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 7 (punteggio = 2)
#'
#' Creare un nuovo dataframe con solamente il/i caso/i (riga/he) in
#' cui la causa del decesso per l'anno e la classe di età del bambino
#' (variabile `mesi`) hanno visto una percentuale (variabile `percentuale`)
#' di decessi strettamente positiva. Nominare il nuovo dataframe risultante
#' come `pos_perc_death`.
#'
#' Esempio:
#'
#' pos_per_death <- ...............
#'
#'<!-- ===================================================================== -->




#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 7,
  risposta = if (exists("pos_perc_death", inherits = FALSE, envir = globalenv())) pos_perc_death else NULL
  )

controlla_risposta(mia_soluzione, 7)
#'<!-- ===================================================================== -->
















#'<!-- ===================================================================== -->
#' ## Domanda 8 (punteggio = 2)
#'
#' Nel data.frame `death_ita`, rinominare i livelli della variabile `mesi`
#' secondo la seguante convenzione:
#'
#' "0-1"  = "neonato"
#' "2-59" = "fanciullo"
#' "0-59" = "prescolare"
#'
#'<!-- ===================================================================== -->



#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 8,
  risposta = if (exists("death_ita", inherits = FALSE, envir = globalenv())) death_ita else NULL
)

controlla_risposta(mia_soluzione, 8)
#'<!-- ===================================================================== -->







#'<!-- ===================================================================== -->
#' ## Domanda 9 (punteggio = 2)
#'
#' Dal data.frame principale `death_ita`, trovare per ogni causa e ogni classe
#' di età (variabile `mesi`) il valore massimo della percentuale di decessi
#' dovuti a tali cause in tali classi negli presi in considerazione.
#' In altre parole, creare una tabella in cui nelle righe ci siano le cause di
#' decesso, nelle colonne le classi di età e nelle cui celle sia presente il
#' valore massimo di probabilità negli anni di cui si dispone di tale valore.
#' Salvare la tabella con il nome `max_p_death_causes`
#'
#' SUGGERIMENTO: usare la funzione `tapply()`
#' ATTENZIONE  : gestire bene i dati mancanti, per esempio aggiungendo
#'               `na.rm = TRUE` all'interno della chiamata a `tapply()`.
#'
#' ESEMPIO:
#'
#' max_p_death_causes <- ..................
#'
#'<!-- ===================================================================== -->




#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 9,
  risposta = if (exists("max_p_death_causes", inherits = FALSE, envir = globalenv())) max_p_death_causes else NULL
)

controlla_risposta(mia_soluzione, 9)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 10 (punteggio = 2 + 1)
#'
#' Produrre due dataframe, nominati rispettivamente `top_fan_2000` e
#' `top_fan_2016`, riportanti il primo i soli dati riferiti all'anno 2000 e ai
#' neonati, ordinati dalla causa più frequente alla meno frequente, il
#' secondo analogo ma per i dati del 2016.
#'
#'<!-- ===================================================================== -->



#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato il codice richiesto, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`).
#'
mia_soluzione <- aggiungi_risposta(a = mia_soluzione,
  domanda  = 10,
  risposta = if (any(
    purrr::map_lgl(
      c("top_fan_2000", "top_fan_2016"),
      exists, inherits = FALSE, envir = globalenv()
    )
  )){
    list(
      top_fan_2000 = if (exists("top_fan_2000", inherits = FALSE, envir = globalenv())) top_fan_2000 else NULL,
      top_fan_2016 = if (exists("top_fan_2016", inherits = FALSE, envir = globalenv())) top_fan_2016 else NULL
    )
  } else{
    NULL
  }
)

controlla_risposta(mia_soluzione, 10)
#'<!-- ===================================================================== -->










#'<!-- ===================================================================== -->
#' ## Domanda 11 (punteggio = 1)
#'
#' A partire dai due dataset creati alla domanda 10 (ovvero `top_fan_2000` e
#' `top_fan_2016`) creare due grafici distinti (ma del tutto analoghi) in cui si
#' apprezzi l'andamento negli anni della probabilità di decesso per le sole
#' prime tre cause di decesso al 2000 (un grafico) e per le prime tre cause al
#' 2016 (secondo grafico).
#'
#' Suddividere ciascun grafico in pannelli coerenti con la classe di età dei
#' bambini.
#'
#' Commentare quindi (riempiendo l'opportuno spazio qui sotto) il risultato.
#'
#'
#' NOTA: il punteggio per questa domanda è solo positivo, se sbagliata non
#' concorre a intaccare il punteggio ottenuto fino a questo momento. Inoltre,
#' essendo la grafica non "statica" non ci sarà alcuna "valutazione" automatica.
#'
#'
#' SUGGERIMENTI:
#'
#'   - usare il pacchetto `lattice` (da caricare all'inizio di questo script
#'     nella zona adibita ai pacchetti) e la sua funzione `xyplot()` per
#'     rappresentare il grafico sul sottoinsieme dei dati relativo solo alle
#'     cause di interesse, che mappi le percentuali in funzione degli anni,
#'     condizionatamente alle classi di età e raggruppate per causa. (si
#'     suggerisce inoltre di inserire l'opzione `type = 'l'` per rappresentare
#'     il grafico con delle linee e non con dei punti, e aggiungere l'opzione
#'     `auto.key = TRUE` per far comparire la legenda)
#'   - fare la stessa cosa per l'anno 2016.
#'
#'<!-- ===================================================================== -->




message("
        Commento alle figure prodotte (cancellare questa parentesi e i puntini):
        .............................................................................
        .............................................................................
        .............................................................................
        .............................................................................
        ")


#'<!-- --------------------------------------------------------------------- -->
#' Una volta completato l'esame, eseguire la seguente istruzione
#' (selezionarla e premere `CTRL + INVIO`) per avere una stima del punteggio
#' totale ottenuto.
#'
mia_soluzione
controlla_esame(mia_soluzione)
#'<!-- ===================================================================== -->


