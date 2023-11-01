
/*use ("ecole");
const collection="etudiants";
db.createCollection("etudiants");
show dbs;
show collections;
db.etudiants.insertOne(
    {
        _id:1,
        nom:"youssef",
        age:16
    }
)
db.etudiants.find()
db.etudiants.drop()
db.dropDatabase()*/


use article;
db.createCollection("articles");
db.articles.insertMany(
    [
        {
            _id:1,
            Désignation:"Clé USB 16 BG ",
            Quantité:26,
            Prix:250.50,
            TVA:20,
            Catégorie:"Informatique"
        },
        {
            _id:2,
            Désignation:"Clavier USB HP",
            Quantité:12,
            Prix:130.75,
            TVA:25,
            Catégorie:"Informatique"
        },
        {
            _id:3,
            Désignation:"Souris USB LG",
            Quantité:25,
            Prix:58.00,
            TVA:30,
            Catégorie:"Informatique"
        },
        {
            _id:4,
            Désignation:"Agenda 2024",
            Quantité:56,
            Prix:46.00,
            TVA:46.00,
            Catégorie:"Bureautique"
        },{
            _id:5,
            Désignation:"Registre 400 pages",
            Quantité:60,
            Prix:80.50,
            TVA:80.50,
            Catégorie:"Bureautique"
        }
    ]
)