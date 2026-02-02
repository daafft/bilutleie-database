CREATE TABLE `extrautstyr_id` (
  `ekstrautstyr_id` CHAR(50),
  `navn` VARCHAR(100) NOT NULL UNIQUE,
  `dagspris` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ekstrautstyr_id`)
);

CREATE TABLE `ansatt` (
  `ansatt_id` CHAR(50),
  `navn` VARCHAR (255) NOT NULL,
  `epost` VARCHAR (255) NOT NULL UNIQUE,
  PRIMARY KEY (`ansatt_id`),
  KEY `AK` (`epost`)
);

CREATE TABLE `bil` (
  `bil_id` INT NOT NULL,
  `registreringsnummer` VARCHAR (255) NOT NULL UNIQUE,
  `merke` VARCHAR (255) NOT NULL,
  `modell` VARCHAR (255) NOT NULL,
  `årsmodell` SMALLINT NOT NULL,
  `dagspris` DECIMAL(10,2) NOT NULL,
  `registrert_av` CHAR(50),
  `registrert_tid` INT,
  `Oppdatert_tid` INT,
  PRIMARY KEY (`bil_id`),
  FOREIGN KEY (`registrert_av`)
      REFERENCES `ansatt`(`ansatt_id`),
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
  `leieavtale_id` CHAR(50),
  `kunde_id` CHAR(50),
  `bil_id` INT NOT NULL,
  `laget_av` CHAR(50),
  `startdato` DATE NOT NULL,
  `sluttdato` DATE NOT NULL,
  `total_pris` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`leieavtale_id`),
  FOREIGN KEY (`bil_id`)
      REFERENCES `bil`(`bil_id`),
  FOREIGN KEY (`kunde_id`)
      REFERENCES `kunde`(`kunde_id`),
  FOREIGN KEY (`laget_av`)
      REFERENCES `ansatt`(`ansatt_id`)
);

CREATE TABLE `leieavtale_extrautstyr` (
  `leie_id` CHAR(50),
  `ekstrautstyr` CHAR(50),
  PRIMARY KEY (`leie_id`, `ekstrautstyr`),
  FOREIGN KEY (`ekstrautstyr`)
      REFERENCES `extrautstyr_id`(`ekstrautstyr_id`),
  FOREIGN KEY (`leie_id`)
      REFERENCES `leieavtale`(`leieavtale_id`)
);

