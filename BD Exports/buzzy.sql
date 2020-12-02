-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-07-2020 a las 11:08:14
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `buzzy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pub` int(11) NOT NULL,
  `rate` int(1) NOT NULL,
  `comentario` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nom_cat` varchar(30) NOT NULL,
  `desc_cat` text NOT NULL,
  `img_cat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nom_cat`, `desc_cat`, `img_cat`) VALUES
(1, 'Diseño Gráfico', 'Consiste en proyectar comunicaciones visuales destinadas a transmitir mensajes específicos a grupos sociales, con objetivos determinados', 'diseño_grafico.jpg'),
(2, 'Asistente Virtual', 'Asistente que puede ayudar con cualquier cosa a via remota sin necesidad de especializarse en algo', 'ast_virtual.jpg'),
(3, 'Coach', 'Entrenador', 'coach.jpg'),
(4, 'Gaming', 'Especialista en videojuegos', 'gaming.jpg'),
(5, 'Marketing Digital', 'Aplicación de las estrategias de comercialización llevadas a cabo en los medios digitales', 'mark_dig.jpg'),
(6, 'Traducción', 'Dominio de varios lenguajes', 'traduccion.jpg'),
(7, 'Video y Animación', 'Edición de videos', 'vid_anima.jpg'),
(8, 'Música y Audio', 'Especialistas en sonido', 'music_aud.jpg'),
(9, 'Otros', 'Otras categorías', 'otros.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `direccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE `estudios` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `tiempo` varchar(30) NOT NULL,
  `origen` varchar(80) NOT NULL,
  `dominio` varchar(50) NOT NULL,
  `img_cer` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `id_scat` int(11) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `descripcion` text NOT NULL,
  `costo` int(6) NOT NULL,
  `img_1` varchar(100) NOT NULL,
  `img_2` varchar(100) DEFAULT NULL,
  `img_3` varchar(100) DEFAULT NULL,
  `img_4` varchar(100) DEFAULT NULL,
  `img_5` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `id_user`, `id_cat`, `id_scat`, `titulo`, `descripcion`, `costo`, `img_1`, `img_2`, `img_3`, `img_4`, `img_5`) VALUES
(1, 1, 3, 12, 'Clases de Paracaidismo Abanderado', 'En este curso enseño las bases del paracaidismo extremo en bajas alturas, ubicado en el castillo de chapultepec, costo extra a estadounidenses', 1200, 'imagenp.jpg', ' ', ' ', ' ', ' '),
(2, 3, 3, 12, 'Te enseño a jugar lol', 'Si tienes deseos de trasvestirte mientras juegas lol te doy el curso basico para verte como toda una e-girl y conseguir muchas donaciones', 1200, 'lol.jpg', ' ', ' ', ' ', ' '),
(3, 5, 3, 12, 'Curso para pagar un OnlyFans', 'Te mostraré las bases para comprar contenidos de OnlyFans sin que tus amigos sospechen o puedan llamarte un SIMP', 700, 'onlyfans.jpg', ' ', ' ', ' ', ' '),
(4, 1, 3, 3, 'Clases de Paracaidismo Abanderado', 'En este curso enseño las bases del paracaidismo extremo en bajas alturas, ubicado en el castillo de chapultepec, costo extra a estadounidenses', 1200, ' ', ' ', ' ', ' ', ' '),
(5, 1, 3, 3, 'Clases de Paracaidismo Abanderado', 'En este curso enseño las bases del paracaidismo extremo en bajas alturas, ubicado en el castillo de chapultepec, costo extra a estadounidenses', 1200, 'juegos.jpg', NULL, NULL, NULL, NULL),
(6, 1, 1, 1, 'Prueba 1', 'Descripción\r\n', 1000, 'SC_L.200603.1_1_ 2020-06-03 23-06-14-410.png', NULL, NULL, NULL, NULL),
(7, 1, 1, 1, 'Prueba 1', 'Descripción\r\n', 1000, 'SC_L.200603.1_1_ 2020-06-03 23-06-14-410.png', NULL, NULL, NULL, NULL),
(8, 1, 1, 1, 'Prueba 1', 'Descripción\r\n', 1000, 'SC_L.200603.1_1_ 2020-06-03 23-06-14-410.png', NULL, NULL, NULL, NULL),
(9, 1, 5, 18, 'sadfasf', 'asdasdas', 2222, 'SC_L.200603.1_1_ 2020-06-10 04-44-32-400.png', NULL, NULL, NULL, NULL),
(10, 1, 4, 13, 'Prueba 2', 'Esto es una prueba de servicio', 500, 'SC_L.200520.1_4_ 2020-05-20 12-27-24-849.png', NULL, NULL, NULL, NULL),
(11, 1, 1, 3, 'Prueba 2', 'AAAAAAAAAAAA', 100, 'SC_L.200603.1_1_ 2020-06-08 15-25-34-881.png', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `inicio_session` datetime NOT NULL,
  `cierre_session` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('I9PgzL6dRCT1go_FvWU6g7QRd9PersxN', 1593774427, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `nom_scat` varchar(30) NOT NULL,
  `desc_scat` text NOT NULL,
  `img_scat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `id_cat`, `nom_scat`, `desc_scat`, `img_scat`) VALUES
(1, 1, 'Photoshop', 'Edicion de fotografia', 'photoshop.png'),
(2, 1, 'Diseño de Presentaciones', 'Diseños en power point o algún otra plataforma', 'designp.jpg'),
(3, 1, 'Infografia', 'Representación visual informativa o diagrama de textos escritos', 'Infografia.png'),
(4, 1, 'Trazado de vectores', 'Diseño de logos o imagenes', 'trazado.png'),
(5, 1, 'Diseño Twitch', 'Diseño de banner para usuarios de Twitch', 'designtw.jpg'),
(6, 1, 'Diseño de juegos', 'Digitalización de imágenes', 'designjg.jpg'),
(7, 1, 'Youtube Design', 'Diseño de imágenes y perfiles, animación y digitalización', 'ytdesign.jpg'),
(8, 2, 'Administracion y Soporte', 'Archivistas virtuales y manejo de tareas', 'admysupport.jpg'),
(9, 2, 'Busqueda', 'Busqueda utilizando Internet de cualquier cosa', 'busqueda.jpeg'),
(10, 2, 'Conversion de Archivos', 'Relacionada a manejo básico de información', 'convarch.jpg'),
(11, 3, 'Salud y Bienestar', 'Relacionada con vida personal', 'salbin.png'),
(12, 3, 'Empresarial', 'Relacionado a cualquier area empresarial', 'empresarial.jpg'),
(13, 4, 'Diseño de Juegos', 'Relacionado al diseño de videojuegos', 'diseñojg.jpg'),
(14, 4, 'Graficos para Streamers', 'Relacionado a mejorar calidad de streaming', 'graficosstreamers.jpg'),
(15, 4, 'Tienda de Twitch', 'Como ofrecer bien tus servicios de Tienda Twitch para aumentar tus ingresos.\r\n', 'tiendatw.png'),
(16, 5, 'Redes Sociales', 'Relacionado a Redes Sociales', 'redsocial.jpg'),
(17, 5, 'Analisis Web', 'Relacionado a Web', 'analisisweb.png'),
(18, 5, 'Promocion de Música', 'Relacionado a Musica', 'prommusic.jpg'),
(19, 5, 'E-Commerce', 'Relacionado a E-Commerce', 'ecommerce.jpeg'),
(20, 5, 'Influencer', 'Relacionado a Influencer', 'influencer.png'),
(21, 5, 'Publicidad', 'Relacionado a Publicidad', 'pub.jpg'),
(22, 5, 'Relaciones Publicas', 'Relacionado a Relaciones Publicas', 'relpublicas.jpg'),
(23, 6, 'Libros y Textos', 'Relacionado a Letras', 'librostxt.png'),
(24, 6, 'Oratoria Social y Profesional', 'Relacionado a traduccion en vivo', 'orato.jpg'),
(25, 7, 'Animacion', 'Relacionado a Animacion', 'animacion.gif'),
(26, 7, 'Efectos Visuales', 'Relacionado a traduccion en vivo', 'fvx.jpg'),
(27, 7, 'Trailers', 'Relacionado a Efectos Visuales', 'trailers.jpg'),
(28, 7, 'GIFs', 'Relacionado a GIFs', 'angif.gif'),
(29, 7, 'Videos musicales', 'Relacionado a Videos musicales', 'vidmus.jpg'),
(30, 7, 'Subtitulos', 'Relacionado a Subtítulos', 'subtitulos.jpg'),
(31, 8, 'Cantantes y Vocalistas', 'Relacionado a Cantantes y Vocalistas', 'canyvocal.jpg'),
(32, 8, 'Sessiones Musicales', 'Relacionado a Sessiones Musicales', 'sessionmusic.jpg'),
(33, 8, 'Efectos de Sonido', 'Relacionado a Efectos de Sonido', 'efectosonido.jpg'),
(34, 8, 'Mixing y Masterizacion', 'Relacionado a Mixing y Masterización', 'MM3.jpg'),
(35, 8, 'Escritores de Canciones', 'Relacionado a Escritores de Canciones', 'SW4.jpg'),
(36, 8, 'Productores y Compositores', 'Relacionado a Productores y Compositores', 'PC1.jpg'),
(37, 8, 'Transcripcion de Música', 'Relacionado a Transcripción de Música', 'TM2.png'),
(38, 8, 'DJs', 'Relacionado a DJs', 'DJ4.jpg'),
(39, 8, 'Lecciones de Musica', 'Relacionado a Lecciones de Musica', 'LM1.webp'),
(42, 9, 'Consultoria de Finanzas', 'Adquiere una consultoria para saber si tu organización cuenta con los procesos necesarios para su correcto funcionamiento', 'finanzas.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id`, `id_user`, `telefono`) VALUES
(1, 1, '5566112832'),
(6, 1, '5566111254');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimoniales`
--

CREATE TABLE `testimoniales` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `testimoniales`
--

INSERT INTO `testimoniales` (`id`, `id_user`, `mensaje`) VALUES
(1, 1, 'Depende de los municipios por los que pase'),
(2, 3, 'Quien dijo eso, o quien se supone que tiene que decir eso'),
(3, 5, 'Le pedí un diseños de estados unidos y me mandó el gulag'),
(4, 1, 'Fuiste tolerante hasta excesos criticados, pero todo tenía un límite');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_nac` varchar(50) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `estatus` tinyint(1) DEFAULT NULL,
  `cuenta_verificada` tinyint(1) DEFAULT NULL,
  `vendedor_aut` tinyint(1) DEFAULT NULL,
  `token` varchar(6) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `nombres`, `apellidos`, `email`, `fecha_nac`, `sexo`, `estatus`, `cuenta_verificada`, `vendedor_aut`, `token`, `avatar`, `fecha_reg`, `descripcion`) VALUES
(1, 'FallDestiny', '$2a$10$FTORWpSSEtuh25N8TvTfSemKLU7Pj3QuNH0miQ4VmIvQijcqVs3Ma', 'Mario Alberto', 'Alemán Fernández', 'asdasd@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'img_avatar.png', NULL, 'Mi nombre es Mario'),
(3, 'S1lar', '$2a$10$FTORWpSSEtuh25N8TvTfSemKLU7Pj3QuNH0miQ4VmIvQijcqVs3Ma', 'Jorge', 'Nitales', '123123@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'img_avatar.png', NULL, 'Mi nombre es Jorge'),
(5, 'lPhaserl', '$2a$10$FTORWpSSEtuh25N8TvTfSemKLU7Pj3QuNH0miQ4VmIvQijcqVs3Ma', 'Mario Alberto', 'Alemán Fernández', 'asd123@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'img_avatar.png', NULL, 'Mi nombre es Saul'),
(7, 'Ziro', '$2a$10$FTORWpSSEtuh25N8TvTfSemKLU7Pj3QuNH0miQ4VmIvQijcqVs3Ma', 'Juan', 'Gutierrez', 'josh@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'img_avatar.png', NULL, NULL),
(8, 'Jinx', '$2a$10$FTORWpSSEtuh25N8TvTfSemKLU7Pj3QuNH0miQ4VmIvQijcqVs3Ma', 'Mario Alberto', 'Alemán Fernández', 'prueba@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cali_user` (`id_user`),
  ADD KEY `fk_cali_pub` (`id_pub`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dir_user` (`id_user`);

--
-- Indices de la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_est_user` (`id_user`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pub_user` (`id_user`),
  ADD KEY `fk_cat_cat` (`id_cat`),
  ADD KEY `fk_scat_scat` (`id_scat`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_log_user` (`id_user`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_scat_cat` (`id_cat`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tel_user` (`id_user`);

--
-- Indices de la tabla `testimoniales`
--
ALTER TABLE `testimoniales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tes_user` (`id_user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudios`
--
ALTER TABLE `estudios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `testimoniales`
--
ALTER TABLE `testimoniales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `fk_cali_pub` FOREIGN KEY (`id_pub`) REFERENCES `publicaciones` (`id`),
  ADD CONSTRAINT `fk_cali_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `fk_dir_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `estudios`
--
ALTER TABLE `estudios`
  ADD CONSTRAINT `fk_est_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `fk_cat_cat` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_pub_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_scat_scat` FOREIGN KEY (`id_scat`) REFERENCES `subcategorias` (`id`);

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `fk_scat_cat` FOREIGN KEY (`id_cat`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `fk_tel_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `testimoniales`
--
ALTER TABLE `testimoniales`
  ADD CONSTRAINT `fk_tes_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
