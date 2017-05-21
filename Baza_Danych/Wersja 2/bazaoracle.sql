/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2017-05-21 18:31:30                          */
/*==============================================================*/


alter table KONTO
   drop constraint FK_KONTO_REFERENCE_UZYTKOWN;

alter table LOKALIZACJA
   drop constraint FK_LOKALIZA_REFERENCE_GEOGRAFI;

alter table POST
   drop constraint FK_POST_REFERENCE_LOKALIZA;

alter table POST
   drop constraint FK_POST_REFERENCE_OPIS;

alter table POST
   drop constraint FK_POST_REFERENCE_ZDJECIA;

alter table POST
   drop constraint FK_POST_REFERENCE_OCENA;

alter table POST
   drop constraint FK_POST_REFERENCE_KOMENTAR;

alter table POST
   drop constraint FK_POST_REFERENCE_UZYTKOWN;

drop table GEOGRAFICZNE cascade constraints;

drop table KOMENTARZ cascade constraints;

drop table KONTO cascade constraints;

drop table LOKALIZACJA cascade constraints;

drop table OCENA cascade constraints;

drop table OPIS cascade constraints;

drop table POST cascade constraints;

drop table UZYTKOWNIK cascade constraints;

drop table ZDJECIA cascade constraints;

/*==============================================================*/
/* Table: GEOGRAFICZNE                                          */
/*==============================================================*/
create table GEOGRAFICZNE  (
   "ID_Geograficzne"    INTEGER                         not null,
   "Szerokosc"          NUMBER                          not null,
   "Wysokosc"           NUMBER                          not null,
   constraint PK_GEOGRAFICZNE primary key ("ID_Geograficzne")
);

/*==============================================================*/
/* Table: KOMENTARZ                                             */
/*==============================================================*/
create table KOMENTARZ  (
   "ID_Komentarza"      INTEGER                         not null,
   "Opis"               VARCHAR2(500)                   not null,
   constraint PK_KOMENTARZ primary key ("ID_Komentarza")
);

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table KONTO  (
   ID                   INTEGER                         not null,
   ID_UZ                INTEGER,
   "Login"              VARCHAR2(10)                    not null,
   "Haslo"              VARCHAR2(10)                    not null,
   constraint PK_KONTO primary key (ID)
);

/*==============================================================*/
/* Table: LOKALIZACJA                                           */
/*==============================================================*/
create table LOKALIZACJA  (
   "ID_Lokalizacji"     INTEGER                         not null,
   "ID_Geograficzne"    INTEGER,
   "Miasto"             VARCHAR2(40)                    not null,
   constraint PK_LOKALIZACJA primary key ("ID_Lokalizacji")
);

/*==============================================================*/
/* Table: OCENA                                                 */
/*==============================================================*/
create table OCENA  (
   "ID_Oceny"           INTEGER                         not null,
   "Wartosc"            INTEGER                         not null,
   constraint PK_OCENA primary key ("ID_Oceny")
);

/*==============================================================*/
/* Table: OPIS                                                  */
/*==============================================================*/
create table OPIS  (
   "ID_Opisu"           INTEGER                         not null,
   "Tekst"              VARCHAR2(500)                   not null,
   constraint PK_OPIS primary key ("ID_Opisu")
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST  (
   ID                   INTEGER                         not null,
   "ID_Lokalizacji"     INTEGER,
   "ID_Opisu"           INTEGER,
   "ID_Zdjecia"         INTEGER,
   "ID_Oceny"           INTEGER,
   "ID_Komentarza"      INTEGER,
   ID_UZ                INTEGER,
   constraint PK_POST primary key (ID)
);

/*==============================================================*/
/* Table: UZYTKOWNIK                                            */
/*==============================================================*/
create table UZYTKOWNIK  (
   ID_UZ                INTEGER                         not null,
   "E-mail"             VARCHAR2(40)                    not null,
   constraint PK_UZYTKOWNIK primary key (ID_UZ)
);

/*==============================================================*/
/* Table: ZDJECIA                                               */
/*==============================================================*/
create table ZDJECIA  (
   "ID_Zdjecia"         INTEGER                         not null,
   "Nazwa"              VARCHAR2(30)                    not null,
   "Foto"               BLOB                            not null,
   constraint PK_ZDJECIA primary key ("ID_Zdjecia")
);

alter table KONTO
   add constraint FK_KONTO_REFERENCE_UZYTKOWN foreign key (ID_UZ)
      references UZYTKOWNIK (ID_UZ);

alter table LOKALIZACJA
   add constraint FK_LOKALIZA_REFERENCE_GEOGRAFI foreign key ("ID_Geograficzne")
      references GEOGRAFICZNE ("ID_Geograficzne");

alter table POST
   add constraint FK_POST_REFERENCE_LOKALIZA foreign key ("ID_Lokalizacji")
      references LOKALIZACJA ("ID_Lokalizacji");

alter table POST
   add constraint FK_POST_REFERENCE_OPIS foreign key ("ID_Opisu")
      references OPIS ("ID_Opisu");

alter table POST
   add constraint FK_POST_REFERENCE_ZDJECIA foreign key ("ID_Zdjecia")
      references ZDJECIA ("ID_Zdjecia");

alter table POST
   add constraint FK_POST_REFERENCE_OCENA foreign key ("ID_Oceny")
      references OCENA ("ID_Oceny");

alter table POST
   add constraint FK_POST_REFERENCE_KOMENTAR foreign key ("ID_Komentarza")
      references KOMENTARZ ("ID_Komentarza");

alter table POST
   add constraint FK_POST_REFERENCE_UZYTKOWN foreign key (ID_UZ)
      references UZYTKOWNIK (ID_UZ);

