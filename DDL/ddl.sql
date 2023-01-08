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

