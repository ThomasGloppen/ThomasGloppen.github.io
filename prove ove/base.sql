CREATE TABLE kunde 
(
    kundeid serial primary key,
    fornavn text not null,
    etternavn text not null,
    adresse text not null,
    mobil text,
    epost text
);

CREATE TABLE produsent
(
    produsentid serial primary key,
    navn text not null,
);

CREATE TABLE vare
(
    vareid serial primary key,
    produsentid int references produsent (produsentid),
    kundeid int references kunde (kundeid),
    pris number,
    betalt text default 'nei' check (
        betalt = 'nei'
        or betalt = 'ja'
    )
);