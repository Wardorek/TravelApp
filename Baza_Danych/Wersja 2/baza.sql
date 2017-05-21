/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     2017-05-21 18:15:44                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_KONTO_REFERENCE_UZYTKOWN') then
    alter table KONTO
       delete foreign key FK_KONTO_REFERENCE_UZYTKOWN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LOKALIZA_REFERENCE_GEOGRAFI') then
    alter table LOKALIZACJA
       delete foreign key FK_LOKALIZA_REFERENCE_GEOGRAFI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_LOKALIZA') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_LOKALIZA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_OPIS') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_OPIS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_ZDJECIA') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_ZDJECIA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_OCENA') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_OCENA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_KOMENTAR') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_KOMENTAR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POST_REFERENCE_UZYTKOWN') then
    alter table POST
       delete foreign key FK_POST_REFERENCE_UZYTKOWN
end if;

drop table if exists GEOGRAFICZNE;

drop table if exists KOMENTARZ;

drop table if exists KONTO;

drop table if exists LOKALIZACJA;

drop table if exists OCENA;

drop table if exists OPIS;

drop table if exists POST;

drop table if exists UZYTKOWNIK;

drop table if exists ZDJECIA;

/*==============================================================*/
/* Table: GEOGRAFICZNE                                          */
/*==============================================================*/
create table GEOGRAFICZNE 
(
   ID_Geograficzne      integer                        not null,
   Szerokosc            numeric                        not null,
   Wysokosc             numeric                        not null,
   constraint PK_GEOGRAFICZNE primary key clustered (ID_Geograficzne)
);

/*==============================================================*/
/* Table: KOMENTARZ                                             */
/*==============================================================*/
create table KOMENTARZ 
(
   ID_Komentarza        integer                        not null,
   Opis                 varchar(500)                   not null,
   constraint PK_KOMENTARZ primary key clustered (ID_Komentarza)
);

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table KONTO 
(
   ID                   integer                        not null,
   ID_UZ                integer                        null,
   "Login"              varchar(10)                    not null,
   Haslo                varchar(10)                    not null,
   constraint PK_KONTO primary key clustered (ID)
);

/*==============================================================*/
/* Table: LOKALIZACJA                                           */
/*==============================================================*/
create table LOKALIZACJA 
(
   ID_Lokalizacji       integer                        not null,
   ID_Geograficzne      integer                        null,
   Miasto               varchar(40)                    not null,
   constraint PK_LOKALIZACJA primary key clustered (ID_Lokalizacji)
);

/*==============================================================*/
/* Table: OCENA                                                 */
/*==============================================================*/
create table OCENA 
(
   ID_Oceny             integer                        not null,
   Wartosc              integer                        not null,
   constraint PK_OCENA primary key clustered (ID_Oceny)
);

/*==============================================================*/
/* Table: OPIS                                                  */
/*==============================================================*/
create table OPIS 
(
   ID_Opisu             integer                        not null,
   Tekst                varchar(500)                   not null,
   constraint PK_OPIS primary key clustered (ID_Opisu)
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST 
(
   ID                   integer                        not null,
   ID_Lokalizacji       integer                        null,
   ID_Opisu             integer                        null,
   ID_Zdjecia           integer                        null,
   ID_Oceny             integer                        null,
   ID_Komentarza        integer                        null,
   ID_UZ                integer                        null,
   constraint PK_POST primary key clustered (ID)
);

/*==============================================================*/
/* Table: UZYTKOWNIK                                            */
/*==============================================================*/
create table UZYTKOWNIK 
(
   ID_UZ                integer                        not null,
   "E-mail"             varchar(40)                    not null,
   constraint PK_UZYTKOWNIK primary key clustered (ID_UZ)
);

/*==============================================================*/
/* Table: ZDJECIA                                               */
/*==============================================================*/
create table ZDJECIA 
(
   ID_Zdjecia           integer                        not null,
   Nazwa                varchar(30)                    not null,
   Foto                 image                          not null,
   constraint PK_ZDJECIA primary key clustered (ID_Zdjecia)
);

alter table KONTO
   add constraint FK_KONTO_REFERENCE_UZYTKOWN foreign key (ID_UZ)
      references UZYTKOWNIK (ID_UZ)
      on update restrict
      on delete restrict;

alter table LOKALIZACJA
   add constraint FK_LOKALIZA_REFERENCE_GEOGRAFI foreign key (ID_Geograficzne)
      references GEOGRAFICZNE (ID_Geograficzne)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_LOKALIZA foreign key (ID_Lokalizacji)
      references LOKALIZACJA (ID_Lokalizacji)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_OPIS foreign key (ID_Opisu)
      references OPIS (ID_Opisu)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_ZDJECIA foreign key (ID_Zdjecia)
      references ZDJECIA (ID_Zdjecia)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_OCENA foreign key (ID_Oceny)
      references OCENA (ID_Oceny)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_KOMENTAR foreign key (ID_Komentarza)
      references KOMENTARZ (ID_Komentarza)
      on update restrict
      on delete restrict;

alter table POST
   add constraint FK_POST_REFERENCE_UZYTKOWN foreign key (ID_UZ)
      references UZYTKOWNIK (ID_UZ)
      on update restrict
      on delete restrict;

