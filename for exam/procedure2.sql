create database procedure2;
use PROCEDURE2;
create table Client (
    code int primary key auto_increment,
     nom char(25), 
     prenom char(25), 
     sexe char(25)
);
create table Compte (
    numero int primary key AUTO_INCREMENT, 
    dateCreation date , 
    solde decimal(10.4), 
    codeClient int,
    Foreign Key (codeClient) REFERENCES Client(code)
);
CREATE TABLE Operation (
    numero int primary key AUTO_INCREMENT, 
    date date, 
    type char(25), 
    montant DECIMAL(10.2), 
    numeroCompte int,
    Foreign Key (numeroCompte) REFERENCES Compte(numero)
);
alter table Operation add constraint check_debit check(type between "débit" and "crédit")
---------------------------------------------------------
delimiter $
create procedure p_Client(
    p_nom char(25),
    p_prenom char(25),
    p_sexe char(25)
)
BEGIN
insert into Client ( nom, prenom, sexe)
values(UPPER(p_nom) ,lower(p_prenom) ,p_sexe);
END
delimiter ;
call p_Client("rami","Youssef","M");
SELECT * from Client;