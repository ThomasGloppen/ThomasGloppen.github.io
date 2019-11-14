drop table bok,laaner,forfatter,eksemplar,utlaan cascade;


CREATE TABLE laaner
(
    laanerid serial primary key,
    fornavn text not null,
    etternavn text not null,
    epost text,
    adresse text,
    tlf text,
    kjonn text check (
        kjonn = 'm'
        or kjonn = 'f'
    )
);

CREATE TABLE forfatter
(
    forfatterid serial primary key,
    fornavn text not null,
    etternavn text not null,
    fdato date,
    kjonn text check (
        kjonn = 'm'
        or kjonn = 'f'
    )
);

CREATE TABLE bok 
(
    bokid serial primary key,
    tittel text not null,
    forfatterid int references forfatter (forfatterid),
    isbn text,
    antallsider int check (antallsider > 0),
    pdato date,
    sraak text,
    sjanger text
);

CREATE TABLE eksemplar
(
    eksemplarid serial primary key,
    tilstand text,
    bokid int references bok (bokid)
);

CREATE TABLE utlaan
(
    utlaanid serial primary key,
    udato date,
    innlevert text default 'nei' check (
        innlevert = 'ja'
        or innlevert = 'nei'
    ),
    laanerid int references laaner (laanerid),
    eksemplarid int references eksemplar (eksemplarid)
);






