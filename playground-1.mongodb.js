
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
db.articles.find().limit(1)
db.articles.insertOne(
    {
        _id:6,
        Désignation:"bruh",
            Quantité:3,
            Prix:5.50,
            TVA:0.50,
            Catégorie:"gaming"
    }
)
db.articles.remove({_id:6})
db.articles.find()
db.articles.updateOne({Désignation:"Souris Lenovo"},{$set:{TVA:25}})
db.articles.updateMany({},{$inc:{Quantité:20}})
db.articles.updateMany({Catégorie:"Bureautique"},{$inc:{Quantité:20}})
db.articles.find({TVA:25})
db.articles.find({},{Désignation:1,Quantité:1})
db.articles.find({Catégorie:"Informatique"},{Désignation:1,Prix:1,Catégorie:1})
db.articles.find({Quantité:{$gt:20}})
db.articles.find({Quantité:{lt:30}})
db.articles.find({Quantité:{lte:30}})
db.articles.find({Quantité:{$in:[30,45]}})
db.articles.find({$and[{Quantité:{$ls:30}},{TVA:{$eq:25}}]})









