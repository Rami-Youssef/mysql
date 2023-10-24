create DATABASE livres;
use livres;
create table Livre (
    code int primary key auto_increment, 
    titre char(25), 
    langue char(25), 
    disponible boolean
    );

CREATE table Adherent (
    numero int PRIMARY key AUTO_INCREMENT, 
    nom char(25), 
    prenom char(25), 
    email char(25), 
    password char(32)
    );

create table Emprunt (
    numero int PRIMARY KEY AUTO_INCREMENT, 
    code_livre int, 
    numero_adherent int, 
    date_emprunt date, 
    date_rendu date,
    foreign key(code_livre) references Livre(code),
    Foreign Key (numero_adherent) REFERENCES Adherent(numero)
    );

DELIMITER $
CREATE procedure ajout_livres(p_titre char(25), p_langue char(25), p_disponible char(25))
BEGIN
insert into Livre(titre, langue, disponible)
values(p_titre, p_langue, p_disponible);
end$
DELIMITER;
call ajout_livres("shadow of mordor","english",1);

DELIMITER $
CREATE procedure ajout_Adherent(p_nom char(25), p_prenom char(25), p_email char(25), p_password char(32))
BEGIN
insert into Adherent(nom, prenom, email, password)
values(p_nom, p_prenom , p_email, p_password);
end$
DELIMITER ;
call ajout_Adherent("youssef","rami","rami@gmail.com","rami");

delimiter $
CREATE function pas_rendus(f_numero int)
RETURNS int
BEGIN
DECLARE number_rendus int;
SELECT count(*) into number_rendus from Emprunt where numero_adherent=f_numero AND date_rendu is NULL;
RETURN number_rendus;
end$
delimiter ;

delimiter $
CREATE procedure P_Emprunt(p_code_livre int, p_numero_adherent int)
begin
DECLARE p_date_emprunt date DEFAULT Now();
DECLARE p_date_rendu date DEFAULT Null;
DECLARE num int;
SELECT pas_rendus(p_numero_adherent) into num;
set autocommit=0;
start TRANSACTION;
INSERT into  Emprunt(numero, code_livre, numero_adherent, date_emprunt, date_rendu)
VALUES(p_code_livre, p_numero_adherent,p_date_emprunt,p_date_rendu);
If  num < 3 then
    if  EXISTS (SELECT * from Livre WHERE code=p_code_livre and disponible=1) THEN
    UPDATE Livre set disponible=0 where code=p_code_livre;
    COMMIT;
    ELSE ROLLBACK;
    end if;
ELSE ROLLBACK;
END if;
set autocommit= 1;
end $
delimiter ;

DELIMITER $
CREATE Procedure p_revoie(p_numero int ,date_rendu date)
begin
set autocommit = 0;
START TRANSACTION;
UPDATE Emprunt set date_rendu= p_rendu where numero=p_numero;
COMMIT;
set autocommit= 1;
end$
DELIMITER ;

DELIMITER $
CREATE Function p_disponibilité(p_code int)
RETURNS BOOLEAN
BEGIN
DECLARE dis BOOLEAN;
SELECT disponibilité into dis from Livre where code = p_code;
RETURN dis;
end$
delimiter ;

DELIMITER $
CREATE Function p_durée(f_numero int)
RETURNS int
begin
declare num_day int;
DECLARE daterend date;
SELECT date_rend into daterend where numero=f_numero;
if  daterend is not null  then 
SELECT round(datediff(date_rendu,date_emprunt)) into num_day where numero=f_numero;
else SELECT -1 into num_day;
RETURN num_day;
end IF;
end$
DELIMITER ;
DELIMITER $
create FUNCTION authentification(f_email char(25),f_password char(32))
RETURNS char(25)
begin
declare answer char(25);
if EXISTS( SELECT * from Adherent where email=f_email and password=f_password) THEN
    SELECT "exist" into answer;
    else
    SELECT "not exist" into answer;

end if;
RETURN answer;
end$

SELECT authentification("rami@gmail.com","rami");


