\c BDD


DROP TABLE IF EXISTS CLIENT CASCADE;
DROP TABLE IF EXISTS CONTRAT CASCADE;
DROP TABLE IF EXISTS FACTURE CASCADE;
DROP TABLE IF EXISTS VEHICULE CASCADE;
DROP TABLE IF EXISTS MODELE CASCADE;
DROP TABLE IF EXISTS OPTION CASCADE;
DROP TABLE IF EXISTS VEHICULE_OPTION CASCADE;

CREATE TABLE CLIENT (
                          IdClient INT PRIMARY KEY NOT NULL,
                          Nom VARCHAR(50) NOT NULL,
                          Prenom VARCHAR(50) NOT NULL,
                          Tel INT NOT NULL,
                          Mail VARCHAR(50) NOT NULL,
                          Adresse VARCHAR(50) NOT NULL,
);

CREATE TABLE CONTRAT (
                            IdContrat  INT PRIMARY KEY NOT NULL,
                            Date DATE NOT NULL,
                            Type VARCHAR(20) NOT NULL,
                            Duree VARCHAR(50) NOT NULL,
                            IdClient INT PRIMARY KEY NOT NULL,
                            Immatriculation VARCHAR(9) NOT NULL,
                            FOREIGN KEY (IdClient)
                                REFERENCES CLIENT(IdClient),
                            FOREIGN KEY (Immatriculation)
                                REFERENCES VEHICULE(Immatriculation)

);

CREATE TABLE FACTURE (
                        IdFacture INT PRIMARY KEY NOT NULL,
                        Prix DATE NOT NULL,
                        DateFacture INTEGER NOT NULL,
                        IdContrat INTEGER NOT NULL,
                        FOREIGN KEY (IdContrat)
                            REFERENCES CONTRAT (IdContrat)

);

CREATE TABLE VEHICULE (
                        Immatriculation VARCHAR(9) PRIMARY KEY NOT NULL,
                        IdModele INT NOT NULL,
                        FOREIGN KEY (IdModele)
                            REFERENCES MODELE (IdModele)

);

CREATE TABLE MODELE (
                            IdModele INT PRIMARY KEY NOT NULL,
                            Marque VARCHAR(50) NOT NULL,
                            Immatriculation VARCHAR(9) NOT NULL,
                            FOREIGN KEY (Immatriculation)
                                REFERENCES VEHICULE (Immatriculation)

);

CREATE TABLE OPTION (
                         IdOption INT PRIMARY KEY NOT NULL,
                         Key VARCHAR(50) NOT NULL,
                         Value VARCHAR(50) NOT NULL,
                         Type INT NOT NULL
);

CREATE TABLE VEHICULE_OPTION (
                         IdOption INT PRIMARY KEY NOT NULL,
                         Immatriculation VARCHAR(9) NOT NULL,
                         FOREIGN KEY (Immatriculation)
                            REFERENCES VEHICULE (Immatriculation),
                         FOREIGN KEY (IdOption)
                             REFERENCES OPTION (IdOption)


)