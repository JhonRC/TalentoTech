-- 1.	Ejecutar y revisar el resultado de las siguientes consultas
SELECT * FROM Invoice;
SELECT * FROM Employee;
SELECT BILLINGCOUNTRY,
	COUNT(INVOICEID)
FROM INVOICE
GROUP BY 1 ORDER BY 2 DESC;

-- 2. ¿Qué país tiene más facturas?
select BillingCountry as 'country',
	count(InvoiceId) as 'result'
from invoice
group by 1 
order by 2 desc;

/* 3. Se quiere promocionar un nuevo festival musical, para
ello es necesario saber en qué ciudad hay más facturas
(invoices). determinar en qué ciudad la suma de facturas
es la mayor. */
select BillingCity as City, sum(Total) as TotalFacturas
from invoice
group by City
order by TotalFacturas desc;

-- 4. Determinar quién es el mejor cliente (el que más ha gastado en el sistema)
select FirstName, LastName, sum(i.Total) as Gasto
from customer as c
join invoice as i on c.CustomerId = i.CustomerId
group by c.CustomerId
order by Gasto desc;



/* 5. Obtener una tabla con el correo, nombre y apellido de 
todas las personas que escuchan Rock. Retornar la lista por orden alfabético */
select c.Email as Correo, c.FirstName as Nombre, c.LastName as Apellido
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
join InvoiceLine il on i.InvoiceId = il.InvoiceId
join Track t on il.TrackId = t.TrackId
join Genre g on t.GenreId = g.GenreId
where g.Name = 'Rock'
group by c.Email, c.FirstName, c.LastName
order by c.FirstName;

/*6. Sacar una lista con todos los artistas que generan música rock*/
select distinct ar.Name as Artista
from Artist ar
join Album al on ar.ArtistId = al.ArtistId
join Track t on al.AlbumId = t.AlbumId
join Genre g on t.GenreId = g.GenreId
where g.Name = 'Rock'
order by ar.Name;

/*7. Encontrar cual es el artista que más ha ganado de acuerdo con el campo invoiceLines.*/

select ar.ArtistId, ar.Name as ArtistName, SUM(il.UnitPrice * il.Quantity) as TotalGanado
from InvoiceLine as il
inner join Track as t on il.TrackId = t.TrackId
inner join Album as al on t.AlbumId = al.AlbumId
inner join Artist as ar on al.ArtistId = ar.ArtistId
group by ar.ArtistId, ar.Name
order by TotalGanado desc;

/*8. Encontrar cuanto gastaron en total en estados unidos en compras*/
select SUM(Total) as 'Total Gastado USA'
from Invoice
where BillingCountry = 'USA';

-- 9. Encontrar cuánto gastaron los usuarios por género
select g.Name as Genero, SUM(il.UnitPrice * il.Quantity) as TotalGastado
from Genre as g
inner join Track as t on g.GenreId = t.GenreId
inner join InvoiceLine as il on t.TrackId = il.TrackId
inner join Invoice as i on il.InvoiceId = i.InvoiceId
inner join Customer as c on i.CustomerId = c.CustomerId
group by g.Name
order by TotalGastado desc;

-- 10. Generar una tabla con el conteo de usuarios por cada país.
select Country as Pais, count(CustomerId) as Usuarios
from Customer
group by Country
order by Usuarios DESC;

-- 11.	Encontrar cuantas canciones hay por cada género
select Genre.Name as Genero, COUNT(*) as Total
from Track
inner join Genre on Track.GenreId = Genre.GenreId
group by Genre.GenreId
order by Total DESC;
