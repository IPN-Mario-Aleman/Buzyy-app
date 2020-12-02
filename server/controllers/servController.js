const pool = require('../database');

exports.servController = async (req, res)  =>{
    const userServ = await pool.query('SELECT categorias.nom_cat, subcategorias.nom_scat, usuarios.username, publicaciones.id, publicaciones.titulo, publicaciones.img_1, publicaciones.img_2, publicaciones.img_4, publicaciones.img_3, publicaciones.img_5, publicaciones.costo, publicaciones.descripcion FROM publicaciones INNER JOIN usuarios ON publicaciones.id_user = usuarios.id INNER JOIN categorias ON publicaciones.id_cat = categorias.id INNER JOIN subcategorias ON publicaciones.id_scat = subcategorias.id AND categorias.id = subcategorias.id_cat WHERE (publicaciones.titulo = ? and usuarios.username = ? )', [req.params.titulo, req.params.user]);
    console.log(userServ);
    res.render('publicacion/',{
        pagina: 'Publicaciones',
        userServ: userServ
    });
    /*if(res.status(500)){
        res.send('Mal');
        /*
    }else{
        res.send('Bien');
       /res.render('404',{
            pagina: 'Not Found'
        });
    } */
}