create database comptes;
use comptes;
create table client(
code int primary key auto_increment,
nom char(10),
prenom char(10));
insert into client values(1,'Bouga','Nabil');
insert into client values(3,null,'Khadija');
delimiter $
create procedure ajouter(p_nom char(25),p_prenom char(25))
Begin
declare exit handler for 1062 SELECT "duplicatio" as erreur;
INSERT INTO client(nom ,prenom) values(p_nom,p_prenom);
END $
DELIMITER ;
call ajouter('Bouga','Nabil');
SELECT * from clieNt
l