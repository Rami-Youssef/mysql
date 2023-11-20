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
---------------------------------------------------------------------
DELIMITER $
CREATE PROCEDURE p_Adhrent(
    p_nom CHAR(25),
    p_prenom CHAR(25),
    p_email CHAR(25)
)
BEGIN
    INSERT INTO Adhrent (nom, prenom, email, date_inscription)
    VALUES (p_nom, p_prenom, p_email, NOW());
END
DELIMITER ;
drop procedure p_Adhrent;
call p_Adhrent("rami","youssef","rami@gmail.com")

---------------------------------------------------------------------
delimiter $
create procedure P_Livre(
    p_titre char(25), 
    p_auteur char(25)
)
BEGIN
insert into Livre(titre, auteur, disponible)
values(p_titre,p_auteur,1);
END
delimiter;

call P_Livre("jojo","youssef");
---------------------------------------------------------------------
DELIMITER $
create procedure P_Emprunt(
    p_numero int,
    P_id_livre int
)
BEGIN
insert into Emprunt(numero_adherent,id_livre, date_emprunt, date_rendu)
values(p_numero,P_id_livre,now(),null);
update Livre set disponible = 0 where id_livre=P_id_livre;
END;
DELIMITER;
call P_Emprunt(1,1);
---------------------------------------------------------------------
DELIMITER $
create procedure p_rendu(
    p_Emprunt int
)
BEGIN
update Emprunt set date_rendu = now() where id_emprunt=p_Emprunt;
update Livre as a join Emprunt as e on a.id_livre=e.id_livre
set disponible=1 WHERE id_emprunt=p_Emprunt;
END
DELIMITER ;
