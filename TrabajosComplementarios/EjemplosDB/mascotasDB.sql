use mascotas;

create table tb_mascota(
	id int auto_increment primary key,
    cod varchar(5) not null,
    nombre varchar(50) not null,
    nacimiento date not null,
    color varchar(20) not null,
    estado varchar(20) not null
);

-- Tabla gato
create table tb_gato(
	id_gato int auto_increment primary key,
    raza varchar(25) not null,
    id_mascota int not null,
    foreign key (id_mascota) references tb_mascota(id)
);

-- Tabla perro
create table tb_perro(
	id_perro int auto_increment primary key,
    raza varchar(25) not null,
    pedigree boolean,
    id_mascota int not null,
    foreign key(id_mascota) references tb_mascota(id)
);

-- Registros para la tabla tb_mascota
insert into tb_mascota(cod, nombre, nacimiento, color, estado) values
('M001', 'Luna', '2019-05-10', 'Negro', 'Activo'),
('M002', 'Bobby', '2020-02-15', 'Blanco', 'Activo'),
('M003', 'Max', '2018-11-20', 'Marrón', 'Activo'),
('M004', 'Toby', '2021-08-25', 'Gris', 'Activo'),
('M005', 'Milo', '2017-04-30', 'Atigrado', 'Inactivo'),
('M006', 'Coco', '2019-10-12', 'Blanco y Negro', 'Activo'),
('M007', 'Lola', '2020-09-08', 'Naranja', 'Activo'),
('M008', 'Simba', '2016-12-03', 'Dorado', 'Activo'),
('M009', 'Bella', '2018-07-19', 'Negro y Blanco', 'Activo'),
('M010', 'Rocky', '2015-03-28', 'Gris', 'Activo'),
('M011', 'Nina', '2019-08-15', 'Blanco y Negro', 'Activo'),
('M012', 'Tommy', '2020-06-22', 'Marrón', 'Activo'),
('M013', 'Lucy', '2017-11-05', 'Gris', 'Activo'),
('M014', 'Leo', '2021-01-30', 'Naranja', 'Activo'),
('M015', 'Mia', '2018-03-17', 'Negro', 'Activo'),
('M016', 'Charlie', '2019-09-28', 'Blanco', 'Activo'),
('M017', 'Daisy', '2020-12-10', 'Atigrado', 'Activo'),
('M018', 'Jack', '2016-05-14', 'Negro y Blanco', 'Activo'),
('M019', 'Molly', '2018-10-03', 'Gris', 'Activo'),
('M020', 'Oscar', '2015-07-22', 'Dorado', 'Activo');

-- Registros para la tabla tb_gato
insert into tb_gato(raza, id_mascota) values
('Siamés', 1),
('Persa', 2),
('Maine Coon', 3),
('Bengala', 4),
('Siberiano', 5),
('Ragdoll', 6),
('Azul Ruso', 7),
('Sphynx', 8),
('Angora', 9),
('British Shorthair', 10);

-- Registros para la tabla tb_perro
insert into tb_perro(raza, pedigree, id_mascota) values
('Labrador Retriever', true, 11),
('Bulldog Francés', false, 12),
('Golden Retriever', true, 13),
('Pastor Alemán', true, 14),
('Chihuahua', false, 15),
('Poodle', true, 16),
('Dálmata', true, 17),
('Boxer', false, 18),
('Pug', true, 19),
('Bull Terrier', false, 20);


-- drop table tb_mascota;

select * from tb_mascota;
select * from tb_gato;
select * from tb_perro;

-- Actualizar registro
UPDATE tb_mascota SET estado='Activo' WHERE id=5;

-- Eliminar registro
delete from tb_gato where id_mascota=(select id from tb_mascota where nombre='Lola');

-- La siguiente consulta no funciona
-- delete from tb_mascota where nombre='Lola';
delete from tb_mascota where id=7;

select m.id, m.nombre, m.nacimiento, g.raza
from tb_mascota as m
join tb_gato as g
on m.id=g.id_mascota;

select m.id, m.nombre, m.nacimiento, p.raza, p.pedigree
from tb_mascota as m
join tb_perro as p
on m.id=p.id_mascota;

SELECT m.nombre, m.nacimiento, p.raza AS raza_perro, g.raza AS raza_gato
FROM tb_mascota m
LEFT JOIN tb_perro p ON m.id = p.id_mascota
LEFT JOIN tb_gato g ON m.id = g.id_mascota;