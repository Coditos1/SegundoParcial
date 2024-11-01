CREATE DATABASE bienesraices;

USE bienesraices;

CREATE TABLE propiedades (
  id int(11) NOT NULL AUTO_INCREMENT,
  titulo varchar(60) DEFAULT NULL,
  precio decimal(10,2) DEFAULT NULL,
  imagen varchar(200) DEFAULT NULL,
  descripcion longtext,
  habitaciones int(11) DEFAULT NULL,
  wc int(11) DEFAULT NULL,
  estacionamiento int(11) DEFAULT NULL,
  vendedorId int(11) DEFAULT NULL,
  creado date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY vendedorId_idx (vendedorId),
  CONSTRAINT vendedorId FOREIGN KEY (vendedorId) REFERENCES vendedores (id)
) 

CREATE TABLE usuarios (
  id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(60) DEFAULT NULL,
  password char(60) DEFAULT NULL,
  PRIMARY KEY (id)
) 
CREATE TABLE vendedores (
  id int(11) NOT NULL,
  nombre varchar(45) DEFAULT NULL,
  apellido varchar(45) DEFAULT NULL,
  telefono varchar(10) DEFAULT NULL,
  PRIMARY KEY (id)
)

INSERT INTO propiedades (id, titulo, precio, imagen, descripcion, habitaciones, wc, estacionamiento, vendedorId, creado) VALUES
(67, 'Cabaña', 1331.00, 'anuncio1.jpg', 'dio consectetur at. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 1, 2, 3, 1, '2021-02-05'),
(68, 'Casa Moderna', 13001091.00, 'anuncio2.jpg', 'dio consectetur at. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 3, 2, 1, 1, '2021-02-05'),
(69, 'Casa con Piscina', 130100.00, 'anuncio3.jpg', 'dio consectetur at. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 3, 1, 2, 1, '2021-02-05'),
(70, 'Casa en Promoción', 1313.00, 'anuncio4.jpg', 'dio consectetur at. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 3, 2, 1, 1, '2021-02-05'),
(72, 'Casa en el Lago', 1313.00, 'anuncio6.jpg', 'dio consectetur at. Interdum et malesuada fames ac ante ipsum primis in faucibus.', 3, 2, 1, 1, '2021-02-05');

INSERT INTO usuarios (id, email, password) VALUES
(5, 'correo@correo.com', '$2y$10$qb.EdDL1jR/Jc6JGFy9fT.t054KASVYqSWeqJHknF9ETutIb1AI4W');

INSERT INTO vendedores (id, nombre, apellido, telefono) VALUES
(1, 'Juan', 'De la torre', '091390109'),
(2, 'KAREN ACT', 'Perez', '0123456789');

CREATE TABLE propiedadesVendidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    propiedad_id INT NOT NULL,
    comprador VARCHAR(100) NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (propiedad_id) REFERENCES propiedades(id) ON DELETE CASCADE
);