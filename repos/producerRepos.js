var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from producer`;
    return db.load(sql);
}

exports.single = id => {
    var sql = `select * from producer where ID = ${id}`;
    return db.load(sql);
}