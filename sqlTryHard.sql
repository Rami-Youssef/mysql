create DATABASE gestion;
use gestion;
create Table Client(
    code INT PRIMARY KEY AUTO_INCREMENT, 
    nom char(25), 
    prenom char(25), 
    sexe BOOLEAN
);
create table Compte(
    numero INT primary key AUTO_INCREMENT, 
    dateCreation date, 
    solde decimal(4,2), 
    codeClient int,
    Foreign Key (codeClient) REFERENCES Client(code)
);
create table Operation (
    numero INT primary key AUTO_INCREMENT, 
    date date, 
    type char(25), 
    montant decimal(4,2), 
    numeroCompte int,
    Foreign Key (numeroCompte) REFERENCES Compte(numero)
);
alter TABLE Operation
add constraint ck_valeurs check( type='débit' or  type='crédit'  );
DESCRIBE Operation;
DELIMITER $
create procedure uplow(in p_nom char(25), in p_prenom char(25),in p_sexe char(25))
BEGIN
declare new_nom char(25); 
declare new_prenom char(25);
set new_nom = UPPER(p_nom);
set new_prenom = lower(p_prenom);
insert into Client(nom, prenom, sexe) 
values(new_nom ,new_prenom,p_sexe);
END$
DELIMITER;
call uplow('Rami','Youssef','male');
delimiter $
create procedure vérifier(p_codeClient int,p_solde decimal(4,2))
BEGIN
IF EXISTS(select * from Client where code=p_codeClient)
THEN IF p_solde>=0 
THEN INSERT INTO Compte( dateCreation, solde, codeClient)
values(NOW(),p_solde,p_codeClient);
else SELECT 'votre sold est insufie' as Message;
END IF;
else SELECT CONCAT(p_codeClient,'est pas un CLIENT') as message;
END IF;
END$
DELIMITER;
drop procedure vérifier;
call vérifier(1,-20);
delimiter $
create procedure vivement(
    in p_numero1 int,
    in p_numero2 int,
    IN p_montant decimal(4,2)
)
BEGIN
if p_montant>0
THEN if EXISTS(select * from Compte where numero = p_numero1 and solde>=montant)
THEN insert INTO Operation(date, type, montant, numeroCompte)
values(NOW(),'crédit',p_montant,p_numero1);
insert INTO Operation(date, type, montant, numeroCompte)
values(NOW(),'débit',p_montant,p_numero2);
else SELECT "votre sold n'est pas valid" as Message;
end if;
else select "votre matantant n'est pas valid" as Message;
end if;
end $
delimiter ;
SELECT * from compte;

