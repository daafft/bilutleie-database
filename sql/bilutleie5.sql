CREATE TABLE `extrautstyr_id` (
  `id` CHAR(50),
  `navn` VARCHAR(100) NOT NULL UNIQUE,
  `dagspris` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Ansatt` (
  `id` CHAR(50),
  `navn` VARCHAR (255) NOT NULL,
  `epost` VARCHAR (255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`),
  KEY `AK` (`epost`)
);

CREATE TABLE `biler` (
  `bil_id` INT NOT NULL,
  `registreringsnummer` VARCHAR (255) NOT NULL UNIQUE,
  `merke` VARCHAR (255) NOT NULL,
  `modell` VARCHAR (255) NOT NULL,
  `årsmodell` SMALLINT NOT NULL,
  `dagspris` DECIMAL(10,2) NOT NULL,
  `registrert_av` CHAR(50),
  `registrert_tid` INT,
  `Oppdatert_tid` INT,
  PRIMARY KEY (`bil_id`, `registrert_av`, `registrert_tid`, `Oppdatert_tid`),
  FOREIGN KEY (`registrert_av`)
      REFERENCES `Ansatt`(`id`),
  KEY `AK` (`registreringsnummer`)
);

CREATE TABLE `kunde` (
  `kunde_id` CHAR(50),
  `navn` VARCHAR (255) NOT NULL,
  `epost` VARCHAR (255) NOT NULL UNIQUE,
  `tlf` VARCHAR (255) NOT NULL,
  PRIMARY KEY (`kunde_id`),
  KEY `AK` (`epost`)
);

CREATE TABLE `leieavtale` (
  `id` CHAR(50),
  `kunde_id` CHAR(50),
  `bil_id` CHAR(50),
  `leieavtale_id` INT,
  `laget_av` VARCHAR(255),
  `startdato` DATE NOT NULL,
  `sluttdato` DATE NOT NULL,
  `total_pris` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`, `leieavtale_id`, `laget_av`),
  FOREIGN KEY (`laget_av`)
      REFERENCES `biler`(`bil_id`),
  FOREIGN KEY (`kunde_id`)
      REFERENCES `kunde`(`kunde_id`),
  FOREIGN KEY (`bil_id`)
      REFERENCES `Ansatt`(`id`)
);

CREATE TABLE `leieavtale_extrautstyr` (
  `leie_id` CHAR(50),
  `ekstrautstyr` CHAR(50),
  PRIMARY KEY (`leie_id`, `ekstrautstyr`),
  FOREIGN KEY (`ekstrautstyr`)
      REFERENCES `extrautstyr_id`(`id`),
  FOREIGN KEY (`leie_id`)
      REFERENCES `leieavtale`(`id`)
);

