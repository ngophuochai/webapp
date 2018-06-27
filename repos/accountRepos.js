var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from account`;
    return db.load(sql);
}

exports.add = acc => {
    var sql = 'insert into account(username, `password`, `name`, email, address)' + `values('${acc.username}', '${acc.password}', '${acc.name}', '${acc.email}', '${acc.address}')`;
    return db.save(sql);
}

exports.check = acc => {
    var sql = 'select count(*) as total from account where `username`' + ` = '${acc.username}'`;
    return db.load(sql);
}

exports.login = acc => {
    var sql = `select * from account where username = '${acc.username}' and` + '`password`' + ` = '${acc.password}'`;
    return db.load(sql);
}

exports.update = acc => {
    var sql = 'update account set `name`' + ` = '${acc.name}', email = '${acc.email}', address = '${acc.address}' where username = '${acc.username}'`;
    return db.save(sql);
}

exports.updatePassword = acc => {
    var sql = 'update account set `password`' + ` = '${acc.password}' where username = '${acc.username}'`;
    return db.save(sql);
    
}