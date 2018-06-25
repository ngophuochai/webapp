var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from producer`;
    return db.load(sql);
}