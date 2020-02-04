CREATE TABLE passasjer 
(
    passasjerid serial primary key,
    navn text not null,
    adresse text not null
);

CREATE TABLE fly
(
    flyid serial primary key,
    regnr text not null,
    selskap text not null,
    flytype text not null
);

CREATE TABLE flytur
(
    flyturid serial primary key,
    pris number not null,
    avgang text not null,
    destinasjon text not null,
    passasjerid int references passasjer (passasjerid),
    flyid int references fly (flyid)
);

delete * from passasjer;

delete * from fly where flyid > 162;

insert into passasjer (navn, adresse) values ('ole', 'oslo'),('bole', 'boslo'),('cole', 'coslo'),('pole', 'poslo');

select * from passasjer and flytype from fly;



select lnavn from laaner inner join utlaan on (laaner.laanerid = utlaan.laanerid)
inner join eksemplar on (eksemplar.eksemplarid = utlaan.eksemplarid)
inner join bok on (bok.bokid = eksemplar.bokid)
inner join forfatter on (forfatter.forfatterid = bok.forfatterid) where fnavn ='leo';