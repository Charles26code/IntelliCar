\c transvar

-- Suppression de la base existante

DROP TABLE IF EXISTS Personne CASCADE;
DROP TABLE IF EXISTS Abonnement CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS Bus CASCADE;
DROP TABLE IF EXISTS Conducteur CASCADE;
DROP TABLE IF EXISTS Station CASCADE;
DROP TABLE IF EXISTS Ligne CASCADE;
DROP TABLE IF EXISTS StationLigne CASCADE;
DROP TABLE IF EXISTS Parcours CASCADE;

-- Création de la structure de la base (tables)

CREATE TABLE Personne (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    codePostal VARCHAR(5) NOT NULL
);

CREATE TABLE Abonnement (
    id SERIAL PRIMARY KEY NOT NULL,
    intitule VARCHAR(50) NOT NULL,
    tarif integer NOT NULL,
    ageMin INTEGER NOT NULL,
    ageMax INTEGER NOT NULL,
    dureeValidite INTEGER NOT NULL,
    CHECK (dureeValidite > 0)
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY NOT NULL,
    dateNaissance DATE NOT NULL,
    idAbonnement INTEGER NOT NULL,
    idPersonne INTEGER NOT NULL,
    FOREIGN KEY (idAbonnement)
        REFERENCES Abonnement (id),
    FOREIGN KEY (idPersonne)
        REFERENCES Personne (id)
            ON DELETE CASCADE
);

CREATE TABLE Bus (
    id SERIAL PRIMARY KEY NOT NULL,
    marque VARCHAR(50) NOT NULL,
    immatriculation VARCHAR(50) NOT NULL,
    nbPlaces INTEGER NOT NULL,
    idConducteur INTEGER,
    CHECK (nbPlaces > 0)
);

CREATE TABLE Conducteur (
    id SERIAL PRIMARY KEY NOT NULL,
    salaire REAL NOT NULL,
    dateEmbauche DATE NOT NULL,
    idBus INTEGER,
    idPersonne INTEGER NOT NULL,
    FOREIGN KEY (idBus)
        REFERENCES Bus (id),
    FOREIGN KEY (idPersonne)
        REFERENCES Personne (id)
            ON DELETE CASCADE,
    CHECK (salaire >= 1539.42)
);

ALTER TABLE Bus ADD CONSTRAINT fk_bus_conducteur FOREIGN KEY (idConducteur) REFERENCES Conducteur (id) MATCH FULL;

CREATE TABLE Station (
    id SERIAL PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    geolocalisation VARCHAR(50) NOT NULL
);

CREATE TABLE Ligne (
    id SERIAL PRIMARY KEY NOT NULL,
    numero VARCHAR(5) NOT NULL,
    stationDepart INTEGER NOT NULL,
    stationTerminus INTEGER NOT NULL,
    nbKilometres INTEGER NOT NULL,
    dureeTotale INTEGER NOT NULL,
    FOREIGN KEY (stationDepart)
        REFERENCES Station (id),
    FOREIGN KEY (stationTerminus)
        REFERENCES Station (id),
    CHECK (nbKilometres > 0),
    CHECK (dureeTotale > 0)
);

CREATE TABLE StationLigne (
    idLigne INTEGER NOT NULL,
    idStation INTEGER NOT NULL,
    PRIMARY KEY (idLigne, idStation),
    FOREIGN KEY (idLigne)
        REFERENCES LIGNE (id)
        ON DELETE CASCADE,
    FOREIGN KEY (idStation)
        REFERENCES STATION (id)
        ON DELETE CASCADE
);

CREATE TABLE Parcours (
    id SERIAL PRIMARY KEY NOT NULL,
    depart DATE NOT NULL,
    idConducteur INTEGER NOT NULL,
    idLigne INTEGER NOT NULL,
    FOREIGN KEY (idConducteur)
        REFERENCES Conducteur (id)
        ON DELETE CASCADE,
    FOREIGN KEY (idLigne)
        REFERENCES Ligne (id)
        ON DELETE CASCADE
);

-- Création des fonctions et des vues

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Station_par_ligne(idLigneSearch INTEGER)
RETURNS SETOF INTEGER
LANGUAGE plpgsql
AS $$
    DECLARE
        station INTEGER;
    BEGIN
        FOR station IN SELECT idStation FROM StationLigne WHERE idLigne = idLigneSearch
            LOOP
                RETURN NEXT station;
            END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION Ligne_par_Station(idStationSearch INTEGER)
RETURNS SETOF INTEGER
LANGUAGE plpgsql
AS $$
    DECLARE
        ligne INTEGER;
    BEGIN
        FOR ligne IN SELECT idLigne FROM StationLigne WHERE idStation = idStationSearch
            LOOP
                RETURN NEXT ligne;
            END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION Bus_non_affecte()
    RETURNS SETOF INTEGER
    LANGUAGE plpgsql
AS $$
DECLARE
    bus INTEGER;
BEGIN
    FOR bus IN SELECT id FROM Bus WHERE idconducteur IS NULL
        LOOP
            RETURN NEXT bus;
        END LOOP;
END;
$$;

CREATE OR REPLACE FUNCTION Nombre_parcours_ligne_entre(dateDebutSearch DATE, dateFinSearch DATE, idLigneSearch INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
    DECLARE
        nbParcours INTEGER;
    BEGIN
        SELECT COUNT(*) INTO nbParcours
        FROM Parcours
        WHERE idLigne = idLigneSearch AND depart BETWEEN dateDebutSearch AND dateFinSearch;

        RETURN nbParcours;
    END;
$$;

-- Création des fonctions pour triggers

CREATE OR REPLACE FUNCTION Affectation_bus_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    DECLARE
        idBusDisp INTEGER;
    BEGIN
        SELECT id INTO idBusDisp
        FROM Bus
        WHERE idConducteur IS NULL
        LIMIT 1;

        RAISE NOTICE '%', idBusDisp;

        IF idBusDisp IS NOT NULL THEN
            UPDATE Conducteur SET idBus = idBusDisp WHERE id = NEW.id;
            UPDATE Bus SET idConducteur = NEW.id WHERE id = idBusDisp;
        END IF;

        RETURN NEW;
    END
$$;

CREATE OR REPLACE FUNCTION Age_verification_abonnement_client()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    DECLARE
        age_client INTEGER;
        date_naissance_client DATE;
        age_min_abonnement INTEGER;
        age_max_abonnement INTEGER;
    BEGIN
        IF tg_op = 'UPDATE' THEN
            SELECT dateNaissance INTO date_naissance_client
            FROM Client
            WHERE id = NEW.id;
        ELSE
            date_naissance_client = NEW.datenaissance;
        END IF;

        SELECT agemin, ageMax
        INTO age_min_abonnement, age_max_abonnement
        FROM Abonnement
        WHERE id = NEW.idabonnement;

        age_client = (current_date - date_naissance_client) / 365;

        IF(age_client NOT BETWEEN age_min_abonnement AND age_max_abonnement) THEN
            RAISE EXCEPTION 'L"abonnement n"est pas valide pour cette tranche d"age';
        END IF;

        RAISE NOTICE 'OK';

        RETURN NEW;
    END
$$;

CREATE OR REPLACE FUNCTION Suppression_Bus_Conducteur()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    conducteurLie INTEGER;
BEGIN
    SELECT id INTO conducteurLie
    FROM Conducteur
    WHERE idBus = OLD.id;

    IF conducteurLie IS NOT NULL THEN
        UPDATE Conducteur SET idBus = NULL WHERE id = conducteurLie;
    END IF;

    RETURN OLD;
END
$$;

CREATE OR REPLACE FUNCTION Suppression_Conducteur_Bus()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    busLie INTEGER;
BEGIN
    SELECT id INTO busLie
    FROM Bus
    WHERE idConducteur = OLD.id;

    IF busLie IS NOT NULL THEN
        UPDATE Bus SET idConducteur = NULL WHERE id = busLie;
    END IF;

    RETURN OLD;
END
$$;

CREATE OR REPLACE FUNCTION MAJ_Conducteur_Bus()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    busLie INTEGER;
BEGIN
    SELECT id INTO busLie
    FROM Bus
    WHERE idConducteur = OLD.id;

    IF busLie IS NOT NULL THEN
        UPDATE Bus SET idConducteur = NULL WHERE id = busLie;
        UPDATE Bus SET idConducteur = NEW.id WHERE id = NEW.idbus;
    ELSE
        UPDATE Bus SET idConducteur = NEW.id WHERE id = NEW.idbus;
    END IF;

    RETURN NEW;
END
$$;

CREATE OR REPLACE FUNCTION Suppression_Station()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS
$$
DECLARE
    ligneLie INTEGER;
    numeroLigne INTEGER;
BEGIN
    SELECT id, numero INTO ligneLie, numeroLigne
    FROM ligne
    WHERE stationDepart = OLD.id OR stationTerminus = OLD.id;


    IF ligneLie IS NOT NULL THEN
        RAISE EXCEPTION 'Cette station est toujours affectée en tant que départ ou terminus à la ligne %. Veuillez effectuer les modifications nécessaires avant de la supprimer.', numeroLigne;
    END IF;

    RETURN OLD;
END
$$;

-- Création des triggers

CREATE TRIGGER Affectation_bus_trigger
    AFTER INSERT ON Conducteur
    FOR EACH ROW
    EXECUTE FUNCTION Affectation_bus_update();

CREATE TRIGGER Age_verification_abonnement_client_trigger
    BEFORE INSERT OR UPDATE ON Client
    FOR EACH ROW
    EXECUTE FUNCTION Age_verification_abonnement_client();

CREATE TRIGGER Suppression_Bus_Conducteur_trigger
    BEFORE DELETE ON Bus
    FOR EACH ROW
    EXECUTE FUNCTION Suppression_Bus_Conducteur();

CREATE TRIGGER Suppression_Conducteur_Bus_trigger
    BEFORE DELETE ON Conducteur
    FOR EACH ROW
    EXECUTE FUNCTION Suppression_Conducteur_Bus();

CREATE TRIGGER MAJ_Conducteur_Bus_trigger
    BEFORE UPDATE ON Conducteur
    FOR EACH ROW
    EXECUTE FUNCTION MAJ_Conducteur_Bus();

CREATE TRIGGER Suppression_Station_trigger
    BEFORE DELETE ON Station
    FOR EACH ROW
    EXECUTE FUNCTION Suppression_Station();

-- Insertion de données de test et validation du fonctionnement de la base

INSERT INTO Abonnement(intitule, tarif, ageMin, ageMax, dureeValidite) VALUES ('JEUNE', 20, 0, 25, 365);
INSERT INTO Abonnement(intitule, tarif, ageMin, ageMax, dureeValidite) VALUES ('ADULTE', 50, 26, 50, 365);

INSERT INTO Personne(nom, prenom, ville, codePostal) VALUES ('DUPONT', 'Rémi', 'La Garde', '83130');
INSERT INTO Personne(nom, prenom, ville, codePostal) VALUES ('MARTIN', 'Charles', 'Toulon', '83000');
INSERT INTO Personne(nom, prenom, ville, codePostal) VALUES ('VUITON', 'Ludovic', 'Le Pradet', '83130');
INSERT INTO Personne(nom, prenom, ville, codePostal) VALUES ('DUPONT', 'Charles', 'Toulon', '83000');

INSERT INTO Bus(marque, immatriculation, nbPlaces, idConducteur) VALUES ('MERCEDES', 'CB-907-D5', 50, NULL);
INSERT INTO Bus(marque, immatriculation, nbPlaces, idConducteur) VALUES ('RENAULT', 'CB-237-D5', 100, NULL);

INSERT INTO Conducteur(salaire, dateEmbauche, idBus, idPersonne) VALUES (1600.0, '2001-09-28 01:00:00', NULL, 1);
INSERT INTO Conducteur(salaire, dateEmbauche, idBus, idPersonne) VALUES (1700.0, '2001-08-28 01:00:00', NULL, 2);

--UPDATE Conducteur SET idBus = 2 WHERE id = 1;
--UPDATE Conducteur SET idBus = 1 WHERE id = 2;

INSERT INTO Client(dateNaissance, idAbonnement, idPersonne) VALUES ('1980-08-02', 2, 3);
INSERT INTO Client(dateNaissance, idAbonnement, idPersonne) VALUES ('1970-08-02', 2, 4);

INSERT INTO Station (nom, geolocalisation) VALUES ('COUPIANE', '43.13181237900592');
INSERT INTO Station (nom, geolocalisation) VALUES ('BEAUCAIRE', '5.9778850585937615');
INSERT INTO Station (nom, geolocalisation) VALUES ('REVEST', '43.131815675592');
INSERT INTO Station (nom, geolocalisation) VALUES ('RIPELLE', '5.565785937615');

INSERT INTO Ligne (numero, stationDepart, stationTerminus, nbKilometres, dureeTotale) VALUES (55, 1, 2, 27, 75);
INSERT INTO Ligne (numero, stationDepart, stationTerminus, nbKilometres, dureeTotale) VALUES (11, 3, 4, 12, 27);

INSERT INTO StationLigne(idLigne, idStation) VALUES (1, 1);
INSERT INTO StationLigne(idLigne, idStation) VALUES (1, 2);
INSERT INTO StationLigne(idLigne, idStation) VALUES (2, 1);
INSERT INTO StationLigne(idLigne, idStation) VALUES (2, 2);

INSERT INTO Parcours (depart, idConducteur, idLigne) VALUES ('2020-11-19 21:52:00', 1, 1);
INSERT INTO Parcours (depart, idConducteur, idLigne) VALUES ('2020-11-19 22:52:00', 2, 1);