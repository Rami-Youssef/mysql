#ex1
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
#2
INSERT into salarie(nom, prenom , echelle, email, password)
values("amine","bdu",8,"amine@gmail.com","amine");

#3
create view affiche_Salarie
as select  nom, prenom , echelle,
CASE 
    when  echelle>9 then "Cadre"
    when echelle between 6 and 9 then "Maitrise principale "
    else "Maitrise"
END
as grade from Salarie;


select * from affiche_Salarie;

#4
delimiter $
create procedure ajouter_Deplacement(
    p_date_debut date, 
    p_date_fin date,
    p_kilometrage int, 
    p_matricule int
)
BEGIN
declare v_date date;
set v_date= DATEDIFF(p_date_fin,p_date_debut);
if p_date_fin > p_date_debut and p_kilometrage>50 THEN
    insert into Deplacement(date_debut, date_fin, kilometrage, matricule)
    VALUES(p_date_debut, p_date_fin, p_kilometrage, p_matricule);
else SELECT "nah bruh" as "error message";
end if;
end$
call ajouter_Deplacement("20030101","20040101",20,2)

#5
delimiter $
create procedure  ajouter_charge(p_libelle int, montant decimal(10,2), p_date_charge date, p_id_deplacement int)
BEGIN

declare v_echelle int;
SELECT s.echelle into v_echelle from Salarie as s join Deplacement as D on s.matricule=D.matricule where id_deplacement=p_id_deplacement;


