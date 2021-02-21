/* 1.- Modificar la tabla de préstamos para añadir la información de si el préstamo ya ha sido devuelto o no. */
/* ALTER TABLE prestec ADD COLUMN devolucion VARCHAR(2), ADD CONSTRAINT CH_devolucion CHECK (devolucion = "SI" OR devolucion = "NO");

/* 2.- Como que se prevé un uso intensivo en la busca de títulos de películas, creáis un índice sobre los títulos de las películas de la base de datos. */
CREATE INDEX IndexTituloPelicula ON pelicula(Titol);
/* 3.- Creáis una vista (PRESTECS_PENDIENTES) que facilite la visualización de los préstamos pendientes de devolver. Esta vista tendría que tener el nombre y el teléfono del cliente, el título de la película y la fecha del préstamo. Haría falta que la lista apareciera según la orden (ascendiente) de la fecha de préstamo. */
/* CREATE VIEW PRESTECS_PENDIENTES AS
SELECT client.Nom, client.Telefon, pelicula.Titol, prestec.Data
FROM prestec
INNER JOIN client ON prestec.DNI = client.DNI
INNER JOIN pelicula ON prestec.CodiPeli = pelicula.CodiPeli
WHERE devolucion = "NO";

/* 4.- Mostrar la descripción (definición) de la vista PRESTECS_PENDIENTES. */
/* DESC PRESTECS_PENDIENTES;

/* 5.- Modificar la estructura de la tabla GENERO para que CodiGenere tenga la propiedad de autoincrementarse. */
/* ALTER TABLE pelicula DROP FOREIGN KEY pelicula_ibfk_1;
ALTER TABLE genere MODIFY COLUMN CodiGenere INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pelicula ADD CONSTRAINT pelicula_ibfk_1 FOREIGN KEY (CodiGenere) REFERENCES genere(CodiGenere);

/* 6.- Modificar la tabla DetallFactura para que en NumeroUnitats tenga por defecto el valor 1 y que sea siempre positivo. */
/* ALTER TABLE detallfactura MODIFY NumeroUnitats INT UNSIGNED DEFAULT(1);