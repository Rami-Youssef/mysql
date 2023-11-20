create DATABASE procedure1;
use procedure1;
create table Adhrent(
    numero int primary key AUTO_INCREMENT, 
    nom char(25), 
    prenom char(24), 
    email char(24), 
    date_inscription date
    );
create table Livre(
    id_livre int PRIMARY key AUTO_INCREMENT, 
    titre char(25), 
    auteur char(25), 
    disponible BOOLEAN
    );
create table Emprunt(
    id_emprunt int primary key AUTO_INCREMENT,
    numero_adherent int,
    id_livre int,
    date_emprunt date,
    date_rendu date,
    Foreign Key (numero_adherent) REFERENCES Adhrent(numero),
    Foreign Key (id_livre) REFERENCES Livre(id_livre)
    );
/*insert into Adherent values(1,"rami","youssef","rami@h",20211010),;*/
DELIMITER $
CREATE procedure p_Adhrent(
    p_nom char(25),
    p_prenom chAR(25),
    p_email char(25)
)
BEGIN
insert into adhrent(nom,prenom,email,date_inscription)
values(p_nom ,p_prenom, p_email, now());

end $
delimiter;