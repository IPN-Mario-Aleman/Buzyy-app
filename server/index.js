// importar express
const express = require('express');
const path = require('path');
const routes = require('./routes');
const configs = require('./config');
const morgan = require('morgan');
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const passport = require('passport');
const { database } = require('./keys');
const bodyparser = require('body-parser');
const multer = require('multer');
//const paypal = require('paypal-rest-sdk');
const pool = require('./database');

/* db confg
db.authenticate()
    .then(() => console.log('DB Conectada'))
    .catch(error => console.log(error)); 
*/
//multer file
const storage = multer.diskStorage({
    destination: 'public/img/pub',
    filename: (req, file, cb)=> {
        cb(null, file.originalname);
    }
});

//configurar express //initializations
const app = express();
require('./libs/passport');
app.use(bodyparser.json());
app.post(function(req, res, next){
    next();
});

// Middlewares
app.use(session({
    secret: 'buzzymysqlnodesession',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));
app.use(multer({
    storage,
    dest: 'public/img/pub'
}).single('myFile[]'));
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());

//variables globales
app.use((req, res, next) =>{
    app.locals.success = req.flash('success');   
    app.locals.message = req.flash('message'); 
    app.locals.user = req.user;
    next();
});


// habilitar pug
app.set('view engine', 'pug');

// Añadir las vistas
app.set('views', path.join(__dirname, './views'));

// cargar la carpeta estatica: "public"
app.use(express.static('public'));

// validar si estamos en desarrollo o en produccion
const config = configs[app.get('env')];

// creamos la variable para el sitio web
app.locals.titulo = config.nombresitio;

// crear una fecha actual
app.use((req, res, next) =>{
    const fecha = new Date();
    res.locals.fechaActual = fecha.getFullYear();
    return next();
})

// cargar las rutas
app.use('/', routes());


/*Puerto y host para la app */
const host = process.env.HOST || '0.0.0.0';
const port = process.env.PORT || 3000;

app.listen(port, host, () => {
    console.log('El servidor esta funcionando');
});



