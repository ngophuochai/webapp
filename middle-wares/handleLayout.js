var productRepos = require('../repos/productRepos');

module.exports = (req, res, next) => {
    productRepos.loadAll().then(rows => {
        res.locals.layoutVM = {
            products: rows
        }

        next();
    });
}