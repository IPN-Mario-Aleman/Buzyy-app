const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('../libs/helpers');

passport.use('local.login', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) =>{
    /*console.log(req.body)
    console.log(username)
    console.log(password)*/

    const rows = await pool.query('SELECT * FROM usuarios WHERE username = ?',[username]);
    if (rows.length > 0){
        const user = rows[0];
        const validPassword = await helpers.matchPassword(password, user.password);
        if (validPassword){
            done(null, user, req.flash('success','Welcome' + user.username));
        }else{
            done(null, false, req.flash('message','Incorrect Password'));
        }
    }else{
        return done(null, false, req.flash('message','The username does not exists')); 
    }
}));


passport.use('local.register', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) =>{
    const { nombres, apellidos, email} = req.body;

    const newUser = {
        username, 
        password,
        nombres: nombres,
        apellidos: apellidos,
        email,
    };
    console.log(newUser);
    newUser.password = await helpers.encryptPassword(password);
    const result = await pool.query('INSERT INTO usuarios SET ?', [newUser]);
    //console.log(result);
    newUser.id = result.insertId;
    return done(null, newUser);

}));

passport.serializeUser((user,done) => {
    done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM usuarios WHERE id = ?', [id]);
    done(null, rows[0]);
});