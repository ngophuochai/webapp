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