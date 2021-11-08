CREATE TABLE Etiqueta (
	IdEtiqueta INT NOT NULL,
	NombreEtiqueta varchar(15) NOT NULL,
	PRIMARY KEY(IdEtiqueta)
);

CREATE TABLE Departamento (
	IdDepto INT NOT NULL,
	NombreDepto VARCHAR(15) NOT NULL,
	PRIMARY KEY (IdDepto)
);

CREATE TABLE EstadoOrden (
	IdEstadoOrden VARCHAR(20) NOT NULL,
	DescripcionEstadoOrden TEXT(200) NOT NULL,
	PRIMARY KEY (IdEstadoOrden)
);

CREATE TABLE Fabricante (
	IdFabricante int NOT NULL,
	NombreFabricante VARCHAR(30) NOT NULL,
	InformacionAdd MEDIUMTEXT,
	PRIMARY KEY (IdFabricante)
);

CREATE TABLE EstadoCarrito (
	IdEstadoCarrito int NOT NULL,
	DescripcionEstadoCar TEXT(100) NOT NULL,
	PRIMARY KEY (IdEstadoCarrito)
);

CREATE TABLE TipoPersona (
	IdTipoPersona int NOT NULL,
	NombreTipoPersona VARCHAR(15) NOT NULL,
	PRIMARY KEY (IdTipoPersona)
);

CREATE TABLE Categoria (
	IdCategoria int NOT NULL,
	NombreCategoria varchar(15) NOT NULL,
	ImagenCategoria VARCHAR(25) NOT NULL,
	CatSortOrder INT NOT NULL,
	PRIMARY KEY (IdCategoria)
);

CREATE TABLE Ciudad (
	IdCiudad INT NOT NULL,
	IdDepto int NOT NULL,
	NombreCiudad VARCHAR(15) NOT NULL,
	PRIMARY KEY (IdCiudad),
	CONSTRAINT fk_ciudad_dpto 
	FOREIGN KEY (IdDepto) REFERENCES Departamento(IdDepto)
);

CREATE TABLE Persona (
	IdPersona int NOT NULL,
	IdTipoPersona int NOT NULL,
	IdCiudad int NOT NULL,
	IdDepto int NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Sexo VARCHAR(1) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	NumCelular VARCHAR(20) NOT NULL,
	Direccion VARCHAR(30) NOT NULL,
	PRIMARY KEY (IdPersona),
	constraint fk_persona_tp 
	FOREIGN KEY (IdTipoPersona) REFERENCES TipoPersona(IdTipoPersona),
	CONSTRAINT fk_persona_ciudad
	FOREIGN KEY (IdCiudad) REFERENCES Ciudad(IdCiudad),
	CONSTRAINT fk_persona_depto
	FOREIGN KEY (IdDepto) REFERENCES Departamento(IdDepto));

CREATE TABLE Producto (
	IdProducto int NOT NULL,
	IdFabricante int NOT NULL,
	NombreProducto varchar(15) NOT NULL,
	DescripcionProducto VARCHAR(50),
	Precio DOUBLE(11,3) NOT NULL,
	FechaCreacionPr DATE NOT NULL,
	Stock INT NOT NULL,
	PRIMARY KEY (IdProducto),
	CONSTRAINT fk_pr_fabricante
	FOREIGN KEY (IdFabricante) REFERENCES Fabricante(IdFabricante)
);

CREATE TABLE Cuenta (
	IdCuenta INT NOT NULL,
	IdPersona int NOT NULL,
	IdRol int NOT NULL,
	CorreoElectronico VARCHAR(30) NOT NULL,
	NombreUsuario VARCHAR(15) NOT NULL,
	Contrasena varchar(15) NOT NULL,
	Perfil TEXT(200) NOT NULL,
	PRIMARY KEY (IdCuenta),
	CONSTRAINT fk_cuenta_persona
	FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona),
	CONSTRAINT fk_cuenta_tp
	FOREIGN KEY (IdRol) REFERENCES Persona(IdTipoPersona)
);

CREATE TABLE Resena (
	IdResena int NOT NULL,
	IdUsusario int NOT NULL,
	IdProducto int NOT NULL,
	Calificacion INT NOT NULL,
	VisualizacionesResena INT,
	TextoResena MEDIUMTEXT,
	PRIMARY KEY (IdResena),
	CONSTRAINT fk_resena_usuario
	FOREIGN KEY (IdUsusario) REFERENCES Cuenta(IdCuenta),
	CONSTRAINT fk_resena_pr
	FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);

CREATE TABLE Orden (
	IdOrden int NOT NULL,
	IdEstadoOrden VARCHAR(20) NOT NULL,
	IdDepto int NOT NULL,
	IdCiudad int NOT NULL,
	Referencia VARCHAR(45) NOT NULL,
	Pedidio VARCHAR(30) NOT NULL,
	CorreoElectronico VARCHAR(45) NOT NULL,
	FechaDecompra DATE NOT NULL,
	DireccionEnvio VARCHAR(30) NOT NULL,
	PRIMARY KEY (IdOrden),
	CONSTRAINT fk_orden_estOrd
	FOREIGN KEY (IdEstadoOrden) REFERENCES EstadoOrden(IdEstadoOrden),
	CONSTRAINT fk_orden_dpto
	FOREIGN KEY (IdDepto) REFERENCES Departamento(IdDepto),
	CONSTRAINT fk_orden_ciudad
	FOREIGN KEY (IdCiudad) REFERENCES Ciudad(IdCiudad)
);

CREATE TABLE CategoriaProducto (
	IdCategoria INT NOT NULL,
	IdProducto INT NOT NULL,
	PRIMARY KEY (IdCategoria, IdProducto),
	CONSTRAINT ctp_cat
	FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),
	CONSTRAINT ctp_pr
	FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);

CREATE TABLE ImagenProducto (
	IdImagenProducto INT NOT NULL,
	IdProducto INT NOT NULL,
	NombreImagen VARCHAR(15) NOT null,
	ContenidoHTML VARCHAR(15),
	ImgSortOrder INT NOt NULL,
	PRIMARY KEY (IdImagenProducto),
	CONSTRAINT fk_imgPr_pr
	FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)

);

CREATE TABLE Carrito (
	IdCarrito INT NOT NULL,
	IdCliente int NOT NULL,
	IdEstadoCarrito int NOT NULL,
	FechaCreacion DATE NOT NULL,
	PRIMARY KEY (IdCarrito),
	CONSTRAINT fk_carrito_persona
	FOREIGN KEY (IdCliente) REFERENCES Persona(IdTipoPersona),
	CONSTRAINT fk_carrito_estCarrito
	FOREIGN KEY (IdEstadoCarrito) REFERENCES EstadoCarrito(IdEstadoCarrito)
);

CREATE TABLE Post (
	IdPost INT NOT NULL,
	IdAutor int NOT NULL,
	Titulo varchar(20) NOT NULL,
	Contenido MEDIUMTEXT NOT NULL,
	Etiquetas TEXT(100) NOT NULL,
	Estado VARCHAR(15) NOT NULL,
	FechaCreacionPost DATE NOT NULL,
	FechaEdicionPost DATE NOT NULL,
	PRIMARY KEY (IdPost),
	CONSTRAINT fk_post_cuenta
	FOREIGN KEY (IdAutor) REFERENCES Cuenta(IdCuenta)
);

CREATE TABLE ProductosCarrito (
	IdCarrito int NOT NULL,
	IdProducto int NOT NULL,
	Cantidad INT NOT null,
	CONSTRAINT fk_prCarrito_carrito
	FOREIGN KEY (IdCarrito) REFERENCES Carrito(IdCarrito),
	CONSTRAINT fk_prCarrito_prod
	FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);

CREATE TABLE ProductoOrdenado (
	IdProductoOrdenado INT NOT NULL,
	IdProducto int NOT NULL,
	IdOrden int NOT NULL,
	NombreProducto VARCHAR(15) NOT NULL,
	DescripcionProducto TEXT(300) NOT NULL,
	PrecioVenta int NOT NULL,
	Cantidad INT NOT NULL,
	PRIMARY KEY (IdProductoOrdenado),
	CONSTRAINT fk_po_prod
	FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
	CONSTRAINT fk_po_orden
	FOREIGN KEY (IdOrden) REFERENCES Orden(IdOrden)
);

CREATE TABLE Comentario (
	IdComentario INT NOT NULL,
	IdPost int NOT NULL,
	IdAutor int NOT NULL,
	ContenidoComentario MEDIUMTEXT NOT NULL,
	Estado VARCHAR(20) NOT NULL,
	FechaCreacionComentario DATE NOT NULL,
	CorreoElectronico VARCHAR(30) NOT NULL,
	Adjunto VARCHAR(15),
	PRIMARY KEY (IdComentario),
	CONSTRAINT fk_comentario_post
	FOREIGN KEY (IdPost) REFERENCES Post(IdPost),
	CONSTRAINT fk_comentario_autor
	FOREIGN KEY (IdAutor) REFERENCES Cuenta(IdCuenta)
);

