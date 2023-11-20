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

create view viewarticle
AS
SELECT reference,designation,prix from Article;
SELECT * from viewarticle;

------------------------------------------------------------
CREATE view vue2
AS
SELECT designation,libelle from Article as a join Categorie as C
on a.id_categorie=C.id_categorie;

SELECT * from vue2;
--------------------------------------------------------------------

create view vue3
AS
SELECT sum(reference) as nbr,libelle from Categorie
as c left join  Article as a   on a.id_categorie=C.id_categorie;
drop view vue3;
SELECT * from vue3;
--------------------------------------------------------------------
create view vue4
AS
SELECT sum(qte_stock) as somme,avg(qte_stock) as average
from Article as a join categorie as c on a.id_categorie=c.id_categorie
GROUP BY c.id_categorie;
SELECT * from vue4;
--------------------------------------------------------------------
create view vue7
AS
SELECT * from Article ORDER BY prix desc limit 1;
SELECT * from vue7;
--------------------------------------------------------------------
ALTER view vue7 as select * from article order by prix asc limit 1;
--------------------------------------------------------------------
drop view vue7;