/* 1.- 1. Crea la Base de Datos "Tienda" a partir de la siguiente defición. */
CREATE DATABASE Tienda;
USE Tienda;

CREATE TABLE provincias (
codPro INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(40)
);

CREATE TABLE pueblos (
codPue INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(40),
codPro INT,
CONSTRAINT fk_puebloProvincia
FOREIGN KEY (codPro)
REFERENCES provincias(codPro)
);

CREATE TABLE clientes (
codCli INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20),
direccion VARCHAR(20),
codPostal INT,
codPue INT,
CONSTRAINT fk_clientePueblo
FOREIGN KEY (codPue)
REFERENCES pueblos(codPue)
);

CREATE TABLE vendedores (
codVen INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20),
direccion VARCHAR(20),
codPostal INT,
codPue INT,
codJefe INT,
CONSTRAINT fk_vendedorPueblo
FOREIGN KEY (codPue)
REFERENCES pueblos(codPue),
CONSTRAINT fk_vendedorJefe
FOREIGN KEY (codJefe)
REFERENCES vendedores(codVen));

CREATE TABLE articulos (
codArt INT AUTO_INCREMENT PRIMARY KEY,
descrip VARCHAR(20),
precio FLOAT(5,2),
stock INT,
stocMin INT
);

CREATE TABLE facturas (
codFac INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
codCli INT,
codVen INT,
IVA INT,
dto INT,
CONSTRAINT fk_facturaCliente
FOREIGN KEY (codCli)
REFERENCES clientes(codCli),
CONSTRAINT fk_facturaVendedor
FOREIGN KEY (codVen)
REFERENCES vendedores(codVen)
);

CREATE TABLE lineaFac (
codFac INT,
linea INT,
cantidad INT,
codArt INT,
precio FLOAT(5,2),
dto INT,
CONSTRAINT fk_lineaFacFactura
FOREIGN KEY (codFac)
REFERENCES facturas(codFac),
CONSTRAINT fk_lineaFacArticulo
FOREIGN KEY (codArt)
REFERENCES articulos(codArt)
);

/* 2.- Modificación de la tabla articulos para que los campos precio, stock y stock_min solo admitan valores no nulos y positivos. */
ALTER TABLE articulos MODIFY precio FLOAT(5,2) UNSIGNED NOT NULL, MODIFY stock INT UNSIGNED NOT NULL, MODIFY stocMin INT UNSIGNED NOT NULL;

/* 3.- Modificacion de la tabla facturas para que el campo iva solo admita estos valores(4 , 10 , 21) y el campo dto solo admita lo siguiente (10 ,20 ,30 ,40 ,50). */
ALTER TABLE facturas ADD CONSTRAINT CH_IVA CHECK (IVA = 4 OR IVA = 10 OR IVA = 21), ADD CONSTRAINT CH_dto CHECK (dto = 10 OR dto = 20 OR dto = 30 OR dto = 40 OR dto = 50);

	/* Método alternativo para añadir los checks con un solo constraint */
	ALTER TABLE facturas ADD CONSTRAINT CH_facturas CHECK ((IVA = 4 OR IVA = 10 OR IVA = 21) AND (dto = 10 OR dto = 20 OR dto = 30 OR dto = 40 OR dto = 50));

/* 4.- Incorporar una columna "importe" a la tabla linea_fact. */
 ALTER TABLE lineaFac ADD COLUMN importe INT;

/* 5.- Borrar la tabla vendedores. */
ALTER TABLE facturas DROP FOREIGN KEY fk_facturaVendedor;
DROP TABLE vendedores;