create DATABASE emprunt_livre;
::::::
use emprunt_livre;
create TABLE Livre (code int primary key AUTO_INCREMENT, 
    titre char(25), 
    langue char(25), 
    disponible BOOLEAN
    )

!
create table Adherent (
    numero INT primary key, 
    nom char(25), 
    prenom char(25), 
    email char(25), 
    password char(25)
    )


create table Emprunt (numero int primary key, 
code_livre INT, 
numero_adherent INT, 
date_emprunt date, 
date_rendu date
    );



delimiter $
create Procedure ajout(v_nom char(25),v_prenom char(25),v_email char(25),v_password char(25))
BEGIN
insert into Adherent(nom, prenom, email, password)
values(v_nom,v_prenom ,v_email,v_password);
END $
delimiter ;delimiter $
create Procedure ajout(v_nom char(25),v_prenom char(25),v_email char(25),v_password char(25))
BEGIN
insert into Adherent(nom, prenom, email, password)
values(v_nom,v_prenom ,v_email,v_password);
END $
delimiter ;

delimiter $
create Procedure ajout(v_nom char(25),v_prenom char(25),v_email char(25),v_password char(25))
BEGIN
insert into Adherent(nom, prenom, email, password)
values(v_nom,v_prenom ,v_email,v_password);
END $
delimiter ;




delimiter $
create Procedure ajout2(titre char(25), langue char(25), disponible char(25))
BEGIN
insert into Adherent(titre , langue , disponible)
values(titre,langue ,disponible);
END $
delimiter ;



delimiter $
create Function fs_nbr_livre(p_adh INt)
RETURNS int
begin 
DECLARE r INt;
SELECT COUNT(*) into r from livre as l join emprunt as e on l.code = e.code_livre JOIN Adherent as a on a.numero = e.numero where numero = p_adh and l.disponible = 0 ;
RETURN r;
END $
delimiter ;




DELIMITER $
create procedure trans(p_code_livre int,p_numero_adherent int,p_date_emprunt date,p_date_rendu date)
BEGIN
declare p_date_rendu date DEFAULT null ;
