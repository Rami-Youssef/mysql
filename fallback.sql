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
CREATE procedure P_Emprunt(p_code_livre int, p_numero_adherent int, p_date_emprunt date, p_date_rendu date)
begin
