/*==============================================================*/
/* Table: GEOGRAFICZNE                                          */
/*==============================================================*/
create table GEOGRAFICZNE
(
   ID_Geograficzne                int                            not null,
   Szerokosc                      numeric(8,0)                   not null,
   Wysokosc                       numeric(8,0)                   not null,
   primary key (ID_Geograficzne)
)
type = InnoDB;

/*==============================================================*/
/* Table: KOMENTARZ                                             */
/*==============================================================*/
create table KOMENTARZ
(
   ID_Komentarza                  int                            not null,
   Opis                           varchar(500)                   not null,
   primary key (ID_Komentarza)
)
type = InnoDB;

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table KONTO
(
   ID_Konta                       int                            not null,
   ID_UZ                          int,
   Login                          varchar(10)                    not null,
   Haslo                          varchar(10)                    not null,
   primary key (ID_Konta)
)
type = InnoDB;

/*==============================================================*/
/* Index: Reference_8_FK                                        */
/*==============================================================*/
create index Reference_8_FK on KONTO
(
   ID_UZ
);

/*==============================================================*/
/* Table: LOKALIZACJA                                           */
/*==============================================================*/
create table LOKALIZACJA
(
   ID_Lokalizacji                 int                            not null,
   ID_Geograficzne                int,
   Miasto                         varchar(40)                    not null,
   primary key (ID_Lokalizacji)
)
type = InnoDB;

/*==============================================================*/
/* Index: Reference_6_FK                                        */
/*==============================================================*/
create index Reference_6_FK on LOKALIZACJA
(
   ID_Geograficzne
);

/*==============================================================*/
/* Table: OCENA                                                 */
/*==============================================================*/
create table OCENA
(
   ID_Oceny                       int                            not null,
   Wartosc                        int                            not null,
   primary key (ID_Oceny)
)
type = InnoDB;

/*==============================================================*/
/* Table: OPIS                                                  */
/*==============================================================*/
create table OPIS
(
   ID_Opisu                       int                            not null,
   Tekst                          varchar(500)                   not null,
   primary key (ID_Opisu)
)
type = InnoDB;

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST
(
   "ID Posta"                     int                            not null,
   ID_Lokalizacji                 int,
   ID_Zdjecia                     int,
   ID_Komentarza                  int,
   ID_Oceny                       int,
   ID_Opisu                       int,
   ID_UZ                          int,
   primary key ("ID Posta")
)
type = InnoDB;

/*==============================================================*/
/* Index: Reference_1_FK                                        */
/*==============================================================*/
create index Reference_1_FK on POST
(
   ID_Lokalizacji
);

/*==============================================================*/
/* Index: Reference_2_FK                                        */
/*==============================================================*/
create index Reference_2_FK on POST
(
   ID_Opisu
);

/*==============================================================*/
/* Index: Reference_3_FK                                        */
/*==============================================================*/
create index Reference_3_FK on POST
(
   ID_Zdjecia
);

/*==============================================================*/
/* Index: Reference_4_FK                                        */
/*==============================================================*/
create index Reference_4_FK on POST
(
   ID_Oceny
);

/*==============================================================*/
/* Index: Reference_5_FK                                        */
/*==============================================================*/
create index Reference_5_FK on POST
(
   ID_Komentarza
);

/*==============================================================*/
/* Index: Reference_7_FK                                        */
/*==============================================================*/
create index Reference_7_FK on POST
(
   ID_UZ
);

/*==============================================================*/
/* Table: UZYTKOWNIK                                            */
/*==============================================================*/
create table UZYTKOWNIK
(
   ID_UZ                          int                            not null,
   "E-mail"                       varchar(40)                    not null,
   primary key (ID_UZ)
)
type = InnoDB;

/*==============================================================*/
/* Table: ZDJECIA                                               */
/*==============================================================*/
create table ZDJECIA
(
   ID_Zdjecia                     int                            not null,
   Nazwa                          varchar(30)                    not null,
   Foto                           longblob                       not null,
   primary key (ID_Zdjecia)
)
type = InnoDB;

alter table KONTO add constraint FK_Reference_8 foreign key (ID_UZ)
      references UZYTKOWNIK (ID_UZ) on delete restrict on update restrict;

alter table LOKALIZACJA add constraint FK_Reference_6 foreign key (ID_Geograficzne)
      references GEOGRAFICZNE (ID_Geograficzne) on delete restrict on update restrict;

alter table POST add constraint FK_Reference_1 foreign key (ID_Lokalizacji)
      references LOKALIZACJA (ID_Lokalizacji) on delete restrict on update restrict;

alter table POST add constraint FK_Reference_2 foreign key (ID_Opisu)
      references OPIS (ID_Opisu) on delete restrict on update restrict;

alter table POST add constraint FK_Reference_3 foreign key (ID_Zdjecia)
      references ZDJECIA (ID_Zdjecia) on delete restrict on update restrict;

alter table POST add constraint FK_Reference_4 foreign key (ID_Oceny)
      references OCENA (ID_Oceny) on delete restrict on update restrict;

alter table POST add constraint FK_Reference_5 foreign key (ID_Komentarza)
      references KOMENTARZ (ID_Komentarza) on delete restrict on update restrict;

alter table POST add constraint FK_Reference_7 foreign key (ID_UZ)
      references UZYTKOWNIK (ID_UZ) on delete restrict on update restrict;

