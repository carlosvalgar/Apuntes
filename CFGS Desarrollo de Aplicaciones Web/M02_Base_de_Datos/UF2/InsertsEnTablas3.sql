START TRANSACTION;
SET autocommit = 0;

/* Inserts */

/* 1.- Añade a el profesor de Base de datos como cliente de la tienda (puedes inventarte los datos que desconozcas). */
/* INSERT INTO customer
VALUES ((SELECT MAX(CustomerId) + 1 FROM (SELECT * FROM customer) AUX1), "Rafa", "Aracil", "Esteve Terrades", "Calle Base de Datos 123", "Dataland", "BBDD", "MySQL", "0123456789", "666555444", NULL, "raracil1@xtec.cat", "3");
SELECT * FROM customer;

/* 2.- Añadir al grupo/artista *Extremoduro* y su álbum *Yo, minoria absoluta*.  https://es.wikipedia.org/wiki/Yo,_minor%C3%ADa_absoluta */
/* INSERT INTO artist (Name)
VALUES ("Extremoduro");
INSERT INTO album (Title, ArtistId)
VALUES ("Yo, minoria absoluta", (SELECT ArtistId FROM artist WHERE Name = "Extremoduro"));
SELECT * FROM album;

/* 3.- Crea 3 nuevas listas de reproducción con canciones que ya existan en la BBDD. */
/* SELECT @playListAgregada := "Chupiguay"; 
INSERT INTO playlist (Name)
VALUES (@playListAgregada);  
INSERT INTO playlisttrack
VALUES 
	((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE Name = "Innuendo")),
    ((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE Name = "Master Of Puppets" AND AlbumId = (SELECT AlbumId FROM album WHERE Title = "Master Of Puppets"))),
    ((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE Name = "Bad Boy"));
SELECT * FROM playlisttrack WHERE PlaylistId = (SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada);

SELECT @playListAgregada := "Chupiguay 2 El retorno del Jedi"; 
INSERT INTO playlist (Name)
VALUES (@playListAgregada);  
INSERT INTO playlisttrack
VALUES 
	((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE TrackId = 77)),
    ((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE TrackId = 78)),
    ((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE TrackId = 79));
SELECT * FROM playlisttrack WHERE PlaylistId = (SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada);

SELECT @playListAgregada := "Chupiguay 3 Mas chupi que nunca"; 
INSERT INTO playlist (Name)
VALUES (@playListAgregada);  
INSERT INTO playlisttrack
VALUES 
	((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE TrackId = 80)),
    ((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE TrackId = 81)),
    ((SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada), (SELECT TrackId FROM track WHERE TrackId = 82));
SELECT * FROM playlisttrack WHERE PlaylistId = (SELECT PlaylistId FROM playlist WHERE Name = @playListAgregada);

/* 4.- el cliente *Niklas Schröder* ha comprado dos ejemplares de la canción *Losing My Religion* y otro de la canción *Heartland*. Introduce los datos correspondientes en  *Invoice* y *InvoiceLine*, suponiendo que ha facturado a su dirección habitual. */
/* INSERT INTO invoice (CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total)
VALUES ((SELECT CustomerId FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder"), NOW(), (SELECT Address FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder"), (SELECT City FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder"),
(SELECT State FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder"), (SELECT Country FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder"), (SELECT PostalCode FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder"),
(SELECT(SELECT UnitPrice * 2 FROM track WHERE Name = "Losing My Religion") + (SELECT UnitPrice FROM track WHERE Name = "Heartland") AS "TOTAL"));

INSERT INTO invoiceline (InvoiceID, TrackID, UnitPrice, Quantity)
VALUES ((SELECT MAX(InvoiceId) FROM invoice WHERE CustomerID = (SELECT CustomerId FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder")), (SELECT TrackID FROM track WHERE Name = "Losing My Religion"),
(SELECT UnitPrice FROM track WHERE Name = "Losing My Religion"), 2);
INSERT INTO invoiceline (InvoiceID, TrackID, UnitPrice, Quantity)
VALUES ((SELECT MAX(InvoiceId) FROM invoice WHERE CustomerID = (SELECT CustomerId FROM customer WHERE FirstName = "Niklas" AND LastName = "Schröder")), (SELECT TrackID FROM track WHERE Name = "Heartland"),
(SELECT UnitPrice FROM track WHERE Name = "Heartland"), 1);

SELECT * FROM invoice ORDER BY InvoiceId DESC;
SELECT * FROM invoiceline ORDER BY InvoiceId DESC;

/*5.- Hem contractat al client *John Gordon*. El càrrec que ocuparà serà el de *Sales Manager* i el seu cap serà la *Nancy Edwards*. */
/* INSERT INTO employee (LastName, FirstName, Title, ReportsTo, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email)
SELECT LastName, FirstName, "Sales Manager", (SELECT EmployeeId FROM (SELECT * FROM employee) AS AUX WHERE LastName = "Edwards" AND FirstName = "Nancy"),
NOW(), Address, City, State, Country, PostalCode, Phone, Fax, Email FROM customer WHERE LastName = "Gordon" AND FirstName = "John";
SELECT * FROM employee;

/* Updates */

/* 1.- El cliente *Mark Taylor* se ha cambiado de dirección. Ahora vive en *68-70 Oxford St, Darlinghurst NSW 2010, Australia*. Modifica su entrada a la base de datos de acuerdo con este cambio. */
/* SELECT * FROM customer WHERE LastName = "Taylor";

UPDATE customer
SET Address = "68-70 Oxford St",  City = "Darlinghurst"
WHERE FirstName = "Mark" AND LastName = "Taylor";
SELECT * FROM customer WHERE LastName = "Taylor";

SELECT * FROM customer WHERE LastName = "Taylor";

/* 2.- Disminuye un 20% los precios de las 30 canciones más cortas de la base de datos. */ 
/* UPDATE track
SET UnitPrice = UnitPrice * 0.8
WHERE TrackId IN (SELECT * FROM (SELECT TrackID FROM (SELECT * FROM track) AUX ORDER BY Milliseconds ASC LIMIT 30) TEMPTAB);
SELECT * FROM track ORDER BY Milliseconds ASC;

/* 3.- Aumenta un 15% los precios de las 20 canciones más vendidas de la base de datos. */
/* UPDATE track
SET UnitPrice = UnitPrice * 1.15
WHERE TrackId IN (SELECT TrackId FROM (SELECT *, SUM(Quantity) AS "TotalSells" FROM invoiceline GROUP BY TrackId ORDER BY TotalSells DESC LIMIT 20) AUX);
SELECT * FROM track;

/* 4.- Hasta ahora, los clientes de la India tenían como asistente a la empleada *Jane Peacock*, pero a partir de ahora tendrán a *Margaret Park*. Fez el cambio correspondiente a la base de datos. */
/* SELECT * FROM customer WHERE Country = "India" No hay ningun cliente en la india, si lo quisiesemos hacer buscariamos los clientes que tienen en la india y hariamos una subquery para sacar el valor de la empleada Jane Peacock para substituirlos en todos.

/* 5.- El cliente *Eduardo Martins* se ha quejado de un error a su última factura. Además de las canciones que constan, asegura que también compró un ejemplar de la canción *Garota De Ipanema*. Modifica su última factura para añadir esta compra. */
/* INSERT INTO invoiceline (InvoiceId, TrackId, UnitPrice, Quantity)
SELECT (SELECT MAX(InvoiceId) FROM invoice WHERE CustomerId = (SELECT CustomerId FROM customer WHERE FirstName = "Eduardo" AND LastName = "Martins")), TrackId, UnitPrice, 1 FROM track WHERE Name = "Garota De Ipanema" LIMIT 1;

UPDATE invoice
SET Total = Total + (SELECT UnitPrice FROM track WHERE Name = "Garota De Ipanema" LIMIT 1)
WHERE InvoiceId = (SELECT MAX(InvoiceId) FROM (SELECT * FROM invoice) AUX WHERE CustomerId = (SELECT CustomerId FROM customer WHERE FirstName = "Eduardo" AND LastName = "Martins"));

SELECT * FROM invoice WHERE InvoiceId = 383;

/* Borrados */

/* 1.- Un error ha hecho que todas las facturas emitidas el día 28 de enero de 2013 sean erróneas: se guardaron a la base de datos, pero no se cobraron ni se entregaron las canciones. Elimina todas las facturas emitidas este día. */
/* DELETE FROM invoiceline
WHERE InvoiceId IN (SELECT InvoiceId FROM invoice WHERE InvoiceDate LIKE "2013-01-28%");

DELETE FROM invoice
WHERE InvoiceDate LIKE "2013-01-28 %";

SELECT * FROM invoice WHERE InvoiceDate LIKE "2013-01-28%"

/* 2.- Parece que hay dos listas de reproducción repetidas a la base de datos. Son las que tienen como nombre *Music*. Elimina una de las dos listas de reproducción completamente. */
/* DELETE FROM playlisttrack
WHERE PlaylistId = (SELECT PlaylistId FROM playlist WHERE Name = "Music" LIMIT 1);

DELETE FROM playlist
WHERE PlaylistId = (SELECT PlaylistId FROM (SELECT * FROM playlist) AUX WHERE Name = "Music" LIMIT 1);

SELECT * FROM playlist;

/* 3.- Borra todas las canciones de la base de datos que no se hayan vendido ninguna vez hasta ahora. */
/* DELETE FROM playlisttrack
WHERE TrackId NOT IN (SELECT DISTINCT TrackId FROM invoiceline);

DELETE FROM track
WHERE TrackId NOT IN (SELECT DISTINCT TrackId FROM invoiceline);