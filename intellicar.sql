

DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS contrats CASCADE;
DROP TABLE IF EXISTS factures CASCADE;
DROP TABLE IF EXISTS types_contrat CASCADE;
DROP TABLE IF EXISTS vehicules CASCADE;
DROP TABLE IF EXISTS modeles CASCADE;
DROP TABLE IF EXISTS options CASCADE;
DROP TABLE IF EXISTS vehicule_option CASCADE;


CREATE TABLE clients (
    c_id SERIAL PRIMARY KEY NOT NULL,
    c_nom VARCHAR(50) NOT NULL,
    c_prenom VARCHAR(50) NOT NULL,
    c_telephone VARCHAR(10) NOT NULL,
    c_mail VARCHAR(100) NOT NULL,
    c_adresse VARCHAR(150) NOT NULL,
    UNIQUE(c_mail)
);

CREATE TABLE modeles (
    m_id SERIAL PRIMARY KEY NOT NULL,
    m_marque VARCHAR(50) NOT NULL
);


CREATE TABLE vehicules (
    v_immatriculation VARCHAR(9) PRIMARY KEY NOT NULL,
    m_id SERIAL NOT NULL,
    FOREIGN KEY (m_id)
        REFERENCES modeles (m_id)

);

CREATE TABLE types_contrat (
    tc_id SERIAL PRIMARY KEY NOT NULL,
    tc_nom varchar(45) NOT NULL

);


CREATE TABLE contrats (
    co_id SERIAL PRIMARY KEY NOT NULL,
    co_date DATE NOT NULL,
    tc_id SERIAL NOT NULL,
    co_duree DATE NOT NULL,
    c_id SERIAL NOT NULL,
    v_immatriculation VARCHAR(9) NOT NULL,
    FOREIGN KEY (c_id)
        REFERENCES clients (c_id),
    FOREIGN KEY (v_immatriculation)
        REFERENCES vehicules (v_immatriculation),
    FOREIGN KEY (tc_id)
        REFERENCES types_contrat (tc_id)

);

CREATE TABLE factures (
    f_id SERIAL PRIMARY KEY NOT NULL,
    f_montant INT NOT NULL,
    co_id SERIAL NOT NULL,
    FOREIGN KEY (co_id)
        REFERENCES contrats (co_id)

);

CREATE TABLE options (
    o_id SERIAL PRIMARY KEY NOT NULL,
    o_cle VARCHAR(50) NOT NULL,
    o_valeur VARCHAR(50) NOT NULL,
    o_type INT NOT NULL
);

CREATE TABLE vehicule_option (
    o_id SERIAL NOT NULL,
    v_immatriculation VARCHAR(9) NOT NULL,
    FOREIGN KEY (v_immatriculation)
        REFERENCES vehicules (v_immatriculation),
    FOREIGN KEY (o_id)
        REFERENCES options (o_id)


);

-- insertion de données dans la table clients

INSERT INTO clients (c_id, c_nom, c_prenom, c_telephone, c_mail, c_adresse) VALUES (1,'DUPONT','PIERRE','0328010101','pierre.dupont@wanadoo.fr','15 Route des université');
INSERT INTO clients (c_id, c_nom, c_prenom, c_telephone, c_mail, c_adresse) VALUES (2,'DURAND','Jeannine','0328010102','jeannine.durand2@orange.fr','32 Route de toulon');
INSERT INTO clients (c_id, c_nom, c_prenom, c_telephone, c_mail, c_adresse) VALUES (3,'BISMUTH','PAUL','0328010103','paul.bismuth@gmail.fr','32 Route des cretes');
INSERT INTO clients (c_id, c_nom, c_prenom, c_telephone, c_mail, c_adresse) VALUES (4,'BERTHIER','CORRINE','0328010104','poney59@hotmail.fr','32 route des tests');
INSERT INTO clients (c_id, c_nom, c_prenom, c_telephone, c_mail, c_adresse) VALUES (5,'DUVIVIER','Jean Marie','0328010105','heyyyy@test.fr','32 route de la reunion');
INSERT INTO clients (c_id, c_nom, c_prenom, c_telephone, c_mail, c_adresse) VALUES (6,'TESTON','Claudette','0328010106','clocloxxx@outlook.fr','32 route des examens');

-- insertion de données dans la table modeles

INSERT INTO modeles (m_id, m_marque) VALUES (1,'Renault');
INSERT INTO modeles (m_id, m_marque) VALUES (2,'Peugeot');
INSERT INTO modeles (m_id, m_marque) VALUES (3,'Citroen');
INSERT INTO modeles (m_id, m_marque) VALUES (4,'Audi');
INSERT INTO modeles (m_id, m_marque) VALUES (5,'Mercedes');
INSERT INTO modeles (m_id, m_marque) VALUES (6,'BMW');
INSERT INTO modeles (m_id, m_marque) VALUES (7,'Ferrari');
INSERT INTO modeles (m_id, m_marque) VALUES (8,'Porshe');
INSERT INTO modeles (m_id, m_marque) VALUES (9,'Rover');
INSERT INTO modeles (m_id, m_marque) VALUES (10,'Fiat');
INSERT INTO modeles (m_id, m_marque) VALUES (11,'Hyundai');
INSERT INTO modeles (m_id, m_marque) VALUES (12,'Kia');



-- insertion de données dans la table vehicules

INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('ab-123-al',7);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('ac-123-al',7);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-aa',1);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ab',1);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ac',2);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ad',2);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ae',3);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-af',3);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ag',4);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ah',4);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ai',5);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-aj',5);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-ak',6);
INSERT INTO vehicules (v_immatriculation, m_id) VALUES ('aa-123-al',6);

-- insertion de données dans la table types_contrat

INSERT INTO types_contrat(tc_id, tc_nom) VALUES (1,'LOCATION'),(2,'VENTE');


-- insertion de données dans la table contrats

INSERT INTO contrats (co_id, co_date, tc_id, co_duree, c_id, v_immatriculation) VALUES (1,'2021-11-22',1,'2025-11-22',2,'aa-123-ab');
INSERT INTO contrats (co_id, co_date, tc_id, co_duree, c_id, v_immatriculation) VALUES (2,'2021-11-22',2,'2024-11-22',3,'aa-123-ac');
INSERT INTO contrats (co_id, co_date, tc_id, co_duree, c_id, v_immatriculation) VALUES (3,'2021-11-22',2,'2022-11-23',4,'aa-123-ad');
INSERT INTO contrats (co_id, co_date, tc_id, co_duree, c_id, v_immatriculation) VALUES (4,'2021-11-22',1,'2022-11-22',5,'aa-123-ae');
INSERT INTO contrats (co_id, co_date, tc_id, co_duree, c_id, v_immatriculation) VALUES (5,'2021-11-22',1,'2022-11-22',1,'aa-123-aa');

-- insertion de données dans la table factures

INSERT INTO factures (f_id, f_montant, co_id) VALUES (1,500,1);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (2,120,1);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (3,120,1);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (4,5000,2);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (5,10000,3);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (6,500,4);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (7,50,4);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (8,50,4);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (9,600,5);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (10,150,5);
INSERT INTO factures (f_id, f_montant, co_id) VALUES (11,150,5);

-- insertion de données dans la table options

INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (1,'BOITE','MANUELLE',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (2,'BOITE','AUTOMATIQUE',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (3,'MOTORISATION','110',0);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (4,'MOTORISATION','200',0);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (5,'MOTORISATION','50',0);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (6,'COULEUR','ROUGE',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (8,'COULEUR','BLEU',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (9,'COULEUR','JAUNE',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (10,'COULEUR','NOIR',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (11,'COULEUR','GRIS',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (12,'ENERGIE','DIESEL',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (13,'ENERGIE','ESSENCE',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (14,'ENERGIE','HYBRIDE',1);
INSERT INTO options(o_id, o_cle, o_valeur, o_type) VALUES (15,'ENERGIE','ELECTRIQUE',1);

-- insertion de données dans la table vehicule_option

INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (1,'aa-123-aa');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (3,'aa-123-aa');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (6,'aa-123-aa');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (13,'aa-123-aa');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (1,'aa-123-ab');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (13,'aa-123-ab');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (8,'aa-123-ab');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (3,'aa-123-ab');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (1,'aa-123-ac');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (5,'aa-123-ac');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (9,'aa-123-ac');
INSERT INTO vehicule_option(o_id, v_immatriculation) VALUES (15,'aa-123-ac');


-- requete de selection des options d'un vehicule donné

SELECT o_cle, o_valeur,o_type FROM options
LEFT JOIN vehicule_option ON vehicule_option.o_id = options.o_id
LEFT JOIN vehicules ON vehicules.v_immatriculation = vehicule_option.v_immatriculation
WHERE vehicules.v_immatriculation = 'aa-123-aa';