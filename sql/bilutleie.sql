CREATE TABLE `bilutleiefirmaet` (
  `Bil` PK
);

CREATE TABLE `Leie avtale` (
  `kunde` varchar (255),
  `bil` varchar (255),
  `startdato` DATE,
  `sluttdato` DATE,
  `total pris` Int
);

CREATE TABLE `Kunde` (
  `Navn` PK,
  `Tlf` Int,
  `E-post` varchar (255)
);

CREATE TABLE `Biler` (
  `registreringsnummer` Int,
  `merke` varchar (255),
  `modell` varchar (255),
  `årsmodell` varchar (255),
  `dagspris` Int
);

