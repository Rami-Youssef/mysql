create DATABASE Projet;
use Projet;
CREATE Table Projet(
    id_projet INT PRIMARY key AUTO_INCREMENT,
    libelle char(25),
    date_debut date, 
    date_fin date
);
create table Salarie(
    matricule int primary key AUTO_INCREMENT,
    nom char(25), 
    prenom char(25), 
    sexe char(25), 
    salaire decimal(4,2), 
    departement char(25)
    );
create table Affectation(
    matricule INT, 
    id_projet INT, 
    date_affectation date,
    foreign key(matricule) references Salarie(matricule),
    foreign key(id_projet) references Projet(id_projet)
    );
delimiter $
CREATE procedure create_salarié(p_nom char(25), p_prenom char(25), p_sexe char(25), p_salaire decimal(6,6), p_departement char(25))
BEGIN
if p_salaire BETWEEN 3000 and 20000 THEN
insert INTO Salarie( nom, prenom, sexe, salaire, departement)
values( p_nom, p_prenom, p_sexe, p_salaire, p_departement);
else SELECT "erreur de salair" as erreur;
end IF;
end$
delimiter ;
drop procedure create_salarié;
call create_salarié("rami","yussef","M",6000,"DD");
delimiter $
create PROCEDURE create_projet(p_libelle char(25), p_date_debut date)
begin
declare p_date_fin date default null;
if p_date_debut <= now() THEN
INSERT INTO Projet (libelle, date_debut, date_fin)
values(p_libelle , p_date_debut,p_date_fin);
Else SELECT "date invalid" as error;
end if;
end$
DELIMITER ;
DELIMITER $
create procedure afficher()
BEGIN
DECLARE v_nom char(25);
DECLARE v_prenom char(25);
declare v_sexe char(25);
DECLARE fin boolean default 0;
declare curseur cursor for select nom,prenom,sexe from Salarie;
declare continue handler for not found set fin = 1;
create temporary table v_stagier(
    nom char(25),
    prenom char(25),
    sexe char(25)
);
open curseur;
fetch curseur into v_nom,v_prenom,v_sexe;
while fin=0 DO
if v_sexe='M' THEN
insert into v_stagier(nom,prenom,sexe)
values (upper(v_nom),lower(v_prenom),v_sexe);
else insert into v_stagier(nom,prenom,sexe)
values(lower(v_nom),upper(v_prenom),v_sexe);
end if;
fetch curseur into v_nom,v_prenom,v_sexe;
end while;
select * from v_stagier;
drop temporary table v_stagier;
close CURSeur;
END$
delimiter;

call afficher();
INSERT into Salarie (nom, prenom, sexe, salaire, departement) values('sel', 'jaw', 'F', 20000, 'legend');


