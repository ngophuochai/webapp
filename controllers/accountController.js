var express = require('express'),
    accountRepos = require('../repos/accountRepos'),
    sha256 = require('crypto-js/sha256');

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
    var vm = {
        isAction: false,
    }
    res.render('account/register', vm);
})

router.post('/register', (req, res) => {
    if (req.body.password !== req.body.rePassword) {
        var vm = {
            isPassword: false,
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
                    isSuccess: false,
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

router.post('/logout', restrict, (req, res) => {
    req.session.isLogged = false;
    req.session.curUser = null;

    res.redirect(req.headers.referer);
});

module.exports = router;