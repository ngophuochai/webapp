var productRepos = require('../repos/productRepos'),
    categoryRepos = require('../repos/categoryRepos'),
    producerRepos = require('../repos/producerRepos'),
    accountRepos = require('../repos/accountRepos'),
    cartRepos = require('../repos/cartRepos');

module.exports = (req, res, next) => {
    if (req.session.isLogged === undefined) {
        req.session.isLogged = false;
    }

    var cat = categoryRepos.loadAll();
    var per = producerRepos.loadAll();

    Promise.all([cat, per]).then(([rows1, rows2]) => {
        res.locals.layoutVM = {
            categories: rows1,
            producers: rows2,
            isLogged: req.session.isLogged,
            isAdmin: req.session.isAdmin,
            curUser: req.session.curUser,
            cartSummary: +cartRepos.getNumberOfItems(req.session.cart),
        }

        next();
    })

    // productRepos.loadAll().then(rows => {
    //     res.locals.layoutPro = {
    //         products: rows
    //     }
    // });

    // categoryRepos.loadAll().then(rows => {
    //     res.locals.layoutCat = {
    //         categories: rows
    //     }
    // });

    // producerRepos.loadAll().then(rows => {
    //     res.locals.layoutPer = {
    //         producers: rows
    //     }

    //     next();
    // });
}