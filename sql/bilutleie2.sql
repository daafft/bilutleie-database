CREATE TABLE Kunde (
  KundeID INT AUTO_INCREMENT PRIMARY KEY,
  Navn VARCHAR(255) NOT NULL,
  Tlf VARCHAR(20),
  Epost VARCHAR(255)
);

CREATE TABLE Biler (
  Registreringsnummer VARCHAR(20) PRIMARY KEY,
  Merke VARCHAR(100),
  Modell VARCHAR(100),
  Arsmodell INT,
  Dagspris INT
);

CREATE TABLE Leie_avtale (
  AvtaleID INT AUTO_INCREMENT PRIMARY KEY,
  KundeID INT,
  Registreringsnummer VARCHAR(20),
  Startdato DATE,
  Sluttdato DATE,
  Total_pris INT,
  FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
  FOREIGN KEY (Registreringsnummer) REFERENCES Biler(Registreringsnummer)
);