create database lts;
use lts;
create table Salarie (
    matricule int PRIMARY key AUTO_INCREMENT, 
    nom char(25), 
    prenom char(25), 
    echelle char(25), 
    email char(25), 
    password char(25)
    );
create table Deplacement (
    id_deplacement int PRIMARY key AUTO_INCREMENT, 
    date_debut date, 
    date_fin date, 
    kilometrage int, 
    matricule int,
    foreign key(matricule) references Salarie(matricule)
    );
CREATE table Charge (
    id_charge int PRIMARY key AUTO_INCREMENT, 
    libelle char(25), 
    montant char(25), 
    date_charge date, 
    id_deplacement int,
    foreign key(id_deplacement) REFERENCES Deplacement(id_deplacement)
    );

