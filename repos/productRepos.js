var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from products`;
    return db.load(sql);
}

exports.loadDayLimit = (n) => {
    var sql = `select t.*, c.Name CatName from products t, category c where t.Category = c.ID order by InputDay DESC limit ${n}`;
    return db.load(sql);
}

exports.loadQuantitySoldLimit = (n) => {
    var sql = `select t.*, c.Name CatName from products t, category c where t.Category = c.ID order by QuantitySold DESC limit ${n}`;
    return db.load(sql);
}

exports.loadViewsLimit = (n) => {
    var sql = `select t.*, c.Name CatName from products t, category c where t.Category = c.ID order by Views DESC limit ${n}`;
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
    var sql = `select t.*, c.Name CatName, p.Name PerName from products t, category c, producer p where t.Category = c.ID and t.Producer = p.ID and t.ID = ${id}`;
    return db.load(sql);
}

exports.countSearch = pro => {
    var sql = 'select count(*) as total from products where `name`' + `like '${pro.name}%' and category like '${pro.catID}' and producer like '${pro.perID}'`;
    return db.load(sql);
}

exports.loadPageSearch = (pro, offset) => {
    var sql = 'select * from products where `name`' + `like '${pro.name}%' and category like '${pro.catID}' and producer like '${pro.perID}' limit 8 offset ${offset}`;
    return db.load(sql);
    
}

exports.loadLikeCategory = (catID, n) => {
    var sql = `select * from products where Category = ${catID} order by InputDay DESC limit ${n}`;
    return db.load(sql);
}

exports.loadLikeProducer = (perID, n) => {
    var sql = `select * from products where Producer = ${perID} order by InputDay DESC limit ${n}`;
    return db.load(sql);
}