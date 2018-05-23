var express = require('express');
var exphbs = require('express-handlebars');
var exphbs_section = require('express-handlebars-sections');
var bodyParser = require('body-parser');
var path = require('path');

var homeController = require('./controllers/homeController');
var userController = require('./controllers/userController');
var adminController = require('./controllers/adminController');

var app = express();

app.engine('hbs', exphbs({
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: exphbs_section()
    }
}));

app.set('view engine', 'hbs');

app.use(express.static(
	path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use('/', homeController);
app.use('/user', userController);
app.use('/admin', adminController);

app.listen(3000, () => {
    console.log('server running on port 3000');
});