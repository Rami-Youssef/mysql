create database etudiants;
use etudiants;
create table filiere(
idFiliere int primary key auto_increment,
libelle char(15),
nbrPlaces int);
create table etudiant(
numero int primary key auto_increment,
nom char(15),
prenom char(15),
moyenneBac decimal(4,2),
idFiliere int,
foreign key(idFiliere) references filiere(idFiliere));
delimiter $
create procedure sp_add_fil(p_libelle char(15),p_nbrPlaces int)
begin
insert into filiere(libelle,nbrPlaces) values(p_libelle,p_nbrPlaces);
end $
delimiter ;
call sp_add_fil('AA',66);
delimiter $
create procedure sp_add_etud(p_nom char(15),p_prenom char(15),
p_moyenneBac decimal,p_idFiliere int)
begin
insert into etudiant(nom,prenom ,moyenneBac ,idFiliere )
values(p_nom ,p_prenom, p_moyenneBac ,p_idFiliere);
end $
delimiter ;
call sp_add_etud('Guennaoui','Othmane',10,2);
call sp_add_etud('Bouhafass','Mehdi',12.1,2);
call sp_add_etud('Toubani','Badr eddine',18.7,1);
call sp_add_etud('Bouga','Nabil',15.03,1);
select * from etudiant;
SELECT nom ,prenom ,moyenneBac,
case
WHEN moyenneBac = 10 the "moy"