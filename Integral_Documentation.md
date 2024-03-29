# Vacation rental service

### Di Gianluca Cognigni

# Requisiti iniziali

Si vuole realizzare una base di dati per un servizio che permette di affittare e prenotare
alloggi di vario tipo ad esempio interi appartamenti, stanze private (camera privata e spazi
comuni) e stanze condivise (spazio in comune e camera condivisa).1
Gli utenti si registrano al servizio fornendo indirizzo email, password, nome, cognome,
numero o numeri di telefono. Se l’utente fornisce la foto della carta d’identità, viene
riconosciuto come verificato. Inoltre, l’utente deve indicare un metodo di pagamento per
poter prenotare. Gli utenti possono essere ospiti o “host” ovvero possono a loro volta
ospitare altri utenti del servizio in uno o più alloggi di loro proprietà. Inoltre gli “host” possono
diventare “superhost” se soddisfano i seguenti requisiti:

- Devono aver completato almeno 10 soggiorni, per un totale di almeno 100 notti.
- Devono aver conservato un tasso di cancellazione dell'1% (una cancellazione ogni
    
    100 prenotazioni) massimo.
    
- Devono aver mantenuto una valutazione complessiva di 4,8 considerando tutti i soggiorni in tutte le case di sua proprietà.
Gli utenti superhost ricevono un badge sul loro profilo.

Gli alloggi sono descritti indicando un nome, l’indirizzo (visibile all’ospite solo quando la
prenotazione è confermata, altrimenti è visibile solo il comune), una descrizione, il prezzo per
notte per persona e i costi di pulizia, delle foto, i servizi (ad esempio, cucina, wi-fi, lavatrice,
ecc.), numero di letti e orario di check-in e check-out oltre all’host a cui appartiene, il rating
medio e il numero di recensioni (vedere Fig. 1).

Gli utenti possono aggiungere alcune case tra i preferiti. Gli utenti possono avere diverse
liste, ad esempio in base al viaggio che vogliono compiere.

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il
soggiorno e il numero degli ospiti. Se gli ospiti sono a loro volta utenti del servizio, se ne
possono indicare i nominativi. La prenotazione deve essere confermata o rifiutata dall’host.
La prenotazione ha un costo totale e se confermata viene eseguito il pagamento. Inoltre, la
prenotazione può essere cancellata sia dall’ospite che dall’host.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7f030760-b518-4686-b966-18df38edfccf/Untitled.png)

Al termine del soggiorno, gli ospiti e gli host si possono valutare a vicenda. La recensione
fatta dagli ospiti comprende due testi (uno per l’appartamento e uno per l’host) e una serie di
punteggi in una scala da 1 a 5 su dimensioni come pulizia, comunicazione, posizione,
qualità/prezzo. La valutazione complessiva del soggiorno è una media delle valutazioni
ricevute sulle singole dimensioni. Le recensioni degli host comprendono solo un commento
testuale. Le recensioni possono essere visibili o non visibili. Diventano visibili quando
entrambi hanno fatto la recensione oppure se uno dei due non ha fatto la recensione, l’altra
diventa visibile dopo 7 giorni dalla fine del soggiorno. Gli host e gli ospiti possono
commentare più volte le review in cui sono coinvolti, creando un thread di discussione.

Le recensioni sono visibili sui profili degli utenti suddivise in base a quelle ricevute come
ospite e come host.

La base di dati deve supportare le seguenti operazioni:

- Una volta a settimana viene effettuato un calcolo per aggiornare il tasso di
    
    cancellazione di ciascun host.
    
- Una volta al giorno si controllano le condizioni per la qualifica di superhost e viene
    
    aggiornato lo status degli host.
    
- Una volta al mese viene calcolata la classifica degli alloggi più graditi.

**Legend**

Pink for generalizations

green for entities

red for associations

yellow for attributes

purple for integrity constraints

Underlined for derivation constraints

### Glossario termini

| Entità | Descrizione | Sinonimi | Collegamenti |
| --- | --- | --- | --- |
| Utente | Chi usufruisce della piattaforma di home booking può svolgere sia il ruolo di host che ospite |  | Servizio |
| Profilo | Profilo che un Utente genera sul Servizio |  | Utente, Servizio, Superhost |
| Badge | Badge ricevuto assieme ad una condizione di “superhost” |  | Profilo, Superhost |
| Alloggio | Struttura che si intende affittare e che sarà adibita al  pernottamento di ospiti | Casa | Host, Prenotazione, Recensione |
| Ospite | Persona che intende usare il servizio per prenotare un alloggio |  | Prenotazione, Alloggio, Pagamento, Recensione |
| Host | Utente che offre un alloggio prenotabile nel servizio |  | Alloggio, Recensione |
| Superhost | Host che rispetta dei requisiti descritti |  | Host, Alloggio, Recensione |
| Prenotazione | Segno dell’intento di un utente di voler alloggiare in un alloggio |  | Ospite, Alloggio |
| Recensione | Insieme di valutazioni effettuate da un utente (sia ospite che host) sulla base di un pernottamento in un alloggio | Review | Prenotazione, Utente |
| Commento | Commento lasciato da un utente su una recensione o in risposta ad un commento di un’altro utente |  | Utente, possibilmente Thread, |
| Thread di Discussione | Insieme di commenti uno in risposta all’altro |  | Commento |
| Soggiorno | Periodo in cui un ospite soggiorna in un alloggio disponibile nella piattaforma |  | Ospite, Alloggio |
| Pagamento | Versamento di valore monetario per un servizio di pernottamento |  | Prenotazione |
| Metodo di Pagamento | Metodo in cui vien fatto un pagamento per una prenotazione |  | Pagamento, Prenotazione |
| Punteggio | Valutazione effettuata da un utente nella piattaforma dopo un soggiorno su una scala da 1 a 5 | Punteggio | Recensione, Struttura, Utente |
| Preferiti | Insieme di alloggi mostrati in piattaforma per cui un utente ha mostrato interesse | Lista | Alloggio, Utente |
| Testo | Testo della recensione lasciato o da un ospite o da un host in una recensione |  | Recensione, Host, Ospite |
| Servizio | Servizio offerto nell’alloggio |  | Alloggio |

# Requisiti rivisti

Si vuole realizzare una base di dati per un servizio che permette di affittare e prenotare
alloggi di vario tipo ad esempio interi appartamenti, stanze private (camera privata e spazi
comuni) e stanze condivise (spazio in comune e camera condivisa).1
Gli utenti si registrano al servizio fornendo indirizzo email, password, nome, cognome,
numero o numeri di telefono. Se l’utente fornisce la foto della carta d’identità, viene
riconosciuto come verificato. Inoltre, l’utente deve indicare un metodo di pagamento per
poter prenotare. Gli utenti possono essere ospiti o “host” ovvero gli “host” possono a loro volta
ospitare altri utenti del servizio in uno o più alloggi di loro proprietà. Inoltre gli “host” possono
diventare “superhost” se soddisfano i seguenti requisiti:

- Gli “host” devono aver completato almeno 10 soggiorni, per un totale di almeno 100 notti.
- Gli “host” devono aver conservato un tasso di cancellazione dell'1% (una cancellazione ogni
    
    100 prenotazioni) massimo.
    
- Gli “host” devono aver mantenuto una valutazione complessiva di 4,8 considerando tutti i soggiorni in tutte le case di proprietà dell’”host”.

Gli utenti superhost ricevono un badge sul loro profilo.

Gli alloggi sono descritti indicando un nome, l’indirizzo (visibile all’ospite solo quando la
prenotazione è confermata, altrimenti è visibile solo il comune), una descrizione, il prezzo per
notte per persona e i costi di pulizia, delle foto, i servizi utili (ad esempio, cucina, wi-fi, lavatrice,
ecc.), numero di letti e orario di check-in e check-out dall’alloggio oltre all’host a cui appartiene l’alloggio, il rating
medio e il numero di recensioni dell’alloggio (vedere Fig. 1).

Gli utenti possono aggiungere alcuni alloggi tra i preferiti. Gli utenti possono avere diverse
liste di preferiti, ad esempio in base al viaggio che vogliono compiere.

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il
soggiorno e il numero degli ospiti che pernotteranno nell’alloggio. Se gli ospiti sono a loro volta utenti del servizio, si possono indicare i nominativi degli utenti nella prenotazione. La prenotazione dell’alloggio deve essere confermata o rifiutata dall’host.
La prenotazione dell’alloggio ha un costo totale e se la prenotazione viene  confermata viene eseguito il pagamento da parte del prenotante. Inoltre, la
prenotazione dell’alloggio può essere cancellata sia dall’ospite che dall’host.

1 Il servizio descritto è liberamente ispirato a Airbnb (https://www.airbnb.it/) a cui è possibile fare
riferimento per completare e disambiguare i requisiti.

Fig. 1: Dettagli di un appartamento.

Al termine del soggiorno, gli ospiti e gli host si possono recensire a vicenda. La recensione
fatta dagli ospiti comprende due testi (uno per l’appartamento e uno per l’host) e una serie di
punteggi in una scala da 1 a 5 su dimensioni come pulizia dell’alloggio, comunicazione dell’host , posizione e rapporto qualità/prezzo dell’alloggio. Il punteggio  complessivo del soggiorno è una media dei punteggi ricevuti sulle singole dimensioni citate prima (pulizia dell’alloggio, comunicazione dell’host, posizione e rapporto qualità/prezzo dell’alloggio. Le recensioni fatte dai host comprendono solo un testo. 

Le recensioni di entrambi (host ed ospite) possono essere visibili o non visibili. Diventano visibili quando
sia host che ospite prenotante hanno fatto la recensione oppure se uno dei due tra host ed ospite prenotante non ha fatto la recensione, l’altra recensione diventa visibile dopo 7 giorni dalla fine del soggiorno. Gli host e gli ospiti possono commentare più volte le recensioni in cui sono coinvolti, creando un thread di discussione.

Le recensioni sono visibili sui profili degli utenti suddivise in base a quelle ricevute come
ospite e come host.

La base di dati deve supportare le seguenti operazioni:

- Una volta a settimana viene effettuato un calcolo per aggiornare il tasso di
    
    cancellazione di ciascun host.
    
- Una volta al giorno si controllano le condizioni per la qualifica di superhost e viene
    
    aggiornato lo status degli host.
    
- Una volta al mese viene calcolata la classifica degli alloggi più graditi.

## Gruppi omogenei di frasi

### Utenti

Gli utenti si registrano al servizio fornendo indirizzo email, password, nome, cognome,
numero o numeri di telefono. 

Se l’utente fornisce la foto della carta d’identità, viene riconosciuto come verificato.

L’utente deve indicare un metodo di pagamento per poter prenotare. 

Gli utenti possono essere ospiti o “host”.

Gli utenti possono aggiungere alcuni alloggi tra i preferiti. 

Gli utenti possono avere diverse liste di preferiti, ad esempio in base al viaggio che vogliono compiere.

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il soggiorno e il numero degli ospiti che pernotteranno.

Se gli ospiti sono a loro volta utenti del servizio, si possono indicare i nominativi degli utenti durante la prenotazione.

Le recensioni sono visibili sui profili degli utenti suddivise in base a quelle ricevute come
ospite e come host.

### Host

gli “host” possono a loro volta ospitare altri utenti del servizio in uno o più alloggi di loro proprietà.

La prenotazione dell’alloggio deve essere confermata o rifiutata dall’host.

Al termine del soggiorno, gli ospiti e gli host si possono recensire a vicenda.

Le recensioni degli host comprendono solo un commento testuale. 

Le recensioni degli host possono essere visibili o non visibili.

Le recensioni degli host diventano visibili quando sia host che ospite prenotante hanno fatto la recensione

se uno dei due non ha fatto la recensione, l’altra recensione diventa visibile dopo 7 giorni dalla fine del soggiorno. 

Gli host e gli ospiti possono commentare più volte le recensioni in cui sono coinvolti, creando un thread di discussione.

### Superhost

Gli “host” possono diventare “superhost” se soddisfano i seguenti requisiti:

- Gli “host” devono aver completato almeno 10 soggiorni, per un totale di almeno 100 notti.
- Gli “host” devono aver conservato un tasso di cancellazione dell'1% (una cancellazione ogni
    
    100 prenotazioni) massimo.
    
- Gli “host” devono aver mantenuto una valutazione complessiva di 4,8 considerando tutti i soggiorni in tutte le case di proprietà dell’”host”.

Gli utenti superhost ricevono un badge sul loro profilo.

### Alloggi

Gli alloggi sono descritti indicando un nome, l’indirizzo (visibile all’ospite solo quando la
prenotazione è confermata, altrimenti è visibile solo il comune), una descrizione, il prezzo per
notte per persona e i costi di pulizia, delle foto, i servizi utili (ad esempio, cucina, wi-fi, lavatrice,
ecc.), numero di letti e orario di check-in e check-out dall’alloggio oltre all’host a cui appartiene l’alloggio, il rating medio e il numero di recensioni dell’alloggio.

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il
soggiorno e il numero degli ospiti che pernotteranno nell’alloggio.

L’alloggio ha dei servizi.

La prenotazione dell’alloggio ha un costo totale e la prenotazione dell’alloggio può essere cancellata sia dall’ospite che dall’host.

La recensione da parte dell’ospite comprende punteggi su rapporto qualità/prezzo, pulizia e posizione dell’alloggio.

### Ospiti

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il
soggiorno e il numero degli ospiti che pernotteranno nell’alloggio. Se gli ospiti sono a loro volta utenti del servizio, si 
possono indicare i nominativi degli utenti nella prenotazione.

Gli ospiti possono recensire la permanenza.

La recensione fatta dagli ospiti comprende due commenti (uno per l’appartamento e uno per l’host) e una serie di punteggi in una scala da 1 a 5 su dimensioni come pulizia dell’alloggio, comunicazione dell’host , posizione e rapporto qualità/prezzo dell’alloggio.

Le recensioni di entrambi possono essere visibili o non visibili. Diventano visibili quando
sia host che ospite prenotante hanno fatto la recensione

Se l’host o l’ospite non ha fatto la recensione, l’altra recensione diventa visibile dopo 7 giorni dalla fine del soggiorno. 

Gli ospiti possono commentare più volte le recensioni in cui sono coinvolti, creando un thread di discussione.

### Prenotazione

l’utente deve indicare un metodo di pagamento per poter prenotare.

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il
soggiorno e il numero degli ospiti che pernotteranno nell’alloggio. 

Se gli ospiti sono a loro volta utenti del servizio, si possono indicare i nominativi degli utenti nella prenotazione. 

La prenotazione dell’alloggio deve essere confermata o rifiutata dall’host.
La prenotazione dell’alloggio ha un costo totale

Se la prenotazione viene  confermata viene eseguito il pagamento da parte del prenotante. 

Inoltre, la prenotazione dell’alloggio può essere cancellata sia dall’ospite che dall’host.

### Recensioni

Al termine del soggiorno, gli ospiti e gli host si possono recensire a vicenda. 

La recensione fatta dagli ospiti comprende due commenti (uno per l’appartamento e uno per l’host) e una serie di punteggi in una scala da 1 a 5 su dimensioni come pulizia dell’alloggio, comunicazione dell’host , posizione e rapporto qualità/prezzo dell’alloggio. 

Il punteggio  complessivo del soggiorno è una media dei punteggi ricevuti sulle singole dimensioni citate prima (pulizia dell’alloggio, comunicazione dell’host, posizione e rapporto qualità/prezzo dell’alloggio. Le recensioni degli host comprendono solo un commento testuale. 

Le recensioni di entrambi (host ed ospite) possono essere visibili o non visibili. Diventano visibili quando
sia host che ospite prenotante hanno fatto la recensione

Se o l’host o l’ospite non ha fatto la recensione, l’altra recensione diventa visibile dopo 7 giorni dalla fine del soggiorno.

Gli host e gli ospiti possono commentare più volte le recensioni in cui sono coinvolti, creando un thread di discussione.

Le recensioni sono visibili sui profili degli utenti suddivise in base a quelle ricevute come
ospite e come host.

### Testo

La recensione fatta dagli ospiti comprende due testi (uno per l’appartamento e uno per l’host).

Le recensioni degli host comprendono solo un testo.

### Soggiorno

Gli utenti possono prenotare degli alloggi di qualsiasi tipo indicando un intervallo di date per il
soggiorno e il numero degli ospiti che pernotteranno nell’alloggio.

e uno dei due tra host ed ospite prenotante non ha fatto la recensione, l’altra recensione diventa visibile dopo 7 giorni dalla fine del soggiorno

### Pagamento

La prenotazione dell’alloggio ha un costo totale e se la prenotazione viene  confermata viene eseguito il pagamento da parte del prenotante.

### Metodo di pagamento

Inoltre, l’utente deve indicare un metodo di pagamento per poter prenotare.

### Punteggio

La recensione fatta dagli ospiti comprende una serie di punteggi in una scala da 1 a 5 su dimensioni come pulizia dell’alloggio, comunicazione dell’host , posizione e rapporto qualità/prezzo dell’alloggio. 

Il punteggio  complessivo del soggiorno è una media dei punteggi ricevuti sulle singole dimensioni citate prima (pulizia dell’alloggio, comunicazione dell’host, posizione e rapporto qualità/prezzo dell’alloggio.

### Preferiti

Gli utenti possono aggiungere alcuni alloggi tra i preferiti. Gli utenti possono avere diverse
liste di preferiti, ad esempio in base al viaggio che vogliono compiere.

## Operazioni sui dati

- Una volta a settimana viene effettuato un calcolo per aggiornare il tasso di
    
    cancellazione di ciascun host.
    
- Una volta al giorno si controllano le condizioni per la qualifica di superhost e viene
    
    aggiornato lo status degli host.
    
- Una volta al mese viene calcolata la classifica degli alloggi più graditi.

# Schema E.R + regole di business

![Untitled](static_resources/E-R%20Diagram%20GIVE.png)

### Vincoli di integrità

**Vincolo1:**

Se un ospite fa una richiesta ad un alloggio già prenotato e confermato essa sarà rifiutata, il sistema mostra la disponibilità delle date selezionate dall’utente.

**Vincolo2:**

Il sistema deve permettere di rendere un utente registrato in utente verificato tramite la verifica della carta d’identità.

**Vincolo3:**

Il metodo di pagamento è necessario per essere approvata la prenotazione, quando una prenotazione viene confermata il sistema si occuperà di elaborare il pagamento e di conseguenza il passaggio da ospite al metodo di pagamento del host.

**Vincolo4:**

Il sistema deve permettere di rendere visibile all’ospite l’indirizzo dell’alloggio solo se ha fatto la prenotazione, altrimenti visualizza il comune.

**Vincolo5:**

Se l’host accetta la richiesta di prenotazione, allora la prenotazione viene confermata.

**Vincolo6:**

Il sistema deve permettere la cancellazione rispettando la tempistica temporale sia dal host che all’ospite.

**Vincolo7:**

Gli host possono fare una recensione agli ospiti solo se questi ultimi hanno realmente soggiornato nell’alloggio di appartenenza al host. Verificato tramite il checkout.

**Vincolo8:**

Gli ospiti possono fare una recensione al host e all’appartamento solo dopo aver soggiornato in tale appartamento. Verificato tramite il checkout.

**Vincolo9:**

Le recensioni diventano visibili solo quando entrambi gli utenti si commentano o diventano automaticamente visibili dopo 7 giorni.

**Vincolo10:**

Il sistema deve permettere di tenere traccia di chi ha cancellato la prenotazione nel entita Prenotazioni , cosi che si riesca a calcolare il tasso di cancellazione di un host.

**Vincolo11:**

Il prezzo totale della prenotazione viene calcolato dal prezzo Unitario x numero dei giorni prenotati

**Vincolo12:**

Il nominativo degli ospiti può essere indicato se gli ospiti sono utenti del servizio

********************Vincolo 13:********************

Quando una prenotazione viene confermata, le prenotazioni dello stesso alloggio che presentano un overlap di date con la prenotazione confermata vengono rifiutate automaticamente.

********************Vincolo 14********************

Un ospite può avere il proprio nominativo incluso nella prenotazione se è registrato alla piattaforma.

********************Vincolo 15********************

Il pagamento della prenotazione avviene solo dopo la conferma della prenotazione da parte dell’host.

********************Vincolo 16********************

L’attributo stato di una occorrenza di entità Prenotazione modella il concetto di prenotazione ancora non processata, confermata o rifiutata dall’host o cancellata dall’utente.

********************Vincolo 17********************

Il soggiorno di ospiti con successiva recensione mancante non va ad intaccare la valutazione complessiva dell’host.

********************Vincolo 18********************

L’utente che prenota un alloggio è l’unico utente che può cancellare la prenotazione, in altre parole ognuno può cancellare solo una propria prenotazione.

### Vincolo **di derivazione**

**Vincolo** **1:**

L’attributo RatingMedio dell’entità alloggi è ricavabile dalle medie delle valutazioni fatte dagli ospiti all’alloggio ed al host.

**Vincolo** **2:**

Il tasso di cancellazione di ciascun host è ricavabile dalla media di cancellazione e soggiorni confermati dal host.

**Vincolo** **3:**

NrRecensioni è un attributo dell’entità alloggi ed è ricavabile dalle entità alloggi e Recensioni.

******************Vincolo 4******************

Lo status di “superhost” viene derivato solo con i seguenti punti soddisfatti:

1. Devono aver completato almeno 10 soggiorni, per un totale di almeno 100 notti.
2. Devono aver conservato un tasso di cancellazione dell'1% (una cancellazione ogni 100 prenotazioni)
massimo.
3. Devono aver mantenuto una valutazione complessiva di 4,8 considerando tutti i soggiorni in tutte le
case di sua proprietà.

# Modello logico

I dati son basati su dati raccolti online con riferimento al periodo 2021-22

**Dati integrali raccolto**

150 million users

300 million bookings

12.7 million locations

8.5 million active locations (received a booking)

4 million hosts

500.000 superhost

**80%** of hosts leave a review for their guests. 72% of guests leave a review for hosts. 

************Scelta************ **per ridurre ad un campione minore dell’originale ed assunzioni fatte**

Ho scalato gli utenti all’1 percento

Ho scalato le prenotazioni all’1% mantenendo il rapport 1:2 con gli utenti

Assumo 3.1 location per host calcolando il numero di alloggi disponibili / numero di host

Superhost avevo un dato del 2019 che indicava 400.000, ho assunto una crescita di 100.000 per adattarlo al 2021 ed ho ridotto al 1% della pool totale.

Assumo il totale delle recensioni come recensioni host + recensioni guest.  **2400000 + 2160000**

Assumo che sul 50% di recensioni ci siano 2 commenti → 1 commento per recensione

Assumo che il 40% degli utenti aggiunga 2 case tra i preferiti.

Per il calcolo di quante pagine vengono visitate al giorno, ho preso la media da

72.6+82.3+78.4+91.9+89.2+99.4 il tutto diviso 6 = **85.6 e ridivido per 30 gg in media al mese = 2.85 milioni di visite al giorno, con 10 pagine in media per visita = 28.5 di pagine visualizzate, scalo all’1% 285.000 mila pagine**

è un prodotto community based quindi è importante che le recensioni vengano aggiornate frequentemente

### Calcolo dei volumi

| Concetto | Tipo | Volume |
| --- | --- | --- |
| Utente | E | 1.5 milioni |
| Profilo | E | 1.5 milioni |
| Host | E | 40.000 |
| Ospite | E | 1.460.000 |
| Superhost | E | 5.000 |
| Commento | E | 4.560.000 |
| Recensione | E | 4.560.000 |
| Prenotazione | E | 3.000.000 |
| Alloggio | E | 160.000 |
| Preferiti | E | 1.200.000 |
| Selezionato | A | 1.200.000 |
| Comprende | A | 4.560.000 |
| Identificabile | A | 1.500.000 |
| Aggiunge | A | 1.000.000 |
| Mandante | A | 1.000.000 |
| Ricevente | A | 1.000.000 |
| Effettua | A | 2.500.000 |
| Riceve | A | 3.800.000 |
| Riserva | A | 2.500.000 |
| Valuta | A | 4.000.000 |
| Possiede | A | 160.000 |

### Tavola delle operazioni

| Operazione | Tipo | Frequenza |
| --- | --- | --- |
| Calcolo per aggiornare il tasso di cancellazione di ciascun host | Batch | 1/settimana |
| Controllo sulle condizioni per la qualifica di superhost e aggiornamento del stato del host. | Batch | 1/giorno |
| Una volta al mese viene calcolata la classifica degli alloggi più graditi. | Batch | 1/mese |
| Aggiornamento rating media degli alloggi | Batch | 1/giorno |
| Inserimento di nuove istanze di Host | Iterative | 14.000/mese |
| Estrazione dei primi N alloggi in classifica in una data città (prime 10 pagine) | Iterative | 285.000/giorno |
| Aggiornamento delle recensioni di un alloggio | Batch | 1/giorno |
| Ricavo del riepilogo di una prenotazione | Iterativa | 8219/giorno |

# Analisi delle ridondanze

## 1. Costo totale di una prenotazione

L’attributo costo totale di una prenotazione si presenta come una ridondanza e può esser derivato dal costo di una notte nell’alloggio moltiplicato per la durata del viaggio

************************Operazione coinvolta:************************

Ricavo del riepilogo di una prenotazione

********************************************Accesso con ridondanza********************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Prenotazione | E | L | 1 |

**************************Spazio:************************** Assumiamo di usare 4 byte : 4*3.000.000 = 12.000.000 = 12 MB

**************Tempo:  8192*1************** = 8192 accessi al giorno

************************************************Accesso senza ridondanza************************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Prenotazione | E | L | 1 |
| Riserva | A | L | 1 |

**************************Spazio: 0 byte**************************

**************Tempo: 2 * 8192 accessi al giorno = 16384 accessi al giorno**************

Scelgo di mantenere questa ridondanza in quanto al costo di 12 MB evito il doppio degli accessi

## 2.Rating medio di un alloggio

L’attributo rating medio di un alloggio può esser ricavato, ricavando da tutte le recensioni dell’alloggio le varie dimensioni, effettuando in ogni singola recensione la media delle valutazioni sulle diverse valutazione e successivamente effettuando la media delle medie di ogni singola recensione.

******************************************Operazioni coinvolte:******************************************

Aggiornamento rating media di un alloggio

Estrazione dei primi N alloggi in classifica in una data città (prime 10 pagine) assumo 10 alloggi per pagina = 100 alloggi totali

### Op 1

********************************************Accesso con ridondanza********************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Alloggio | E | L | 1 |
| Alloggio | E | S | 1 |
| Riceve | A | L | 29 |
| Recensione | E | L | 29 |

**************************Spazio: 2 byte * 160000 alloggi = 320000 byte = 320 kB**************************

**************Tempo: 59 * 2 = 118 accessi al giorno in lettura ed 2 accesso in scrittura al giorno**************

Con accessi in scrittura di peso doppio sono 122 accessi al giorno

************************************************Accesso senza ridondanza************************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Alloggio | E | L | 1 |
| Riceve | A | L | 29 |
| Recensione | E | L | 29 |

**************************Spazio: 0 byte**************************

**************Tempo: 59 * 2 = 118 accessi al giorno in lettura**************

### Op 2

********************************************Accesso con ridondanza********************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Alloggio | E | L | 100 |

**************************Spazio: 2 byte * 160000 alloggi = 320000 byte = 320 kB**************************

**************Tempo: 100 *************** 285.000 =  28.500.000 accessi in lettura

************************************************Accesso senza ridondanza************************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Alloggio | E | L | 100  |
| Riceve | A | L | 100 * 29 |
| Recensione | E | L | 29 |

**************************Spazio: 0 byte**************************

**************Tempo:************** (100 + 2900 + 29) ***************************** 285.000 = 863.265.000 accessi in lettura

******************Decisione******************

Scelgo di mantenere la ridondanza in quanto la seconda operazione richiederebbe un numero spropositato di accessi al giorno senza ridondanza

## 3.Numero recensioni di un alloggio

L’attributo numero recensioni di un alloggio è derivabile dall’associazione con l’entità Recensione

****************************************Operazioni coinvolte****************************************

Aggiornamento delle recensioni di un alloggio

### Op 1

********************************************Accesso con ridondanza********************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Alloggio | E | L | 1 |
| Alloggio | E | S | 1 |
| Riceve | A | L | 29 |

**************************Spazio: 4 byte * 160000 = 640000 byte = 640 kB**************************

**************Tempo: 30 * 1 = 30 accessi in lettura al giorno e 1 accesso in scrittura al giorno**************

Con accessi in scrittura con peso doppio sono 32 accessi al giorno

************************************************Accesso senza ridondanza************************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Alloggio | E | S | 1 |
| Alloggio | E | L | 1 |
| Riceve | A | L | 29 |

**************************Spazio:  0 byte**************************

**************Tempo: 30 * 1 = 30 accessi in lettura al giorno e 1 accesso in scrittura al giorno**************

Con accessi in scrittura di peso doppio sono 32 accessi al giorno

D******************ecisione:******************

Scelgo di rimuovere la ridondanza in quanto il numero di accessi dell’operazione inclusa è uguale in presenza o meno della ridondanza, un piccolo vantaggio di questa scelta è il risparmio di 640 kB

## 4. Tasso di cancellazione

Il tasso di cancellazione è un’attributo dell’entità host ed è calcolabile considerando tutti gli alloggi posseduti dall’host per quante prenotazioni ha ricevuto ogni alloggio, diviso il numero totale di prenotazioni cancellate

****************************************Operazioni coinvolte****************************************

Calcolo per aggiornare il tasso di cancellazione di ciascun host

Controllo sulle condizioni per la qualifica di superhost e aggiornamento del stato del host.

### Op 1

********************************************Accesso con ridondanza********************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Host | E | L | 1 |
| Possiede | A | L | 4 |
| Alloggio | E | L | 4 |
| Riserva | A | L | 19 |
| Prenotazione | E | L | 19 |
| Host | E | S | 1 |

Devo accedere per forza fino alla prenotazione perchè devo leggere lo stato delle prenota

**************************Spazio: 4 byte * 40.000 host = 160.000 byte = 160 kB**************************

**Tempo: 47* 1 = 47 accessi in lettura + 1 accessi in scrittura**

Con accessi in scrittura con peso doppio sono 49 accessi

************************************************Accesso senza ridondanza************************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Host | E | L | 1 |
| Possiede | A | L | 4 |
| Alloggio | E | L | 4 |
| Riserva | A | L | 19 |
| Prenotazione | E | L | 19 |
| Host | E | S | 1 |

**************************Spazio:  2 byte * 40000 = 80.000 byte = 80kB**************************

**Tempo: 47* 1 = 47 accessi in lettura + 1 accesso in scrittura**

Con accessi in scrittura con peso doppio sono 48 accessi

### Op 2

********************************************Accesso con ridondanza********************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Calcolo soggiorni |  |  |  |
| Host | E | L | 1 |
| Possiede | A | L | 4 |
| Alloggio | E | L | 4 |
| Riserva | A | L | 19 |
| Prenotazione | E | L | 19 |
| Host | E | S | 1 |
| Calcolo valutazione |  |  |  |
| Utente | E | L | 1 |
| Identificabile | A | L | 1 |
| Profilo | E | L | 1 |
| Valuta | A | L | 60 |
| Recensione | E | L | 60 |

**************************Spazio: 0 byte**************************

**************Tempo: 160 * 1 = 160 accessi in lettura e 1 accesso in scrittura**************

Con accessi in scrittura con peso doppio sono 161 accessi

************************************************Accesso senza ridondanza************************************************

| Concetto | Costrutto | Tipo | Accessi |
| --- | --- | --- | --- |
| Calcolo soggiorni |  |  |  |
| Host | E | L | 1 |
| Possiede | A | L | 4 |
| Alloggio | E | L | 4 |
| Riserva | A | L | 19 |
| Prenotazione | E | L | 19 |
| Host | E | S | 1 |
| Calcolo valutazione |  |  |  |
| Utente | E | L | 1 |
| Identificabile | A | L | 1 |
| Profilo | E | L | 1 |
| Valuta | A | L | 60 |
| Recensione | E | L | 60 |
| Calcolo tasso di cancellazione |  |  |  |
| Host | E | L | 1 |
| Possiede | A | L | 4 |
| Alloggio | E | L | 4 |
| Riserva | A | L | 19 |
| Prenotazione | E | L | 19 |

**************************Spazio:  0 byte**************************

**Tempo: 188 * 1 = 188 accessi in lettura e 1 accesso in scrittura**

********************Decisione:********************

C’è un risparmio interessante di accessi in lettura sull’ordine di accessi al giorno con la ridondanza quindi la mantengo

### Eliminazione delle generalizzazioni

- Eliminazione della gerarchia di stanze, accorpo nella generalizzazione di Alloggio ed introduco un attributo “tipo di alloggio”, questo perchè nonostante i requisiti citino questa gerarchia di generalizzazioni, il sistema descritto non fa in nessun punto uso di queste generalizzazioni, ho comunque mantenuto la possibilità di specificare il tipo di alloggio per preservare la descrittività dell’entità Alloggio.
- Accorpo la specializzazione superhost in host ed introduco la regola aziendale per l’attributo badge in caso sia presente descrive l’host come superhost, le carattestiche di superhost sono descritte nelle regole di derivazione. Questo perchè superhost non contiene particolari relazioni con altre entità descritte nel sistema ma siccome alcune operazioni fanno uso del concetto ho preservato la sua esistenza esprimendola nell’attributo “badge” di un host semplice
- Sostituisco la gerarchia host, ospite, utente con due relazioni fra host-utente e ospite-utente, lo faccio perchè son presenti nello schema e use case operazioni che differenziano nettamente fra host, ospite ed operazioni che son molto generali a disposizione per tutti gli utenti.

### Accorpamento

- Ho deciso di accorpare profilo ed utente in quanto Profilo non modella alcun aspetto saliente del sistema descritto nei requisiti ed è un concetto generabile dinamicamente nella logica di visualizzazione della potenziale applicazione associata alla base di dati

### Eliminazione attributi composti e multivalore

1. L’attributo multivalore “foto” dell’entità Alloggio è stato trasformato in una relazione con una entità nel seguente modo:

    ![Untitled](static_resources/foto.png)

1. Dai requisiti visibili è possibile identificare che un’entità Alloggio possa disporre di molteplici servizi, queste in fase iniziale è stato modellato con un attributo multi valore che poi in fase di ristrutturazione ho sostituito nel seguente modo
    
    ![Untitled](static_resources/servizio.png)
    

1. L’attributo multivalore numero dell’entità Utente è stato trasformato nel seguente modo
    
    ![Untitled](static_resources/telefono.png)
    

1. Infine l’attributo composto punteggio dell’entità Recensione è stato ristrutturato nel seguente modo, anche per poter segnalare l’opzionalità del punteggio sia nel caso che l’ospite non completi la recensione del soggiorno che nel caso la recensione coinvolga un host che recensisce un’ospite
    
    ![Untitled](static_resources/foto.png)
    

### Scelta identificatori principali

L’identificatore di alloggio precedente (nome + indirizzo) è stato sostituito da un id in quanto la scelta precedente creava lunghe sequenza alfanumeriche per identificare un alloggio

L’identificatore di Recensione è stato sostituito da Id in quanto si creava con la data della recensione una lunga sequenza alfanumerica

L’identificatore della prenotazione è stato sostituito con un attributo id per evitare di venir identificato da lunghe sequenze numeriche (data inizio e data infine).

L’utente può essere univocamente rappresentato da una email supponendo che il servizio disponga di un account solo associato ad una mail

# Schema E.R ristrutturato

![Untitled](static_resources/E-R%20Ristrutturato%20GIVE.png)

# Schema relazionale

Utente(email, nome, cognome, password, verificato)

Host(emailUtente, badge)

Host(emailUtente) referenzia Utente(email)

Ospite(emailUtente)

Ospite(emailUtente) referenzia Utente(email)

NumeroTelefono(numero, utente)

NumeroTelefono(utente) referenzia Utente(email)

Preferiti(utente, alloggio)

Preferiti(utente) referenzia Utente(email)

Preferiti(alloggio) referenzia Alloggio(id)

Prenotazione(id, dataInizio, dataFine, alloggio, costoTotale, prenotante, stato)

Prenotazione(alloggio) referenzia Alloggio(id)

Prenotazione(prenotante) referenzia Utente(email)

StatoPrenotazione(idAlloggio, tipoStato)

Inclusi (ospite, prenotazione)

Inclusi(ospite) referenzia Ospite(emailUtente)

Inclusi(prenotazione) referenzia Prenotazione(dataInizio, dataFine, alloggio)

Alloggio(id, nome, indirizzo, possessore, rating medio, numero recensioni, tipo alloggio, check-in, check-out, descrizione, prezzoNotte, numeroLetti, costoPulizia)

Alloggio(possessore) referenzia Host(emailUtente)

Servizio(id, alloggio, tipoServizio)

Servizio(alloggio) referenzia Alloggio(id)

PhotoAlloggio(id, alloggio, photo)

PhotoAlloggio(alloggio) referenzia Alloggio(id)

Recensione(id, host, ospite, alloggio, testo, testoAlloggio, punteggio, visibile)

Recensione(host) referenzia Host(emailUtente)

Recensione(ospite) referenzia Ospite(emailUtente)

Recensione(alloggio) referenzia Alloggio(id)

Recensione(punteggio) referenzia Punteggio(idAlloggio)

Punteggio(idAlloggio, pulizia, comunicazione, posizione, qualità/prezzo, testoAlloggio)

Punteggio(idAlloggio) referenzia Recensione(id)

Commento(id, recensione, mandante, ricevente)

Commento(recensione) referenzia Recensione(id)

Commento(mandante) referenzia Utente(email)

Commento(mandante) referenzia Utente(email)

Interazione(top, down*)

Interazione(top) referenzia Commento(id)

Interazione(down) referenzia Commento(id)

# DDL

### User

create table "user"
(
nome     varchar(30),
email    varchar(30) not null
constraint email
primary key,
cognome  varchar(30),
password varchar(30)
);

alter table "user"
owner to frankacarkan;

### Host

create table host
(
email_utente varchar(30) not null
constraint email_utente_key
primary key
constraint email_utente
references "user"
on update set default on delete set default
);

alter table host
owner to frankacarkan;

### Ospite

create table "Ospite"
(
email_utente varchar(30) not null
constraint "Ospite_pk"
primary key
constraint "Ospite_user_null_fk"
references "user"
);

alter table "Ospite"
owner to frankacarkan;

### Numero di telefono

create table "NumeroTelefono"
(
numero integer     not null,
utente varchar(30) not null
constraint "emailUtente"
references "user",
constraint "NumeroTelefono_pk"
primary key (numero, utente)
);

alter table "NumeroTelefono"
owner to frankacarkan;

### Alloggio

create table "Alloggio"
(
id                integer          not null
constraint "Alloggio_pk"
primary key,
nome              varchar(30),
indirizzo         varchar(30),
possessore        varchar(30)
constraint possessore_fk
references host,
rating_medio      double precision not null,
numero_recensioni integer          not null,
tipo_alloggio     varchar(30)      not null,
check_in          time             not null,
check_out         time,
descrizione       text,
prezzo_notte      double precision,
numero_letti      integer,
costo_pulizia     double precision
);

alter table "Alloggio"
owner to frankacarkan;

### Preferiti

create table "Preferiti"
(
utente   varchar(30) not null
constraint utente___fk
references "user",
alloggio integer     not null
constraint alloggio___fk
references "Alloggio",
constraint preferiti_pk
primary key (utente, alloggio)
);

alter table "Preferiti"
owner to frankacarkan;

### Prenotazione

create table "Prenotazione"
(
data_inizio  date             not null,
data_fine    date             not null,
alloggio     integer          not null
constraint alloggio___fk
references "Alloggio",
costo_totale double precision not null,
prenotante   varchar(30)
constraint prenotante___fk
references "user",
stato        varchar(30),
id           integer          not null
constraint prenotazione_pk
primary key
);

alter table "Prenotazione"
owner to frankacarkan;

### Inclusi

create table "Inclusi"
(
ospite       varchar(30) not null
constraint ospite___fk
references "Ospite",
prenotazione integer     not null
constraint prenotazione___fk
references "Prenotazione",
constraint "Inclusi_pk"
primary key (prenotazione, ospite)
);

alter table "Inclusi"
owner to frankacarkan;

### PhotoAlloggio

create table "PhotoAlloggio"
(
id       integer not null,
alloggio integer not null
constraint alloggio___fk
references "Alloggio",
photo    bytea,
constraint "PhotoAlloggio_pk"
primary key (id, alloggio)
);

alter table "PhotoAlloggio"
owner to frankacarkan;

### Recensione

create table "Recensione"
(
id             integer not null
constraint "Recensione_pk"
primary key,
host           varchar(30)
constraint valutazione_host___fk
references host,
ospite         varchar(30)
constraint valutazione_ospite___fk
references "Ospite",
alloggio       integer
constraint valutazione_alloggio___fk
references "Alloggio",
testo          text,
pulizia        double precision,
comunicazione  double precision,
posizione      double precision,
qualita_prezzo double precision,
visibile       boolean,
testo_alloggio text
);

alter table "Recensione"
owner to frankacarkan;

### Commento

create table "Commento"
(
id         integer not null
constraint "Commento_pk"
primary key,
recensione integer
constraint recensione___fk
references "Recensione",
mandante   varchar(30)
constraint mandante___fk
references "user",
ricevente  varchar(30)
constraint ricevente___fk
references "user"
);

alter table "Commento"
owner to frankacarkan;

### Servizio

create table "Servizio"
(
id            integer not null
constraint alloggio___fk
references "Alloggio",
alloggio      integer not null,
tipo_alloggio varchar(30),
constraint "Servizio_pk"
primary key (id, alloggio)
);

alter table "Servizio"
owner to frankacarkan;

### Punteggio

create table "Punteggio"
(
id_alloggio    integer not null
constraint "Punteggio_pk"
primary key
constraint "Punteggio_Alloggio_null_fk"
references "Alloggio",
pulizia        double precision,
comunicazione  double precision,
posizione      double precision,
qualita_prezzo double precision,
testo_alloggio varchar
);

alter table "Punteggio"
owner to frankacarkan;

### Interazione

create table "Interazione"
(
top  integer not null
constraint "Interazione_pk"
primary key
constraint "Interazione_Top"
references "Commento",
down integer
constraint "Interazione___down"
references "Commento"
);

alter table "Interazione"
owner to frankacarkan;

# Test scenario principale di successo

```sql
insert into "user" (nome, email, cognome, password)
values ('Antonio', 'peraAnto@gmail.com', 'Di Pera', 'PeraPera');

insert into public.host (email_utente)
values ('peraAnto@gmail.com');

insert into "Alloggio" (id, nome, indirizzo, possessore, rating_medio, numero_recensioni, tipo_alloggio, check_in,
                        check_out, descrizione, prezzo_notte, numero_letti, costo_pulizia)
values (33, 'Villa franca', 'Via delle amazzoni', 'peraAnto@gmail.com', 4.5, 5, 'villa', '13:30', '13:30', 'nice cozy villa', 150.50, 6, 36.6);

insert into "user" (nome, email, cognome, password)
values ('Prenotino', 'prenotino@gmail.com', 'Di Sera', 'SeraSera');

insert into "Ospite" (email_utente)
values ('prenotino@gmail.com');

insert into "Prenotazione" (data_inizio, data_fine, alloggio, costo_totale, prenotante, stato,
                             id)
values ('2022-11-14','2022-11-30', 33, 2408,'prenotino@gmail.com','nuova', 1 );

insert into "Inclusi" (ospite, prenotazione)
values ('prenotino@gmail.com', 1);

update "Prenotazione"
set stato = 'accettata'
where id= 1;

insert into "Recensione" (id, host, ospite, alloggio, testo, testo_alloggio, pulizia, comunicazione,
                          posizione, qualita_prezzo, visibile)
values (1, 'peraAnto@gmail.com', null, 33, 'è stato molto responsabile', 'bella location in mezzo alla natura', 4.5, 4.5, 4.5, 4.0, false);

insert into "Recensione" (id, host, ospite, alloggio, testo, testo_alloggio, pulizia, comunicazione,
                          posizione, qualita_prezzo, visibile)
values (2,null , 'prenotino@gmail.com', null, 'è stato molto cordiale e ha lasciato tutto intatto', null, null, null, null,null, false);

update "Recensione"
set visibile = true
where id = 1 AND id = 2;

update "Alloggio"
set rating_medio =  4.35
where id= 33;
```