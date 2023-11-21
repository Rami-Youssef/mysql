create database plsql;
use plsql;
create table Salarie (
    matricule  INT PRIMARY key AUTO_INCREMENT, 
    nom char(25), 
    prenom char(25), 
    echelle char(25), 
    email char(25), 
    password char(25)
);
create table Deplacement (
    id_deplacement INT PRIMARY key AUTO_INCREMENT, 
    date_debut date, 
    date_fin date, 
    kilometrage char(25), 
    matricule  INT,
    Foreign Key (matricule) REFERENCES Salarie(matricule)
);
CREATE Table Charge(
    id_charge INT PRIMARY key AUTO_INCREMENT,
    libelle char(25), 
    montant decimal(10,4), 
    date_charge date, 
    id_deplacement INT,
    Foreign Key (id_deplacement) REFERENCES Deplacement(id_deplacement)
);
INSERT INTO Salarie( nom, prenom , echelle, email, password)
values("Rami","youssef",12,"ramiyoussef",111),("uhhio","yousshgef",6,"raumiyoussef",22),("1soj","hioda",2,"ahha",1);
-------------------------------------------------------------------------
create view v_salarie
AS
SELECT  nom, prenom , echelle,CASE 
    WHEN echelle<6 THEN  "Maitrise"
    WHEN echelle BETWEEN 6 AND 9 THEN "Maitrise principale"
    ELSE  "Cadre"
END as "grade"
from Salarie;
select * from v_salarie;
-------------------------------------------------------------------------
DELIMITER $
create Procedure v_Deplacement(
    p_date_debut date, p_date_fin date, p_kilometrage INT, p_matricule INT
)
BEGIN


