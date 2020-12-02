const express = require('express');
const router = express.Router();
const passport = require('passport');
const session = require('express-session');
const pool = require('../database');
const { isLoggedIn, isNotLoggedIn } = require('../libs/auth');
/*const stripe = require('stripe')('sk_test_4gdHDOyxjhATYkfca0YG9ARW00zf15oCi3');*/
//const checksum_lib = require('./paytm/checksum/checksum');
const paypal = require('paypal-rest-sdk');
const multer = require('multer');

//controladores
const catController = require('../controllers/catController');
const logController = require('../controllers/logController');
const regController = require('../controllers/regController');
const homeController = require('../controllers/homeController');
const scatController = require('../controllers/scatController');
const servControllers = require('../controllers/servController');


module.exports = function(){
    
    router.get('/', homeController.homController);
    
    router.get('/usuarios', (req, res)=>{
        const newArray = [];
        newArray[0] = {
            id: 1,
            nombre: "Mario",
            edad: 18
        } 
        res.send(newArray);
    })

    router.get('/perfil', isLoggedIn, async (req, res)=>{
        const telefonos = await pool.query('SELECT * FROM telefonos WHERE id_user = ?',[req.user.id]);
        console.log(telefonos);

        res.render('miperfil/',{
            pagina: 'MyProfile',
            telefonos
        })
    });

    router.get('/categorias/:cat', catController.categoriasController);

    router.get('/categorias/:cat/:subcat', scatController.scategoriasController);

    router.get('/post-service', async (req, res) => {
        const categoria = await pool.query('SELECT id, nom_cat FROM categorias');
        /*const subcat = await pool.query('SELECT id, id_cat, nom_scat FROM subcategorias WHERE id_cat = ?', [req.body.subcat]);*/
        /*const cadena = [];
        /*for(var i=0; i<subcat.length; i++){
            cadena[i+1] = {
                id: subcat[i].id,
                nom_scat: subcat[i].nom_scat
            }//'<option value="'+subcat[i].id+'">'+subcat[i].nom_scat+'</option>';
        }
        cadena[0]= {
            id: 0,
            nom_scat: 'Selecciona una Subcategoria'
        }*/
        res.render('post/', {
            pagina: 'Publicar',
            categoria
            //cadena: cadena
        });
        
    });

    router.post('/post-service', async (req,res) => {
        console.log(req.body.subcat);
        const subcat = await pool.query('SELECT id, id_cat, nom_scat FROM subcategorias WHERE id_cat = ?', [req.body.subcat]);
        const categoria = await pool.query('SELECT id, nom_cat FROM categorias');
        console.log(subcat);
        //console.log(subcat[1].id);
        const cadena = [];
        
        cadena[0]= {
            id: 0,
            nom_scat: 'Selecciona una Subcategoria'
        } //'<option value="0">Selecciona una Subcategoria</option>';
        for(var i=0; i<subcat.length; i++){
            cadena[i+1] = {
                id: subcat[i].id,
                nom_scat: subcat[i].nom_scat
            } //'<option value="'+subcat[i].id+'">'+subcat[i].nom_scat+'</option>';
        }
        res.json(cadena);
        console.log(cadena);
        /*res.render('post/', {
            pagina: 'Publicar',
            categoria,
            cadena: cadena
        });*/
    });

    /*router.get('/ajax', function(req, res){
        res.render('ajax', {
            pagina: 'An Ajax Example', 
            parrafo: "AJAX is great!"
        });
    });
    router.post('/ajax', function(req, res){
        console.log(req.body);
        const parrafo = [];
        parrafo[0] = {
            id: '1',
            desc: req.body.quote
        }
        parrafo[1] = {
            id: '2',
            desc: req.body.quote
        }
        console.log(req.body.quote);
        console.log(parrafo);
        res.render('ajax', {
            pagina: 'An Ajax ', 
            parrafo
        });
    });*/

    router.post('/new_service', isLoggedIn, async (req, res) => {
        //console.log(req.body);
        //console.log(req.user);
        //console.log(req.file);
        const { titulo_serv, desc_serv, categoria_serv, subcategoria_serv, precio} = req.body;
        const newService ={
            id_user: req.user.id,
            id_cat: categoria_serv,
            id_scat: subcategoria_serv,
            titulo: titulo_serv,
            descripcion: desc_serv,
            costo: precio,
            img_1:  req.file.originalname
        }
        console.log(newService);
        await pool.query('INSERT INTO publicaciones set ?',[newService]);
        //console.log(req.body);
        //console.log(req.file);
        res.send('success');
    });

    router.get('/carrito', isLoggedIn, (req, res) => {
        res.render('carrito/',{
           pagina: 'Carrito'  
        });
    });

    router.get('/:user/:titulo', isLoggedIn, servControllers.servController);

    /*router.get('/checkout/customize/:id', async (req, res)=>{
        const customize = await pool.query('SELECT publicaciones.costo, publicaciones.descripcion FROM publicaciones INNER JOIN usuarios ON publicaciones.id_user = usuarios.id WHERE publicaciones.id = ?', [req.params.id]);
        console.log(customize);

        let params = {}
        params['MID']        
        
    });*/

    paypal.configure({
        mode: 'sandbox', //sandbox or live  
        client_id: 'AeGDrQBitIQqUrx87tP00qE3db3sNq5kEFrP7enJmJzwFWeSmEjIaD4YiIRG2iCI0F1NGRomwXVNO_oO',
        client_secret: 'EPM7QvpJROjg7331l_SIAmF-jRjwd2v18y1TNjG8feuMXy4mPRNQOvA6wO1Zw53nbFcvxJNTdM0AZ08s'
    });

    router.get('/checkout/customize/:id', async (req, res) => {
        const customize = await pool.query('SELECT publicaciones.id, publicaciones.costo, publicaciones.titulo FROM publicaciones INNER JOIN usuarios ON publicaciones.id_user = usuarios.id WHERE publicaciones.id = ?', [req.params.id]);
        //console.log(customize);
        //console.log(customize[0].costo);
        const id_pub = customize[0].id;
        var create_payment_json = {
            intent: "sale",
            payer: {
                payment_method: "paypal"
            },
            redirect_urls: {
                return_url: "http://localhost:3000/publicacion/payment/success?id="+id_pub, //${customize[0].id}`,
                cancel_url: "http://localhost:3000/cancel"
            },
            transactions: [
                {
                    item_list: {
                        items: [
                            {
                                name: "Service",
                                sku: "item",
                                price: customize[0].costo,
                                currency: "MXN",
                                quantity: 1
                            }
                        ]
                    },
                    amount: {
                        currency: "MXN",
                        total: customize[0].costo
                    },
                    description: customize[0].titulo
                }
            ]
        };
        paypal.payment.create(create_payment_json, function(error, payment) {
            if (error) {
                throw error;
            } else {
                console.log("Create Payment Response");
                console.log(payment);
                //res.send('ok');
                res.redirect(payment.links[1].href);
            }
        });
    });

    router.get('/publicacion/payment/success', async (req, res)=>{
        const customer = await pool.query('SELECT publicaciones.id, publicaciones.costo, publicaciones.titulo FROM publicaciones INNER JOIN usuarios ON publicaciones.id_user = usuarios.id WHERE publicaciones.id = ?', [req.query.id]);
        console.log(customer);
        console.log(customer[0].costo);

        var PayerID = req.query.PayerID;

        var paymentId = req.query.paymentId;

        var execute_payment_json = {
            
            payer_id: PayerID,
            transactions: [
                {
                    amount: {
                        currency: "MXN",
                        total: customer[0].costo
                    }
                }
            ]
        };

        paypal.payment.execute(paymentId, execute_payment_json, function(
            error,
            payment
        ) {
            if (error) {
                console.log(error.response);
                throw error;
            } else {
                console.log("Get Payment Response");
                console.log(JSON.stringify(payment));
                res.render('success/',{
                    pagina: 'Completado'
                    //customer: customer
                });
            }
        });
    });
    
    router.get('/cancel', (req, res)=>{
        res.render('cancel/',{
            pagina: 'Cancelación'
        });
    });
    

    
    router.get('/login', isNotLoggedIn, logController.loginController);

    router.get('/register', isNotLoggedIn, regController.registroController);

    router.post('/register', isNotLoggedIn, (req, res) =>{
        console.log(req.body);
        let {nombres, apellidos, username, password, email, passwordrepeat} = req.body;

        let errores = [];

        if(!nombres){
            errores.push({'mensaje' : 'Agrega un nombre'})
        } else 
        if(!apellidos){
            errores.push({'mensaje' : 'Agrega tus apellidos'})
        } else
        if(!username){
            errores.push({'mensaje' : 'Agrega un username'})
        } else
        if(!password){
            errores.push({'mensaje' : 'Agrega una contraseña'})
        } else 
        if(!email){
            errores.push({'mensaje' : 'Agrega un email'})
        } else 
        if(!passwordrepeat){
            errores.push({'mensaje' : 'Repite tu contraseña'})
        } else 
        if(password != passwordrepeat){
            errores.push({'mensaje' : 'Tus contraseñas no coinciden'})
        }

        if(errores.length > 0){
            //mostrar vista con los errores
            res.render('auth/register', {
                errores,
                nombres,
                apellidos,
                username,
                email
            })
        }else{
            passport.authenticate('local.register',{
                successRedirect: '/',
                failureRedirect: '/registro',
                failureFlash: true
            })(req, res);
        }
    });


    router.post('/login', isNotLoggedIn, (req, res, next) => {
        passport.authenticate('local.login',{
            successRedirect: '/',
            failureRedirect: '/login',
            failureFlash: true  
        })(req, res, next);
    });

    router.get('/profile', (req,res) => {
        res.send('this is your Profile')
    });


    router.get('/logout', (req, res) =>{
        req.logOut();
        res.redirect('/login');
    });
    
    router.use(function(req, res, next){
        if(res.status(404)){
            res.render('404',{
                pagina: 'Not Found'
            })
        }
    });
    return router;
}