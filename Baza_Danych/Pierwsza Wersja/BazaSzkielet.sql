CREATE TABLE "KONTO" (
	"ID" INT,
	"Login" varchar2,
	"Haslo" varchar2,
	"ID_Uzytkownika" INT,
	constraint KONTO_PK PRIMARY KEY ("ID")
CREATE sequence "KONTO_SEQ"
/
CREATE trigger "BI_KONTO"
  before insert on "KONTO"
  for each row
begin
  select "KONTO_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "UZYTKOWNIK" (
	"ID" INT,
	"E-mail" varchar2,
	constraint UZYTKOWNIK_PK PRIMARY KEY ("ID")
CREATE sequence "UZYTKOWNIK_SEQ"
/
CREATE trigger "BI_UZYTKOWNIK"
  before insert on "UZYTKOWNIK"
  for each row
begin
  select "UZYTKOWNIK_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "ZDJECIA" (
	"ID" INT,
	"Nazwa" varchar2,
	"Foto" clob,
	constraint ZDJECIA_PK PRIMARY KEY ("ID")
CREATE sequence "ZDJECIA_SEQ"
/
CREATE trigger "BI_ZDJECIA"
  before insert on "ZDJECIA"
  for each row
begin
  select "ZDJECIA_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "OPIS" (
	"ID" INT,
	"Tekst" nvarchar2,
	constraint OPIS_PK PRIMARY KEY ("ID")
CREATE sequence "OPIS_SEQ"
/
CREATE trigger "BI_OPIS"
  before insert on "OPIS"
  for each row
begin
  select "OPIS_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "POST" (
	"ID" INT,
	"ID_Lokalizacji" INT,
	"ID_Zdjecia" INT,
	"ID_Opisu" INT,
	"ID_Oceny" INT,
	"ID_Komentarzy" INT,
	"ID_Uzytkownika" INT,
	constraint POST_PK PRIMARY KEY ("ID")
CREATE sequence "POST_SEQ"
/
CREATE trigger "BI_POST"
  before insert on "POST"
  for each row
begin
  select "POST_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "LOKALIZACJA" (
	"ID" INT,
	"Miasto" varchar2,
	"ID_Geograficzne" INT,
	constraint LOKALIZACJA_PK PRIMARY KEY ("ID")
CREATE sequence "LOKALIZACJA_SEQ"
/
CREATE trigger "BI_LOKALIZACJA"
  before insert on "LOKALIZACJA"
  for each row
begin
  select "LOKALIZACJA_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "GEOFRAFICZNE" (
	"ID" INT,
	"Szerokosc" numeric,
	"Wysokosc" numeric,
	constraint GEOFRAFICZNE_PK PRIMARY KEY ("ID")
CREATE sequence "GEOFRAFICZNE_SEQ"
/
CREATE trigger "BI_GEOFRAFICZNE"
  before insert on "GEOFRAFICZNE"
  for each row
begin
  select "GEOFRAFICZNE_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "OCENA" (
	"ID" INT,
	"Wartosc" int,
	constraint OCENA_PK PRIMARY KEY ("ID")
CREATE sequence "OCENA_SEQ"
/
CREATE trigger "BI_OCENA"
  before insert on "OCENA"
  for each row
begin
  select "OCENA_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
CREATE TABLE "KOMENTARZ" (
	"ID" INT,
	"Opis" varchar2,
	constraint KOMENTARZ_PK PRIMARY KEY ("ID")
CREATE sequence "KOMENTARZ_SEQ"
/
CREATE trigger "BI_KOMENTARZ"
  before insert on "KOMENTARZ"
  for each row
begin
  select "KOMENTARZ_SEQ".nextval into :NEW."ID" from dual;
end;
/

)
/
ALTER TABLE "KONTO" ADD CONSTRAINT "KONTO_fk0" FOREIGN KEY ("ID_Uzytkownika") REFERENCES UZYTKOWNIK("ID");




ALTER TABLE "POST" ADD CONSTRAINT "POST_fk0" FOREIGN KEY ("ID_Lokalizacji") REFERENCES LOKALIZACJA("ID");
ALTER TABLE "POST" ADD CONSTRAINT "POST_fk1" FOREIGN KEY ("ID_Zdjecia") REFERENCES ZDJECIA("ID");
ALTER TABLE "POST" ADD CONSTRAINT "POST_fk2" FOREIGN KEY ("ID_Opisu") REFERENCES OPIS("ID");
ALTER TABLE "POST" ADD CONSTRAINT "POST_fk3" FOREIGN KEY ("ID_Oceny") REFERENCES OCENA("ID");
ALTER TABLE "POST" ADD CONSTRAINT "POST_fk4" FOREIGN KEY ("ID_Komentarzy") REFERENCES KOMENTARZ("ID");
ALTER TABLE "POST" ADD CONSTRAINT "POST_fk5" FOREIGN KEY ("ID_Uzytkownika") REFERENCES KONTO("ID");

ALTER TABLE "LOKALIZACJA" ADD CONSTRAINT "LOKALIZACJA_fk0" FOREIGN KEY ("ID_Geograficzne") REFERENCES GEOFRAFICZNE("ID");

