var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from category`;
    return db.load(sql);
}

exports.single = id => {
    var sql = `select * from category where ID = ${id}`;
    return db.load(sql);
}