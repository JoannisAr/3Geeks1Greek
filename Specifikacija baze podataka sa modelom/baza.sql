
CREATE TABLE Admin
(
	idK                  INTEGER NOT NULL
);

ALTER TABLE Admin
ADD CONSTRAINT XPKAdmin PRIMARY KEY (idK);

CREATE TABLE Knjiga
(
	idK                  INTEGER NOT NULL,
	idKorisnika          INTEGER NULL
);

ALTER TABLE Knjiga
ADD CONSTRAINT XPKKnjiga PRIMARY KEY (idK);

CREATE TABLE Komentar
(
	idK                  INTEGER NOT NULL,
	idKorisnika          INTEGER NULL,
	sadrzaj              TEXT NULL,
	idR                  INTEGER NULL
);

ALTER TABLE Komentar
ADD CONSTRAINT XPKKomentar PRIMARY KEY (idK);

CREATE TABLE Korisnik
(
	idK                  INTEGER NOT NULL,
	username             VARCHAR(20) NULL,
	password             VARCHAR(20) NULL,
	ime                  VARCHAR(20) NULL,
	prezime              VARCHAR(20) NULL,
	mail                 VARCHAR(30) NULL
);

ALTER TABLE Korisnik
ADD CONSTRAINT XPKKorisnik PRIMARY KEY (idK);

CREATE TABLE Kuvar
(
	idK                  INTEGER NOT NULL,
	cv                   TEXT NOT NULL
);

ALTER TABLE Kuvar
ADD CONSTRAINT XPKKuvar PRIMARY KEY (idK);

CREATE TABLE Meni
(
	idM                  INTEGER NOT NULL,
	idK                  INTEGER NULL,
	datum                DATE NOT NULL
);

ALTER TABLE Meni
ADD CONSTRAINT XPKMeni PRIMARY KEY (idM);

CREATE TABLE Ocenjuje
(
	idK                  INTEGER NOT NULL,
	idR                  INTEGER NOT NULL,
	ocena                INTEGER NOT NULL,
	datum                DATE NOT NULL
);

ALTER TABLE Ocenjuje
ADD CONSTRAINT XPKOcenjuje PRIMARY KEY (idK,idR);

CREATE TABLE Recepti
(
	idR                  INTEGER NOT NULL,
	idK                  INTEGER NULL,
	idM                  INTEGER NULL,
	naziv                VARCHAR(20) NOT NULL,
	sadrzaj              TEXT NOT NULL,
	obrok                VARCHAR(20) NOT NULL,
	kategorija           VARCHAR(20) NOT NULL,
	spec_prilika         VARCHAR(20) NULL
);

ALTER TABLE Recepti
ADD CONSTRAINT XPKRecepti PRIMARY KEY (idR);

CREATE TABLE Registrovani
(
	idK                  INTEGER NOT NULL,
	godine               INTEGER NOT NULL,
	pol                  CHAR(1) NOT NULL
);

ALTER TABLE Registrovani
ADD CONSTRAINT XPKRegistrovani PRIMARY KEY (idK);

CREATE TABLE Sastojci
(
	idS                  INTEGER NOT NULL,
	idK                  INTEGER NULL,
	naziv                VARCHAR(20) NOT NULL,
	opis                 TEXT NULL,
	kategorija           VARCHAR(20) NOT NULL,
	idR                  INTEGER NULL
);

ALTER TABLE Sastojci
ADD CONSTRAINT XPKSastojci PRIMARY KEY (idS);

CREATE TABLE Zahtev
(
	idZ                  INTEGER NOT NULL,
	idK                  INTEGER NULL,
	username             VARCHAR(20) NULL,
	password             VARCHAR(20) NULL,
	cv                   TEXT NULL,
	ime                  VARCHAR(20) NULL,
	prezime              VARCHAR(20) NULL,
	mail                 VARCHAR(30) NULL
);

ALTER TABLE Zahtev
ADD CONSTRAINT XPKZahtev PRIMARY KEY (idZ);

ALTER TABLE Admin
ADD CONSTRAINT R_3 FOREIGN KEY (idK) REFERENCES Korisnik (idK);

ALTER TABLE Knjiga
ADD CONSTRAINT R_15 FOREIGN KEY (idKorisnika) REFERENCES Korisnik (idK);

ALTER TABLE Komentar
ADD CONSTRAINT R_14 FOREIGN KEY (idKorisnika) REFERENCES Korisnik (idK);

ALTER TABLE Komentar
ADD CONSTRAINT R_13 FOREIGN KEY (idR) REFERENCES Recepti (idR);

ALTER TABLE Kuvar
ADD CONSTRAINT R_2 FOREIGN KEY (idK) REFERENCES Korisnik (idK);

ALTER TABLE Meni
ADD CONSTRAINT R_10 FOREIGN KEY (idK) REFERENCES Registrovani (idK);

ALTER TABLE Ocenjuje
ADD CONSTRAINT R_8 FOREIGN KEY (idK) REFERENCES Korisnik (idK);

ALTER TABLE Ocenjuje
ADD CONSTRAINT R_20 FOREIGN KEY (idR) REFERENCES Recepti (idR);

ALTER TABLE Recepti
ADD CONSTRAINT R_9 FOREIGN KEY (idK) REFERENCES Knjiga (idK);

ALTER TABLE Recepti
ADD CONSTRAINT R_11 FOREIGN KEY (idM) REFERENCES Meni (idM);

ALTER TABLE Registrovani
ADD CONSTRAINT R_1 FOREIGN KEY (idK) REFERENCES Korisnik (idK);

ALTER TABLE Sastojci
ADD CONSTRAINT R_19 FOREIGN KEY (idK) REFERENCES Registrovani (idK);

ALTER TABLE Sastojci
ADD CONSTRAINT R_12 FOREIGN KEY (idR) REFERENCES Recepti (idR);

ALTER TABLE Zahtev
ADD CONSTRAINT R_4 FOREIGN KEY (idK) REFERENCES Admin (idK);
