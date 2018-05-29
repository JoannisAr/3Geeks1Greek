
CREATE TABLE Korisnik
(
	idK                  INTEGER NOT NULL ,
	username             VARCHAR2(20) NULL ,
	password             VARCHAR2(20) NULL ,
	ime                  VARCHAR2(20) NULL ,
	prezime              VARCHAR2(20) NULL ,
	mail                 VARCHAR2(30) NULL ,
	oznaka               CHAR NOT NULL 
);

CREATE UNIQUE INDEX XPKKorisnik ON Korisnik
(idK   ASC);

ALTER TABLE Korisnik
	ADD CONSTRAINT  XPKKorisnik PRIMARY KEY (idK);

CREATE TABLE Kuvar
(
	idK                  INTEGER NOT NULL ,
	cv                   LONG VARCHAR(150) NOT NULL 
);

CREATE UNIQUE INDEX XPKKuvar ON Kuvar
(idK   ASC);

ALTER TABLE Kuvar
	ADD CONSTRAINT  XPKKuvar PRIMARY KEY (idK);

CREATE TABLE Admin
(
	idK                  INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKAdmin ON Admin
(idK   ASC);

ALTER TABLE Admin
	ADD CONSTRAINT  XPKAdmin PRIMARY KEY (idK);

CREATE TABLE Recepti
(
	idR                  INTEGER NOT NULL ,
	naziv                VARCHAR2(20) NOT NULL ,
	sadrzaj              LONG VARCHAR(100) NOT NULL ,
	obrok                VARCHAR2(20) NOT NULL ,
	kategorija           VARCHAR2(20) NOT NULL ,
	spec-prilika         VARCHAR2(20) NULL 
);

CREATE UNIQUE INDEX XPKRecepti ON Recepti
(idR   ASC);

ALTER TABLE Recepti
	ADD CONSTRAINT  XPKRecepti PRIMARY KEY (idR);

CREATE TABLE Komentar
(
	idK                  INTEGER NOT NULL ,
	idKorisnika          INTEGER NOT NULL ,
	sadrzaj              LONG VARCHAR(100) NULL ,
	idR                  INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKKomentar ON Komentar
(idK   ASC);

ALTER TABLE Komentar
	ADD CONSTRAINT  XPKKomentar PRIMARY KEY (idK);

CREATE TABLE Registrovani
(
	idK                  INTEGER NOT NULL ,
	godine               INTEGER NOT NULL ,
	pol                  CHAR(1) NOT NULL 
);

CREATE UNIQUE INDEX XPKRegistrovani ON Registrovani
(idK   ASC);

ALTER TABLE Registrovani
	ADD CONSTRAINT  XPKRegistrovani PRIMARY KEY (idK);

CREATE TABLE Meni
(
	idM                  INTEGER NOT NULL ,
	idK                  INTEGER NOT NULL ,
	datum                DATE NOT NULL 
);

CREATE UNIQUE INDEX XPKMeni ON Meni
(idM   ASC);

ALTER TABLE Meni
	ADD CONSTRAINT  XPKMeni PRIMARY KEY (idM);

CREATE TABLE veza_meni_recepti
(
	idM                  INTEGER NOT NULL ,
	idR                  INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKveza_meni_recepti ON veza_meni_recepti
(idM   ASC,idR   ASC);

ALTER TABLE veza_meni_recepti
	ADD CONSTRAINT  XPKveza_meni_recepti PRIMARY KEY (idM,idR);

CREATE TABLE Ocenjuje
(
	idK                  INTEGER NOT NULL ,
	idR                  INTEGER NOT NULL ,
	ocena                INTEGER NOT NULL ,
	datum                DATE NOT NULL 
);

CREATE UNIQUE INDEX XPKOcenjuje ON Ocenjuje
(idK   ASC,idR   ASC);

ALTER TABLE Ocenjuje
	ADD CONSTRAINT  XPKOcenjuje PRIMARY KEY (idK,idR);

CREATE TABLE Zahtev
(
	idZ                  INTEGER NOT NULL ,
	idK                  INTEGER NOT NULL ,
	username             VARCHAR2(20) NULL ,
	password             VARCHAR2(20) NULL ,
	cv                   LONG VARCHAR(150) NULL ,
	ime                  VARCHAR2(20) NULL ,
	prezime              VARCHAR2(20) NULL ,
	mail                 VARCHAR2(30) NULL 
);

CREATE UNIQUE INDEX XPKZahtev ON Zahtev
(idZ   ASC);

ALTER TABLE Zahtev
	ADD CONSTRAINT  XPKZahtev PRIMARY KEY (idZ);

CREATE TABLE Knjiga
(
	idK                  INTEGER NOT NULL ,
	idKorisnika          INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKKnjiga ON Knjiga
(idK   ASC);

ALTER TABLE Knjiga
	ADD CONSTRAINT  XPKKnjiga PRIMARY KEY (idK);

CREATE TABLE Sastojci
(
	idS                  INTEGER NOT NULL ,
	naziv                VARCHAR2(20) NOT NULL ,
	opis                 LONG VARCHAR(100) NULL ,
	kategorija           VARCHAR2(20) NOT NULL 
);

CREATE UNIQUE INDEX XPKSastojci ON Sastojci
(idS   ASC);

ALTER TABLE Sastojci
	ADD CONSTRAINT  XPKSastojci PRIMARY KEY (idS);

CREATE TABLE veza_sastojci_recepti
(
	idR                  INTEGER NOT NULL ,
	idS                  INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKveza_sastojci_recepti ON veza_sastojci_recepti
(idR   ASC,idS   ASC);

ALTER TABLE veza_sastojci_recepti
	ADD CONSTRAINT  XPKveza_sastojci_recepti PRIMARY KEY (idR,idS);

CREATE TABLE Omiljeni
(
	idS                  INTEGER NOT NULL ,
	idK                  INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKOmiljeni ON Omiljeni
(idS   ASC,idK   ASC);

ALTER TABLE Omiljeni
	ADD CONSTRAINT  XPKOmiljeni PRIMARY KEY (idS,idK);

CREATE TABLE veza_recepti_knjiga
(
	idK                  INTEGER NOT NULL ,
	idR                  INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKveza_recepti_knjiga ON veza_recepti_knjiga
(idK   ASC,idR   ASC);

ALTER TABLE veza_recepti_knjiga
	ADD CONSTRAINT  XPKveza_recepti_knjiga PRIMARY KEY (idK,idR);

ALTER TABLE Kuvar
	ADD (CONSTRAINT R_2 FOREIGN KEY (idK) REFERENCES Korisnik (idK));

ALTER TABLE Admin
	ADD (CONSTRAINT R_3 FOREIGN KEY (idK) REFERENCES Korisnik (idK));

ALTER TABLE Komentar
	ADD (CONSTRAINT R_14 FOREIGN KEY (idKorisnika) REFERENCES Korisnik (idK));

ALTER TABLE Komentar
	ADD (CONSTRAINT R_13 FOREIGN KEY (idR) REFERENCES Recepti (idR));

ALTER TABLE Registrovani
	ADD (CONSTRAINT R_1 FOREIGN KEY (idK) REFERENCES Korisnik (idK));

ALTER TABLE Meni
	ADD (CONSTRAINT R_10 FOREIGN KEY (idK) REFERENCES Registrovani (idK));

ALTER TABLE veza_meni_recepti
	ADD (CONSTRAINT R_24 FOREIGN KEY (idM) REFERENCES Meni (idM));

ALTER TABLE veza_meni_recepti
	ADD (CONSTRAINT R_26 FOREIGN KEY (idR) REFERENCES Recepti (idR));

ALTER TABLE Ocenjuje
	ADD (CONSTRAINT R_8 FOREIGN KEY (idK) REFERENCES Korisnik (idK));

ALTER TABLE Ocenjuje
	ADD (CONSTRAINT R_20 FOREIGN KEY (idR) REFERENCES Recepti (idR));

ALTER TABLE Zahtev
	ADD (CONSTRAINT R_4 FOREIGN KEY (idK) REFERENCES Admin (idK));

ALTER TABLE Knjiga
	ADD (CONSTRAINT R_15 FOREIGN KEY (idKorisnika) REFERENCES Korisnik (idK));

ALTER TABLE veza_sastojci_recepti
	ADD (CONSTRAINT R_27 FOREIGN KEY (idS) REFERENCES Sastojci (idS));

ALTER TABLE veza_sastojci_recepti
	ADD (CONSTRAINT R_28 FOREIGN KEY (idR) REFERENCES Recepti (idR));

ALTER TABLE Omiljeni
	ADD (CONSTRAINT R_33 FOREIGN KEY (idS) REFERENCES Sastojci (idS));

ALTER TABLE Omiljeni
	ADD (CONSTRAINT R_34 FOREIGN KEY (idK) REFERENCES Registrovani (idK));

ALTER TABLE veza_recepti_knjiga
	ADD (CONSTRAINT R_29 FOREIGN KEY (idK) REFERENCES Knjiga (idK));

ALTER TABLE veza_recepti_knjiga
	ADD (CONSTRAINT R_30 FOREIGN KEY (idR) REFERENCES Recepti (idR));

CREATE  TRIGGER  tD_Korisnik AFTER DELETE ON Korisnik for each row
-- erwin Builtin Trigger
-- DELETE trigger on Korisnik 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Korisnik  Knjiga on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00053585", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="idKorisnika" */
    SELECT count(*) INTO NUMROWS
      FROM Knjiga
      WHERE
        /*  %JoinFKPK(Knjiga,:%Old," = "," AND") */
        Knjiga.idKorisnika = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Korisnik because Knjiga exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Korisnik  Komentar on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="idKorisnika" */
    SELECT count(*) INTO NUMROWS
      FROM Komentar
      WHERE
        /*  %JoinFKPK(Komentar,:%Old," = "," AND") */
        Komentar.idKorisnika = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Korisnik because Komentar exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Korisnik  Ocenjuje on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Ocenjuje
      WHERE
        /*  %JoinFKPK(Ocenjuje,:%Old," = "," AND") */
        Ocenjuje.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Korisnik because Ocenjuje exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Korisnik  Admin on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Admin"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Admin
      WHERE
        /*  %JoinFKPK(Admin,:%Old," = "," AND") */
        Admin.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Korisnik because Admin exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Korisnik  Kuvar on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Kuvar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Kuvar
      WHERE
        /*  %JoinFKPK(Kuvar,:%Old," = "," AND") */
        Kuvar.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Korisnik because Kuvar exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Korisnik  Registrovani on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Registrovani"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Registrovani
      WHERE
        /*  %JoinFKPK(Registrovani,:%Old," = "," AND") */
        Registrovani.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Korisnik because Registrovani exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Korisnik AFTER UPDATE ON Korisnik for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Korisnik 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Korisnik  Knjiga on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00061c67", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="idKorisnika" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Knjiga
      WHERE
        /*  %JoinFKPK(Knjiga,:%Old," = "," AND") */
        Knjiga.idKorisnika = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Korisnik because Knjiga exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Komentar on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="idKorisnika" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Komentar
      WHERE
        /*  %JoinFKPK(Komentar,:%Old," = "," AND") */
        Komentar.idKorisnika = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Korisnik because Komentar exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Ocenjuje on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Ocenjuje
      WHERE
        /*  %JoinFKPK(Ocenjuje,:%Old," = "," AND") */
        Ocenjuje.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Korisnik because Ocenjuje exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Admin on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Admin"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Admin
      WHERE
        /*  %JoinFKPK(Admin,:%Old," = "," AND") */
        Admin.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Korisnik because Admin exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Kuvar on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Kuvar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Kuvar
      WHERE
        /*  %JoinFKPK(Kuvar,:%Old," = "," AND") */
        Kuvar.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Korisnik because Kuvar exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Registrovani on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Registrovani"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Registrovani
      WHERE
        /*  %JoinFKPK(Registrovani,:%Old," = "," AND") */
        Registrovani.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Korisnik because Registrovani exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Kuvar BEFORE INSERT ON Kuvar for each row
-- erwin Builtin Trigger
-- INSERT trigger on Kuvar 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Korisnik  Kuvar on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e29c", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Kuvar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Korisnik
      WHERE
        /* %JoinFKPK(:%New,Korisnik," = "," AND") */
        :new.idK = Korisnik.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Kuvar because Korisnik does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Kuvar AFTER UPDATE ON Kuvar for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Kuvar 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Korisnik  Kuvar on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000e456", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Kuvar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Korisnik
    WHERE
      /* %JoinFKPK(:%New,Korisnik," = "," AND") */
      :new.idK = Korisnik.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Kuvar because Korisnik does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Admin AFTER DELETE ON Admin for each row
-- erwin Builtin Trigger
-- DELETE trigger on Admin 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Admin  Zahtev on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000c0cb", PARENT_OWNER="", PARENT_TABLE="Admin"
    CHILD_OWNER="", CHILD_TABLE="Zahtev"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Zahtev
      WHERE
        /*  %JoinFKPK(Zahtev,:%Old," = "," AND") */
        Zahtev.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Admin because Zahtev exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Admin BEFORE INSERT ON Admin for each row
-- erwin Builtin Trigger
-- INSERT trigger on Admin 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Korisnik  Admin on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dc03", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Admin"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Korisnik
      WHERE
        /* %JoinFKPK(:%New,Korisnik," = "," AND") */
        :new.idK = Korisnik.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Admin because Korisnik does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Admin AFTER UPDATE ON Admin for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Admin 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Admin  Zahtev on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001d5bb", PARENT_OWNER="", PARENT_TABLE="Admin"
    CHILD_OWNER="", CHILD_TABLE="Zahtev"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Zahtev
      WHERE
        /*  %JoinFKPK(Zahtev,:%Old," = "," AND") */
        Zahtev.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Admin because Zahtev exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Admin on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Admin"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Korisnik
    WHERE
      /* %JoinFKPK(:%New,Korisnik," = "," AND") */
      :new.idK = Korisnik.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Admin because Korisnik does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Recepti AFTER DELETE ON Recepti for each row
-- erwin Builtin Trigger
-- DELETE trigger on Recepti 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Recepti  veza_recepti_knjiga on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0004acd6", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM veza_recepti_knjiga
      WHERE
        /*  %JoinFKPK(veza_recepti_knjiga,:%Old," = "," AND") */
        veza_recepti_knjiga.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Recepti because veza_recepti_knjiga exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Recepti  veza_sastojci_recepti on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM veza_sastojci_recepti
      WHERE
        /*  %JoinFKPK(veza_sastojci_recepti,:%Old," = "," AND") */
        veza_sastojci_recepti.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Recepti because veza_sastojci_recepti exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Recepti  veza_meni_recepti on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM veza_meni_recepti
      WHERE
        /*  %JoinFKPK(veza_meni_recepti,:%Old," = "," AND") */
        veza_meni_recepti.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Recepti because veza_meni_recepti exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Recepti  Ocenjuje on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Ocenjuje
      WHERE
        /*  %JoinFKPK(Ocenjuje,:%Old," = "," AND") */
        Ocenjuje.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Recepti because Ocenjuje exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Recepti  Komentar on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Komentar
      WHERE
        /*  %JoinFKPK(Komentar,:%Old," = "," AND") */
        Komentar.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Recepti because Komentar exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Recepti AFTER UPDATE ON Recepti for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Recepti 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Recepti  veza_recepti_knjiga on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="000542d8", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="idR" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idR <> :new.idR
  THEN
    SELECT count(*) INTO NUMROWS
      FROM veza_recepti_knjiga
      WHERE
        /*  %JoinFKPK(veza_recepti_knjiga,:%Old," = "," AND") */
        veza_recepti_knjiga.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Recepti because veza_recepti_knjiga exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Recepti  veza_sastojci_recepti on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="idR" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idR <> :new.idR
  THEN
    SELECT count(*) INTO NUMROWS
      FROM veza_sastojci_recepti
      WHERE
        /*  %JoinFKPK(veza_sastojci_recepti,:%Old," = "," AND") */
        veza_sastojci_recepti.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Recepti because veza_sastojci_recepti exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Recepti  veza_meni_recepti on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="idR" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idR <> :new.idR
  THEN
    SELECT count(*) INTO NUMROWS
      FROM veza_meni_recepti
      WHERE
        /*  %JoinFKPK(veza_meni_recepti,:%Old," = "," AND") */
        veza_meni_recepti.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Recepti because veza_meni_recepti exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Recepti  Ocenjuje on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="idR" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idR <> :new.idR
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Ocenjuje
      WHERE
        /*  %JoinFKPK(Ocenjuje,:%Old," = "," AND") */
        Ocenjuje.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Recepti because Ocenjuje exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Recepti  Komentar on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="idR" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idR <> :new.idR
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Komentar
      WHERE
        /*  %JoinFKPK(Komentar,:%Old," = "," AND") */
        Komentar.idR = :old.idR;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Recepti because Komentar exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Komentar BEFORE INSERT ON Komentar for each row
-- erwin Builtin Trigger
-- INSERT trigger on Komentar 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Korisnik  Komentar on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001df05", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="idKorisnika" */
    SELECT count(*) INTO NUMROWS
      FROM Korisnik
      WHERE
        /* %JoinFKPK(:%New,Korisnik," = "," AND") */
        :new.idKorisnika = Korisnik.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Komentar because Korisnik does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Recepti  Komentar on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Recepti
      WHERE
        /* %JoinFKPK(:%New,Recepti," = "," AND") */
        :new.idR = Recepti.idR;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Komentar because Recepti does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Komentar AFTER UPDATE ON Komentar for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Komentar 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Korisnik  Komentar on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001df3a", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="idKorisnika" */
  SELECT count(*) INTO NUMROWS
    FROM Korisnik
    WHERE
      /* %JoinFKPK(:%New,Korisnik," = "," AND") */
      :new.idKorisnika = Korisnik.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Komentar because Korisnik does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Recepti  Komentar on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Komentar"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_13", FK_COLUMNS="idR" */
  SELECT count(*) INTO NUMROWS
    FROM Recepti
    WHERE
      /* %JoinFKPK(:%New,Recepti," = "," AND") */
      :new.idR = Recepti.idR;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Komentar because Recepti does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Registrovani AFTER DELETE ON Registrovani for each row
-- erwin Builtin Trigger
-- DELETE trigger on Registrovani 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Registrovani  Omiljeni on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001c078", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Omiljeni
      WHERE
        /*  %JoinFKPK(Omiljeni,:%Old," = "," AND") */
        Omiljeni.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Registrovani because Omiljeni exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Registrovani  Meni on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Meni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Meni
      WHERE
        /*  %JoinFKPK(Meni,:%Old," = "," AND") */
        Meni.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Registrovani because Meni exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Registrovani BEFORE INSERT ON Registrovani for each row
-- erwin Builtin Trigger
-- INSERT trigger on Registrovani 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Korisnik  Registrovani on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ec52", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Registrovani"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Korisnik
      WHERE
        /* %JoinFKPK(:%New,Korisnik," = "," AND") */
        :new.idK = Korisnik.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Registrovani because Korisnik does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Registrovani AFTER UPDATE ON Registrovani for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Registrovani 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Registrovani  Omiljeni on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002e7ea", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Omiljeni
      WHERE
        /*  %JoinFKPK(Omiljeni,:%Old," = "," AND") */
        Omiljeni.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Registrovani because Omiljeni exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Registrovani  Meni on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Meni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Meni
      WHERE
        /*  %JoinFKPK(Meni,:%Old," = "," AND") */
        Meni.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Registrovani because Meni exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Registrovani on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Registrovani"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_1", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Korisnik
    WHERE
      /* %JoinFKPK(:%New,Korisnik," = "," AND") */
      :new.idK = Korisnik.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Registrovani because Korisnik does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Meni AFTER DELETE ON Meni for each row
-- erwin Builtin Trigger
-- DELETE trigger on Meni 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Meni  veza_meni_recepti on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e27c", PARENT_OWNER="", PARENT_TABLE="Meni"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="idM" */
    SELECT count(*) INTO NUMROWS
      FROM veza_meni_recepti
      WHERE
        /*  %JoinFKPK(veza_meni_recepti,:%Old," = "," AND") */
        veza_meni_recepti.idM = :old.idM;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Meni because veza_meni_recepti exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Meni BEFORE INSERT ON Meni for each row
-- erwin Builtin Trigger
-- INSERT trigger on Meni 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Registrovani  Meni on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000eb81", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Meni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Registrovani
      WHERE
        /* %JoinFKPK(:%New,Registrovani," = "," AND") */
        :new.idK = Registrovani.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Meni because Registrovani does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Meni AFTER UPDATE ON Meni for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Meni 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Meni  veza_meni_recepti on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0002069a", PARENT_OWNER="", PARENT_TABLE="Meni"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="idM" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idM <> :new.idM
  THEN
    SELECT count(*) INTO NUMROWS
      FROM veza_meni_recepti
      WHERE
        /*  %JoinFKPK(veza_meni_recepti,:%Old," = "," AND") */
        veza_meni_recepti.idM = :old.idM;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Meni because veza_meni_recepti exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Registrovani  Meni on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Meni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Registrovani
    WHERE
      /* %JoinFKPK(:%New,Registrovani," = "," AND") */
      :new.idK = Registrovani.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Meni because Registrovani does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_veza_meni_recepti BEFORE INSERT ON veza_meni_recepti for each row
-- erwin Builtin Trigger
-- INSERT trigger on veza_meni_recepti 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Recepti  veza_meni_recepti on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001ed70", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Recepti
      WHERE
        /* %JoinFKPK(:%New,Recepti," = "," AND") */
        :new.idR = Recepti.idR;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert veza_meni_recepti because Recepti does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Meni  veza_meni_recepti on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Meni"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="idM" */
    SELECT count(*) INTO NUMROWS
      FROM Meni
      WHERE
        /* %JoinFKPK(:%New,Meni," = "," AND") */
        :new.idM = Meni.idM;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert veza_meni_recepti because Meni does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_veza_meni_recepti AFTER UPDATE ON veza_meni_recepti for each row
-- erwin Builtin Trigger
-- UPDATE trigger on veza_meni_recepti 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Recepti  veza_meni_recepti on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001eebf", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_26", FK_COLUMNS="idR" */
  SELECT count(*) INTO NUMROWS
    FROM Recepti
    WHERE
      /* %JoinFKPK(:%New,Recepti," = "," AND") */
      :new.idR = Recepti.idR;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update veza_meni_recepti because Recepti does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Meni  veza_meni_recepti on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Meni"
    CHILD_OWNER="", CHILD_TABLE="veza_meni_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_24", FK_COLUMNS="idM" */
  SELECT count(*) INTO NUMROWS
    FROM Meni
    WHERE
      /* %JoinFKPK(:%New,Meni," = "," AND") */
      :new.idM = Meni.idM;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update veza_meni_recepti because Meni does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Ocenjuje BEFORE INSERT ON Ocenjuje for each row
-- erwin Builtin Trigger
-- INSERT trigger on Ocenjuje 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Recepti  Ocenjuje on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001db26", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Recepti
      WHERE
        /* %JoinFKPK(:%New,Recepti," = "," AND") */
        :new.idR = Recepti.idR;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Ocenjuje because Recepti does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Korisnik  Ocenjuje on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Korisnik
      WHERE
        /* %JoinFKPK(:%New,Korisnik," = "," AND") */
        :new.idK = Korisnik.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Ocenjuje because Korisnik does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Ocenjuje AFTER UPDATE ON Ocenjuje for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Ocenjuje 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Recepti  Ocenjuje on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001d2dd", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="idR" */
  SELECT count(*) INTO NUMROWS
    FROM Recepti
    WHERE
      /* %JoinFKPK(:%New,Recepti," = "," AND") */
      :new.idR = Recepti.idR;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Ocenjuje because Recepti does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Ocenjuje on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Ocenjuje"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_8", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Korisnik
    WHERE
      /* %JoinFKPK(:%New,Korisnik," = "," AND") */
      :new.idK = Korisnik.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Ocenjuje because Korisnik does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Zahtev BEFORE INSERT ON Zahtev for each row
-- erwin Builtin Trigger
-- INSERT trigger on Zahtev 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Admin  Zahtev on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000dddc", PARENT_OWNER="", PARENT_TABLE="Admin"
    CHILD_OWNER="", CHILD_TABLE="Zahtev"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Admin
      WHERE
        /* %JoinFKPK(:%New,Admin," = "," AND") */
        :new.idK = Admin.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Zahtev because Admin does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Zahtev AFTER UPDATE ON Zahtev for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Zahtev 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Admin  Zahtev on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0000dc58", PARENT_OWNER="", PARENT_TABLE="Admin"
    CHILD_OWNER="", CHILD_TABLE="Zahtev"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_4", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Admin
    WHERE
      /* %JoinFKPK(:%New,Admin," = "," AND") */
      :new.idK = Admin.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Zahtev because Admin does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Knjiga AFTER DELETE ON Knjiga for each row
-- erwin Builtin Trigger
-- DELETE trigger on Knjiga 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Knjiga  veza_recepti_knjiga on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0000ed3d", PARENT_OWNER="", PARENT_TABLE="Knjiga"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM veza_recepti_knjiga
      WHERE
        /*  %JoinFKPK(veza_recepti_knjiga,:%Old," = "," AND") */
        veza_recepti_knjiga.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Knjiga because veza_recepti_knjiga exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_Knjiga BEFORE INSERT ON Knjiga for each row
-- erwin Builtin Trigger
-- INSERT trigger on Knjiga 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Korisnik  Knjiga on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000e8a7", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="idKorisnika" */
    SELECT count(*) INTO NUMROWS
      FROM Korisnik
      WHERE
        /* %JoinFKPK(:%New,Korisnik," = "," AND") */
        :new.idKorisnika = Korisnik.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Knjiga because Korisnik does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Knjiga AFTER UPDATE ON Knjiga for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Knjiga 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Knjiga  veza_recepti_knjiga on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00020b52", PARENT_OWNER="", PARENT_TABLE="Knjiga"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="idK" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idK <> :new.idK
  THEN
    SELECT count(*) INTO NUMROWS
      FROM veza_recepti_knjiga
      WHERE
        /*  %JoinFKPK(veza_recepti_knjiga,:%Old," = "," AND") */
        veza_recepti_knjiga.idK = :old.idK;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Knjiga because veza_recepti_knjiga exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Korisnik  Knjiga on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Korisnik"
    CHILD_OWNER="", CHILD_TABLE="Knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_15", FK_COLUMNS="idKorisnika" */
  SELECT count(*) INTO NUMROWS
    FROM Korisnik
    WHERE
      /* %JoinFKPK(:%New,Korisnik," = "," AND") */
      :new.idKorisnika = Korisnik.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Knjiga because Korisnik does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_Sastojci AFTER DELETE ON Sastojci for each row
-- erwin Builtin Trigger
-- DELETE trigger on Sastojci 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Sastojci  Omiljeni on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001db84", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="idS" */
    SELECT count(*) INTO NUMROWS
      FROM Omiljeni
      WHERE
        /*  %JoinFKPK(Omiljeni,:%Old," = "," AND") */
        Omiljeni.idS = :old.idS;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sastojci because Omiljeni exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Sastojci  veza_sastojci_recepti on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="idS" */
    SELECT count(*) INTO NUMROWS
      FROM veza_sastojci_recepti
      WHERE
        /*  %JoinFKPK(veza_sastojci_recepti,:%Old," = "," AND") */
        veza_sastojci_recepti.idS = :old.idS;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete Sastojci because veza_sastojci_recepti exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Sastojci AFTER UPDATE ON Sastojci for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Sastojci 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Sastojci  Omiljeni on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00021e1e", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="idS" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idS <> :new.idS
  THEN
    SELECT count(*) INTO NUMROWS
      FROM Omiljeni
      WHERE
        /*  %JoinFKPK(Omiljeni,:%Old," = "," AND") */
        Omiljeni.idS = :old.idS;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sastojci because Omiljeni exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* Sastojci  veza_sastojci_recepti on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="idS" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.idS <> :new.idS
  THEN
    SELECT count(*) INTO NUMROWS
      FROM veza_sastojci_recepti
      WHERE
        /*  %JoinFKPK(veza_sastojci_recepti,:%Old," = "," AND") */
        veza_sastojci_recepti.idS = :old.idS;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update Sastojci because veza_sastojci_recepti exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_veza_sastojci_recepti BEFORE INSERT ON veza_sastojci_recepti for each row
-- erwin Builtin Trigger
-- INSERT trigger on veza_sastojci_recepti 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Recepti  veza_sastojci_recepti on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001facf", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Recepti
      WHERE
        /* %JoinFKPK(:%New,Recepti," = "," AND") */
        :new.idR = Recepti.idR;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert veza_sastojci_recepti because Recepti does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Sastojci  veza_sastojci_recepti on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="idS" */
    SELECT count(*) INTO NUMROWS
      FROM Sastojci
      WHERE
        /* %JoinFKPK(:%New,Sastojci," = "," AND") */
        :new.idS = Sastojci.idS;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert veza_sastojci_recepti because Sastojci does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_veza_sastojci_recepti AFTER UPDATE ON veza_sastojci_recepti for each row
-- erwin Builtin Trigger
-- UPDATE trigger on veza_sastojci_recepti 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Recepti  veza_sastojci_recepti on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001fea3", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_28", FK_COLUMNS="idR" */
  SELECT count(*) INTO NUMROWS
    FROM Recepti
    WHERE
      /* %JoinFKPK(:%New,Recepti," = "," AND") */
      :new.idR = Recepti.idR;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update veza_sastojci_recepti because Recepti does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Sastojci  veza_sastojci_recepti on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="veza_sastojci_recepti"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_27", FK_COLUMNS="idS" */
  SELECT count(*) INTO NUMROWS
    FROM Sastojci
    WHERE
      /* %JoinFKPK(:%New,Sastojci," = "," AND") */
      :new.idS = Sastojci.idS;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update veza_sastojci_recepti because Sastojci does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_Omiljeni BEFORE INSERT ON Omiljeni for each row
-- erwin Builtin Trigger
-- INSERT trigger on Omiljeni 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Registrovani  Omiljeni on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001eea1", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Registrovani
      WHERE
        /* %JoinFKPK(:%New,Registrovani," = "," AND") */
        :new.idK = Registrovani.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Omiljeni because Registrovani does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Sastojci  Omiljeni on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="idS" */
    SELECT count(*) INTO NUMROWS
      FROM Sastojci
      WHERE
        /* %JoinFKPK(:%New,Sastojci," = "," AND") */
        :new.idS = Sastojci.idS;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert Omiljeni because Sastojci does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_Omiljeni AFTER UPDATE ON Omiljeni for each row
-- erwin Builtin Trigger
-- UPDATE trigger on Omiljeni 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Registrovani  Omiljeni on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001e307", PARENT_OWNER="", PARENT_TABLE="Registrovani"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_34", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Registrovani
    WHERE
      /* %JoinFKPK(:%New,Registrovani," = "," AND") */
      :new.idK = Registrovani.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Omiljeni because Registrovani does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Sastojci  Omiljeni on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Sastojci"
    CHILD_OWNER="", CHILD_TABLE="Omiljeni"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_33", FK_COLUMNS="idS" */
  SELECT count(*) INTO NUMROWS
    FROM Sastojci
    WHERE
      /* %JoinFKPK(:%New,Sastojci," = "," AND") */
      :new.idS = Sastojci.idS;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update Omiljeni because Sastojci does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_veza_recepti_knjiga BEFORE INSERT ON veza_recepti_knjiga for each row
-- erwin Builtin Trigger
-- INSERT trigger on veza_recepti_knjiga 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* Recepti  veza_recepti_knjiga on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e751", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="idR" */
    SELECT count(*) INTO NUMROWS
      FROM Recepti
      WHERE
        /* %JoinFKPK(:%New,Recepti," = "," AND") */
        :new.idR = Recepti.idR;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert veza_recepti_knjiga because Recepti does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* Knjiga  veza_recepti_knjiga on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Knjiga"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="idK" */
    SELECT count(*) INTO NUMROWS
      FROM Knjiga
      WHERE
        /* %JoinFKPK(:%New,Knjiga," = "," AND") */
        :new.idK = Knjiga.idK;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert veza_recepti_knjiga because Knjiga does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_veza_recepti_knjiga AFTER UPDATE ON veza_recepti_knjiga for each row
-- erwin Builtin Trigger
-- UPDATE trigger on veza_recepti_knjiga 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* Recepti  veza_recepti_knjiga on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001e715", PARENT_OWNER="", PARENT_TABLE="Recepti"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_30", FK_COLUMNS="idR" */
  SELECT count(*) INTO NUMROWS
    FROM Recepti
    WHERE
      /* %JoinFKPK(:%New,Recepti," = "," AND") */
      :new.idR = Recepti.idR;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update veza_recepti_knjiga because Recepti does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* Knjiga  veza_recepti_knjiga on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="Knjiga"
    CHILD_OWNER="", CHILD_TABLE="veza_recepti_knjiga"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_29", FK_COLUMNS="idK" */
  SELECT count(*) INTO NUMROWS
    FROM Knjiga
    WHERE
      /* %JoinFKPK(:%New,Knjiga," = "," AND") */
      :new.idK = Knjiga.idK;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update veza_recepti_knjiga because Knjiga does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/

