var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from products`;
    return db.load(sql);
}

exports.loadPageCat = (catID, offset) => {
    var sql = `select * from products where category = ${catID} limit 6 offset ${offset}`;
    return db.load(sql);
}

exports.countCat = (catID) => {
    var sql = `select count(*) as total from products where category = ${catID}`;
    return db.load(sql);
}

exports.loadPagePer = (perID, offset) => {
    var sql = `select * from products where producer = ${perID} limit 6 offset ${offset}`;
    return db.load(sql);
}

exports.countPer = (perID) => {
    var sql = `select count(*) as total from products where producer = ${perID}`;
    return db.load(sql);
}

exports.single = id => {
    var sql = `select * from products where ID = ${id}`;
    return db.load(sql);
}