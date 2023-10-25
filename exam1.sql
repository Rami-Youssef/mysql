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
as SELECT nom , prenom , echelle 

