module.exports = (req, res, next) => {
    if (req.session.isLogged === false) {
        res.redirect('/home/account/login?retUrl=' + req.originalUrl);
    } else {
        next();
    }
}