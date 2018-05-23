var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('user/index', {layout: 'user.hbs'});
})

router.get('/account', (req, res) => {
    res.render('user/account', {layout: 'user.hbs'});
})

router.get('/cart', (req, res) => {
    res.render('user/cart', {layout: 'user.hbs'});
})

router.get('/checkout', (req, res) => {
    res.render('user/checkout', {layout: 'user.hbs'});
})

router.get('/history', (req, res) => {
    res.render('user/history', {layout: 'user.hbs'});
})

router.get('/inforAccount', (req, res) => {
    res.render('user/inforAccount', {layout: 'user.hbs'});
})

router.get('/inforHistory', (req, res) => {
    res.render('user/inforHistory', {layout: 'user.hbs'});
})

router.get('/passAccount', (req, res) => {
    res.render('user/passAccount', {layout: 'user.hbs'});
})

router.get('/product', (req, res) => {
    res.render('user/product', {layout: 'user.hbs'});
})

router.get('/search', (req, res) => {
    res.render('user/search', {layout: 'user.hbs'});
})

router.get('/store', (req, res) => {
    res.render('user/store', {layout: 'user.hbs'});
})

module.exports = router;