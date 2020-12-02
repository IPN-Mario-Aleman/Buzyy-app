const pool = require('../database');

exports.homController = async (req, res)  =>{
    const testimoniales = await pool.query('SELECT testimoniales.mensaje, usuarios.username, usuarios.avatar, usuarios.email FROM testimoniales INNER JOIN usuarios ON testimoniales.id_user = usuarios.id');
    console.log(testimoniales);
    res.render('index',{
        pagina: 'Home',
        testimoniales
    });
}