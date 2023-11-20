create DATABASE vue;
use vue;
create table Categorie (
    id_categorie int primary key auto_increment, 
    libelle int
    );

CREATE Table Article (
    reference int primary key AUTO_INCREMENT, 
    designation char(25),
    prix decimal(10.4),
    qte_stock int, 
    id_categorie int,
    foreign key(id_categorie) references Categorie(id_categorie)
    );
insert into Article values(1,"BB20",200,20,1),(2,"BB20",400,10,2);
insert into Categorie values (2,"something"),(1,"we the best music");
delete from Categorie where libelle=0;
SELECT * from Categorie;
Alter table Categorie modify libelle char(25);

-----------------------------------------------------------

