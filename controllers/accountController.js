var express = require('express'),
    accountRepos = require('../repos/accountRepos'),
    sha256 = require('crypto-js/sha256'),
    cartRepos = require('../repos/cartRepos'),
    moment = require('moment');

var restrict = require('../middle-wares/restrict');

var router = express.Router();

router.get('/login', (req, res) => {
    res.render('account/login');
})

router.post('/login', (req, res) => {
    var acc = {
        username: req.body.username,
        password: sha256(req.body.password).toString(),
    };
    accountRepos.login(acc).then(rows => {
        if (rows.length > 0) {
            req.session.isLogged = true;
            req.session.curUser = rows[0];
            req.session.cart = [];

            var url = '/';
            if (req.query.retUrl) {
                url = req.query.retUrl;
            }
            res.redirect(url);
        } else {
            var vm = {
                showError: true,
            };
            res.render('account/login', vm);
        }
    });
});

router.get('/register', (req, res) => {
    res.render('account/register');
})

router.post('/register', (req, res) => {
    if (req.body.password !== req.body.rePassword) {
        var vm = {
            isAction:true
        }
        res.render('account/register', vm);
    }
    else {
        var acc = {
            username: req.body.username,
            password: sha256(req.body.password).toString(),
            name: req.body.name,
            email: req.body.email,
            address: req.body.address,
        }
        accountRepos.check(acc).then(rows => {
            if (+rows[0].total != 0) {
                var vm = {
                    isAction: true,
                    isPassword: true,
                }
                res.render('account/register', vm);
            }
            else {
                accountRepos.add(acc).then(value => {
                    var vm = {
                        isSuccess: true,
                        isAction: true,
                        isPassword: true
                    }
                    res.render('account/register', vm);
                })
            }
        })
    }
})

router.get('/profile', restrict, (req, res) => {
    res.render('account/profile');
})

router.get('/profile/infor', restrict, (req, res) => {
    var vm = {
        isInfor: true,
    }
    res.render('account/profile', vm);
})

router.post('/profile/infor', restrict, (req, res) => {
    var acc = {
        username: req.body.username,
        name: req.body.name,
        email: req.body.email,
        address: req.body.address,
    }
    accountRepos.update(acc).then(value => {
        req.session.curUser.name = acc.name;
        req.session.curUser.email = acc.email;
        req.session.curUser.address = acc.address;
        var vm = {
            isInfor: true,
            isSuccess: true,
            isAction: true,
        }
        res.render('account/profile', vm);
    })
})

router.get('/profile/password', restrict, (req, res) => {
    var vm = {
        isPassword: true,
    }
    res.render('account/profile', vm);
})

router.post('/profile/password', restrict, (req, res) => {
    if (req.body.newPassword !== req.body.rePassword) {
        var vm = {
            isPassword: true,
            isAction: true,
        }
        res.render('account/profile', vm);
    } else {
        var acc = {
            username: req.body.username,
            password: sha256(req.body.newPassword).toString(),
        }
        accountRepos.updatePassword(acc).then(value => {
            var vm = {
                isPassword: true,
                isAction: true,
                isSuccess: true,
            }
            res.render('account/profile', vm);
        })
    }
})


router.post('/logout', restrict, (req, res) => {
    req.session.isLogged = false;
    req.session.curUser = null;
    req.session.cart = [];

    res.redirect(req.headers.referer);
});

router.get('/history/:accName', restrict, (req, res) => {
    cartRepos.loadAll(req.params.accName).then(rows =>{
        var pros = [];
        for (var i = 0; i < rows.length; i++) {
            pros.push({
                checkoutDay: moment(rows[i].CheckoutDay, 'D/M/YYYY').format('DD-MM-YYYY HH:mm'),
                product: rows[i],
                amount: rows[i].Price * +rows[i].ProQuantity,
            });
        }

        var vm = {
            isHistory: true,
            items: pros,
        }
        res.render('account/profile', vm);
    })
})

router.get('/history/infor/:cartID', restrict, (req, res) => {
    cartRepos.single(req.params.cartID).then(rows =>{
        var vm = {
            isInforHistory: true,
            item: rows[0],
        }
        res.render('account/profile', vm);
    })
})

module.exports = router;