CREATE TABLE `extrautstyr` (
  `leieavtale_id` INT,
  `ekstrautstyr_id` INT,
  `navn` VARCHAR(100) NOT NULL UNIQUE,
  `dagspris` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ekstrautstyr_id`, `navn`, `dagspris`)
);

CREATE TABLE `leieavtale_extrautstyr` (
  `leieavtale_id` INT,
  `ekstrautstyr_id` INT,
  `antall` INT NOT NULL,
  PRIMARY KEY (`antall`),
  FOREIGN KEY (`leieavtale_id`)
      REFERENCES `extrautstyr`(`leieavtale_id`)
);

CREATE TABLE `biler` (
  `bil_id` INT NOT NULL,
  `registreringsnummer` VARCHAR (255) NOT NULL UNIQUE,
  `merke` VARCHAR (255) NOT NULL,
  `modell` VARCHAR (255) NOT NULL,
  `årsmodell` SMALLINT NOT NULL,
  `dagspris` DECIMAL(10,2) NOT NULL,
  `kunde_id` INT NOT NULL,
  PRIMARY KEY (`merke`, `modell`, `årsmodell`)
);

CREATE TABLE `Dokumentasjon` (
  `leieavtale_id` INT,
  `kunde_id` INT NOT NULL,
  `bil_id` INT NOT NULL,
  `registreringsnummer` VARCHAR (255) NOT NULL UNIQUE,
  `startdato` DATE NOT NULL,
  `sluttdato` DATE NOT NULL,
  `total pris` DECIMAL(10,2) NOT NULL,
  `ansatt_id` INT NOT NULL,
  PRIMARY KEY (`ansatt_id`)
);

CREATE TABLE `bilutleiefirmaet` (
  `bil_id` INT NOT NULL,
  `registreringsnummer` VARCHAR (255) NOT NULL UNIQUE,
  `ansatt_id` INT NOT NULL,
  PRIMARY KEY (`bil_id`, `registreringsnummer`)
);

CREATE TABLE `Ansatt` (
  `tlf` VARCHAR (255) NOT NULL,
  `e-post` VARCHAR (255) NOT NULL UNIQUE,
  `navn` VARCHAR (255) NOT NULL,
  `ansatt_id` INT NOT NULL,
  `kunde_id` INT NOT NULL,
  PRIMARY KEY (`tlf`, `e-post`, `navn`),
  FOREIGN KEY (`ansatt_id`)
      REFERENCES `Dokumentasjon`(`ansatt_id`),
  FOREIGN KEY (`kunde_id`)
      REFERENCES `bilutleiefirmaet`(`ansatt_id`)
);

CREATE TABLE `kunde` (
  `kunde_id` INT NOT NULL,
  `tlf` VARCHAR (255) NOT NULL,
  `e-post` VARCHAR (255) NOT NULL UNIQUE,
  `navn` VARCHAR (255) NOT NULL,
  PRIMARY KEY (`kunde_id`),
  FOREIGN KEY (`kunde_id`)
      REFERENCES `Ansatt`(`kunde_id`)
);

CREATE TABLE `leieavtale` (
  `leieavtale_id` INT,
  `kunde_id` INT NOT NULL,
  `bil_id` INT NOT NULL,
  `registreringsnummer` VARCHAR (255) NOT NULL UNIQUE,
  `startdato` DATE NOT NULL,
  `sluttdato` DATE NOT NULL,
  `total pris` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`leieavtale_id`, `startdato`, `sluttdato`, `total pris`),
  FOREIGN KEY (`kunde_id`)
      REFERENCES `biler`(`kunde_id`),
  FOREIGN KEY (`leieavtale_id`)
      REFERENCES `Dokumentasjon`(`leieavtale_id`)
);

