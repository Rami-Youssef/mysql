CREATE DATABASE remource;

use remource;

CREATE TABLE Salarie (
    matricule INT PRIMARY key AUTO_INCREMENT, 
    nom char(25), 
    prenom char(25), 
    echelle INT, 
    email char(25), 
    password char(25)
    );

create TABLE Deplacement (
    id_deplacement INT PRIMARY KEY AUTO_INCREMENT, 
    date_debut date, 
    date_fin date, 
    kilometrage INT, 
    matricule INT,
    Foreign Key (matricule) REFERENCES Salarie(matricule)
    );

create TABLE Charge (
    id_charge INT PRIMARY KEY AUTO_INCREMENT, 
    libelle char(25), 
    montant DECIMAL(25), 
    date_charge date, 
    id_deplacement INT,
    Foreign Key (id_deplacement) REFERENCES Deplacement(id_deplacement)
    );

INSERT INTO Salarie(nom, prenom , echelle, email, password) 
VALUES("yassin","amsasn",1,"yassin@gmail.com","yassin");

CREATE view afficher(nom ,prenom, echelle, grade)
as SELECT nom , prenom , echelle ,
CASE 
    WHEN echelle<6 THEN "Maitrise"
    WHEN 6<echelle<9 THEN "Maitrise principale"
    WHEN 9<echelle THEN "Cadre"
END as grade from Salarie;

DELIMITER $
CREATE Procedure ajouter(p_date_debut date, p_date_fin date, p_kilometrage int, p_matricule int)
BEGIN
DECLARE test BOOLEAN DEFAULT 0;
set autocommit=0;
start TRANSACTION;
INSERT into Deplacement ( date_debut, date_fin, kilometrage, matricule)
VALUES (p_date_debut , p_date_fin , p_kilometrage, p_matricule );
if p_kilometrage>5 and p_date_debut<p_date_fin
then COMMIT;
ELSE ROLLBACK;
end if;
set autocommit=1;
end $
DELIMITER ;
DELIMITER $
CREATE Procedure ajouter_charge(libelle char(25), montant DECIMAL(10,4), date_charge date, id_deplacement INT)
BEGIN
DECLARE p_date_debut date;
DECLARE p_date_fin date;
DECLARE p_Salarie int;
declare somme DECIMAL(10,2);
set somme= SELECT SUM(montant) from Charge as Ch join Deplacement as D on Ch.id_deplacement= D.id_deplacement;
set p_Salarie= SELECT matricule from Deplacement where id_deplacement= p_id_deplacement;
set p_date_debut= SELECT date_debut from Deplacement where id_deplacement = p_id_deplacement;
set p_date_debut= SELECT date_fin from Deplacement where id_deplacement = p_id_deplacement;
set autocommit=0;
start TRANSACTION;
INSERT into Charge (libelle, montant, date_charge, id_deplacement)
VALUES(p_libelle, p_montant, p_date_charge, p_id_deplacement);
if date_charge BETWEEN(p_date_debut,p_date_debut)




