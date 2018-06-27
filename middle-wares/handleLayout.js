var productRepos = require('../repos/productRepos'),
    categoryRepos = require('../repos/categoryRepos'),
    producerRepos = require('../repos/producerRepos'),
    accountRepos = require('../repos/accountRepos'),
    cartRepos = require('../repos/cartRepos');

module.exports = (req, res, next) => {
    if (req.session.isLogged === undefined) {
        req.session.isLogged = false;
    }

    accountRepos.loadAll().then(rows => {
        res.locals.layoutAcc = {
            accounts: rows,
            isLogged: req.session.isLogged,
            curUser: req.session.curUser,
            cartSummary: +cartRepos.getNumberOfItems(req.session.cart),
        }
    })

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