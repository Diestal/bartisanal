INSERT INTO Etiqueta
VALUES	 (1, "arte"),
		 (2, "local");

INSERT INTO Departamento
VALUES	 (1, "Valle del Cauca"),
		 (2, "Boyacá");

INSERT INTO EstadoOrden
VALUES 	('Aceptada', "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tellus massa, posuere sagittis odio nec. "),
		('Confirmada', "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tellus massa, posuere sagittis odio nec. "),
		('En espera', "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tellus massa, posuere sagittis odio nec. "),
		('Rechazada', "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent tellus massa, posuere sagittis odio nec. ");

INSERT INTO Fabricante
VALUES	(1, 'Perogrullada', "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
		(2, 'Vilipendiado', "Several decades of recent history may be summarized in these words: Phrases, promises, threats of blackmail, andfinally, crowning that ignoble edifice, the League of Nations of fifty-two nations.Our conscience is absolutely clear.With you, the entire world is witness that the Italy of fascism has done everything humanly possible to avoid thetempest that envelops Europe, but all in vain. It would have sufficed to revise treaties to adapt them to changingrequirements vital to nations and not consider them untouchable for eternity");


INSERT INTO EstadoCarrito
VALUES 	(01, "Lorem ipsum dolor iset apium et."),
		(02, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet purus orci, a rhoncus augue mattis et. Ut tellus turpis, mattis sit amet auctor id, viverra a neque.");

INSERT INTO TipoPersona
VALUES	(1, 'Cliente'),
		(2, 'Administrador'),
		(3, 'Empleado');

INSERT INTO Categoria
VALUES	(1, 'Cerámica', 'Imagen 1', 0001),
			(2, 'Peluchería', 'Imagen 2', 0002),
			(3, 'Joyería', 'Imagen 3', 0003);

INSERT INTO Ciudad
VALUES	(1, 1,'Cali'),
		(2, 2, 'Tunja'),
		(3, 1, 'Sogamoso'),
		(4, 1, 'Buenaventura'),
		(5, 1, 'Buga');

INSERT INTO Persona
VALUES	('1', '2', '4', '1', 'Benito', 'Mussolini', 'M', '1983-07-29', '3112589764', 'Cra 6 Av. 5 88-60'),
		('2', '3', '1', '1', 'Génaro', 'Polainas', 'M', '1970-06-25', '3154137894', 'Calle 12 N.99-05'),
		('3', '1', '3', '2', 'Lina', 'Linares', 'F', '1987-05-17', '5585555885', 'Cra 1 11-22'),
		('4', '1', '5', '1', 'Lino', 'Linores', 'M', '2000-11-27', '3074568799', 'Av. principal Cra 2 85-46'),
		('5', '3', '2', '2', 'Azuceno', 'Del Rio', 'M', '1990-01-07', '3113113131', 'Call 17 N.8-52');

INSERT INTO Producto
VALUES	(1, '1', 'Collar', 'Lorem impsum dolor aset.', 2500, '2012-12-20', 30),
		(2, '1', 'Anillo', 'Lorem impsum dolor aset.', 4500, '2013-02-23', 300),
		(3, '1', 'Cadena', 'Lorem impsum dolor aset.', 1200, '2003-12-23', 77),
		(4, '2', 'Vaso', 'Lorem impsum dolor aset.', 700, '2017-09-13', 120),
		(5, '2', 'Gardela', 'Lorem impsum dolor aset.', 7800, '2014-10-02', 420);

INSERT INTO cuenta
VALUES	(1, '1', '2', 'italyconquer@supremacy.co', 'Mussy0547', 'dominação', 'Perfil de Mussy0547'),
		(2, '2', '3', 'genpolen7z@correo.co', 'Polerin0h', 'sasd48sd', 'Perfil de Polerin0h'),
		(3, '3', '1', 'linanares@correo.com', 'Aliña', 'P30d3113rro', 'Perfil de Aliña'),
		(4, '4', '1', 'vinilo@correo.com', 'Vinilinho', 'ASadas468dsa', 'Perfil de Vinilinho'),
		(5, '5', '3', 'rivermond@pololo.co', 'Lilyputiense', '12345678', 'Perfil de Lilyputiense');

INSERT INTO resena
VALUES	(0001, '4', '1', 7, 0, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
		(0002, '3', '2', 5, 10, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
		(0003, '4', '3', 6, 45, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
		(0004, '3', '4', 10, 78, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
		(0005, '4', '5', 1, 2, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");
		
INSERT INTO Orden
VALUES	('001', 'En espera', '2', '3', 'AAAAL04', 'No', 'linanares@correo.com', '2019-06-14', 'Cra 1 11-22'),
		("2", "Rechazada", "2", "3", "ZZZOP10", "Si", "linares@correo.com", "2019-06-14", "Cra 1 11-12"),
		("3", "Aceptada","2", "2", "STFUM33", "Si", "linares@correo.com", "2019-06-15", "Cra 1 11-12"),
		("4", "Aceptada", "1", "5", "CDBMN78", "No", "linanares@correo.com", "2020-07-07", "Av. principal Cra 2 85-46"),
		("5", "Aceptada", "1", "5", "CDMN79", "No", "linares@correo.com", "2020-07-07", "Av. principal Cra 2 85-46");

INSERT INTO CategoriaProducto
VALUES	("3", "2"),
		("3", "3"),
		("3", "1"),
		("1", "5"),
		("1", "4");

INSERT INTO ImagenProducto
VALUES	("1", "1", "Collar img", \N, "101"),
		("2", "2", "Anillo  img", \N, "102"),
		("3", "3", "Cadena  img", \N, "103"),
		("4", "4", "Vaso  img", \N, "104"),
		("5", "5", "Gardela  img", \N, "105");

INSERT INTO Carrito
VALUES	("1",	"3",	"1",	"2019-06-14"),
		("2",	"3",	"2",	"2019-06-14"),
		("3",	"3",	"1",	"2019-06-15"),
		("4",	"3",	"2",	"2020-07-07"),
		("5",	"3",	"2",	"2020-07-07");

INSERT INTO Post
VALUES	("1",	"1",	"Paño Lency",	"s un textil no tejido, en forma de lámina, cuya característica principal es que para fabricarlo no se teje, es decir, que no surge del cruce entre trama y urdimbre, como ocurre con las telas.",	"arte, tela, fieltro",	"Por revisar",	"2018-11-29",	"2018-11-29"),
		("2",	"5",	"Guata",	"La guata es un material textil no tejido fabricado con filamentos de algodón que se usa principalmente como relleno y aislante térmico.",	"arte, textiles, relleno, yolo",	"Publicado",	"2017-01-09",	"2020-01-12"),
		("3",	"5",	"Tejido en cuatro",	"Forma de tejido entrecruzado usado para realizar cuerdas, a partir de fibras vegetales.",	"local, técnica",	"Sin archivar",	"2016-08-05",	"2018-08-01"),
		("4",	"2",	"Cuerina de trazado",	"El cuero ecológico, también conocido como cuero sintético o cuerina, tiene una textura similar a la que se obtiene de una vaca u otro animal. Se trata de un producto cuya materia prima no se obtiene por procedimientos tradicionales, tal y como se ha hecho durante miles de años.",	"Arte, insumos, barato, material",	"Oculto",	"2019-02-12",	"2020-02-12"),
		("5",	"1",	"Foamy moldeable",	"El etilvinilacetato (conocido también como goma EVA, foamy, foami, espumoso o EVA foam) es un polímero termoplástico conformado por unidades repetitivas de etileno y acetato de vinilo. Se le llama EVA por las siglas de su nombre técnico, etileno-vinil-acetato. También es conocido por su nombre más genérico en inglés, foamy (literalmente «espumoso»), que es el nombre utilizado en más de treinta países[cita requerida]. Es un material que combina con cualquier accesorio o producto de aplicación directa o superpuesta. Es un material que no sustituye a ninguno conocido, sino que por el contrario, lo complementa.",	"Foamy, foami, goma eva, espumosina",	"Publicado",	"2017-12-24",	"2018-12-31");

INSERT INTO ProductosCarrito
VALUES	("1",	"2",	"3"),
		("2",	"2",	"2"),
		("3",	"2", 	"10"),
		("1",	"4",	"3"),
		("5",	"5",	"1");

INSERT INTO ProductoOrdenado
VALUES	("1",	"1",	"4",	"Collar perla",	"Collar hecho de perlas finas",	2500,	5),
		("2",	"2",	"4",	"Anillo",	"Anillo de acero reforjado.",	4500,	1),
		("3",	"3",	"4",	"Cadena",	"Cadena hecha en acero aleado con bromo.",	1200,	3),
		("4",	"4",	"4",	"Vaso",	"Vaso de arcilla de pozo.",	700, 10),
		("5",	"5",	"4",	"Gardela",	"Gardela hecha en concreto y macilla a escala 1:5",	7800,	2);


INSERT	INTO Comentario
VALUES	("1",	"5",	"3",	"orem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",	"Oculto",	'2018-01-01',	"linananres@correo.com", null),
		("2",	"5",	"4",	"orem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",	"Aprobado",	'2019-06-07',	"vinilo@correo.com",	null),
		("3",	"5",	"3",	"orem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",	"Aprobado",	'2019-07-20',	"linanares@correo.com", null),
		("4",	"2",	"4",	"orem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",	"Borrado",	'2017-02-28',	"vinilo@correo.com",	null),
		("5",	"2",	"4",	"orem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ",	"Aprobado",	'2017-03-01',	"vinilo@correo.com",	null);