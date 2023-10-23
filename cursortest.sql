create database etudiantse;
use etudiantse;
create table etudiant(
numero int primary key auto_increment,
nom char(15) ,
prenom char(15),
sexe char,
filiere char(20));
insert into etudiant values(1,'El jadid','Khadija','F','DD');
insert into etudiant values(11,'Meski','Amal','F','DD');
insert into etudiant values(111,'Koukhou','Badr','M','GE');
insert into etudiant values(1111,'Semman','Asmae','F','ID');
delimiter $
create procedure sp_curseur2()
begin
declare v_num int;
declare v_nom char(15);
declare v_prenom char(15);
test;
declare v_sexe char;
declare fin boolean default 0;
declare c_etudiants cursor for
select numero,nom,prenom, sexe from etudiant;
declare continue handler for not found set fin=1;
create temporary table t_etudiant(
numero int, nom char(15), prenom char(15) ,sexe char);
open c_etudiants;
fetch c_etudiants into v_num,v_nom, v_prenom, v_sexe;
while not fin do
if v_sexe='F' then
insert into t_etudiant values(v_num,lower(v_nom),upper(v_prenom), 'F');
else
insert into t_etudiant values(v_num,upper(v_nom),lower(v_prenom), 'M');
end if;
fetch c_etudiants into v_num,v_nom, v_prenom, v_sexe;
end while;
close c_etudiants;
select * from t_etudiant;
drop temporary table t_etudiant;
end $
delimiter ;
call sp_curseur2();