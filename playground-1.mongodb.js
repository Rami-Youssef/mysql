
use ("ecole");
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
db.dropDatabase()