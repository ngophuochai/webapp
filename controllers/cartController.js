var express = require('express'),
    productRepos = require('../repos/productRepos'),
    cartRepos = require('../repos/cartRepos');

var router = express.Router();

router.get('/', (req, res) => {
    var sum = 0;
    for (var i = 0; i < req.session.cart.length; i++) {
        sum += req.session.cart[i].amount;
    }

    var vm = {
        items: req.session.cart,
        sumAmount: sum,
    }
    res.render('cart/index', vm);
})

router.post('/add', (req, res) => {
    productRepos.single(req.body.proID).then(rows => {
        var item = {
            product: rows[0],
            quantity: +req.body.quantity,
            amount: rows[0].Price * +req.body.quantity,
        };
        cartRepos.add(req.session.cart, item);
        res.redirect(req.headers.referer);
    })
})

router.post('/update', (req, res) => {
    productRepos.single(req.body.proID).then(rows => {
        var item = {
            product: rows[0],
            quantity: +req.body.quantity,
        };
        cartRepos.update(req.session.cart, item);
        res.redirect(req.headers.referer);
    })
})

router.get('/checkout', (req, res) => {    
    var sum = 0;
    var pros = '';
    for (var i = 0; i < req.session.cart.length; i++) {
        sum += req.session.cart[i].amount;
        pros += req.session.cart[i].product.ID + "//" + req.session.cart[i].quantity + "//";
    }

    var vm = {
        items: req.session.cart,
        sumAmount: sum,
        products: pros
    }
    res.render('cart/checkout', vm);
})

router.post('/checkout', (req, res) => {    
    var username = req.body.username;
    var address = req.body.address + req.body.addressCity + req.body.addressCountry + req.body.addressCommune;
    var pros = req.body.products;
    var products = pros.split("//");
    var cItems = [];

    for (var i = 0; i < products.length; i = i + 2) {
        cItems.push({
            ProID: products[i],
            ProQuantity: +products[i + 1],
        });
    }

    for (var i = 0; i < cItems.length - 1; i++) {
        cartRepos.checkout(username, cItems, address, i);
    }
    req.session.cart = [];

    var vm = {
        isSuccess: true,
    }
    res.render('cart/checkout', vm);
})

router.post('/remove', (req, res) => {
    productRepos.single(req.body.proID).then(rows => {
        var item = {
            product: rows[0],
        };
        cartRepos.remove(req.session.cart, item);
        res.redirect(req.headers.referer);
    })
})

module.exports = router;