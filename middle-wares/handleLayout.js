var productRepos = require('../repos/productRepos'),
    categoryRepos = require('../repos/categoryRepos'),
    producerRepos = require('../repos/producerRepos');

module.exports = (req, res, next) => {
    productRepos.loadAll().then(rows => {
        res.locals.layoutPro = {
            products: rows
        }
    });

    categoryRepos.loadAll().then(rows => {
        res.locals.layoutCat = {
            categories: rows
        }
    });

    producerRepos.loadAll().then(rows => {
        res.locals.layoutPer = {
            producers: rows
        }

        next();
    });
}