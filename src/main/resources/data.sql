-- se limpia la bd para evitar conflictos en creación e inserción a las tablas
drop all objects;

---------------- Creación de las tablas de la base de datos

-- Creación de la tabla colegio
Create table colegio(
	id bigint primary key,
	nombre varchar(100) not null
);

-- Creación de la tabla curso
Create table curso (
	id bigint primary key,
	grado smallint not null,
	salon varchar(10) not null,
	id_colegio bigint not null
);

-- Creación de la tabla profesor
Create table profesor (
	id bigint primary key,
	nombre varchar(1000) not null
);

-- Creación de la tabla asignatura
Create table asignatura (
	id bigint primary key,
	nombre varchar(100) not null,
	id_curso bigint not null,
	id_profesor bigint not null
);

-- Creación de la tabla estudiante
Create table estudiante (
	id bigint primary key,
	nombre varchar(1000) not null
);

-- Creación de la tabla asignatura_estudiante
Create table asignatura_estudiante (
	id_asignatura bigint not null,
	id_estudiante bigint not null,
	primary key (id_asignatura,id_estudiante)
);


------------------ Creación de las llaves foraneas
-- Asignación  de la llave foránea de colegio a la tabla curso
alter table curso add foreign key (id_colegio) references colegio (id);

-- Asignación  de la llave foránea de curso a la tabla asignatura
alter table asignatura add foreign key (id_curso) references curso (id);

-- Asignación  de la llave foránea de profesor a la tabla asignatura
alter table asignatura add foreign key (id_profesor) references profesor (id);

-- Asignación  de la llave foránea de asignatura a la tabla asignatura_estudiante
alter table asignatura_estudiante add foreign key (id_asignatura) references asignatura (id);

-- Asignación  de la llave foránea de estudiante a la tabla asignatura_estudiante
alter table asignatura_estudiante add foreign key (id_estudiante) references estudiante (id);

-------------------  Creación de las insersiones a las tablas

-- inserción del colegio
insert into colegio (id,nombre) values (1, 'El colegio del Olimpo');

-- inserciones para la tabla curso
insert into curso (id, grado, salon,id_colegio) values (1, 10,'A',1),(2, 10,'B',1),(3, 11,'A',1),(4, 11,'B',1);

-- inserciones para la tabla profesor
insert into profesor (id,nombre) values (10,'Némesis'),(11,'Príapo'),(12,'Iris');

-- inserciones para la tabla asignatura
insert into asignatura (id, nombre, id_curso,id_profesor) values
(101,'Matemáticas',1,10),
(102,'Matemáticas',2,10),
(103,'Matemáticas',3,10),
(104,'Matemáticas',4,10),
(105,'Español',1,11),
(106,'Español',2,11),
(107,'Ingles básico',1,12),
(108,'Ingles avanzado',2,12),
(109,'Pre Icfes',3,10),
(110,'Pre Icfes',4,10);

-- inserciones para la tabla estudiante
insert into estudiante (id, nombre) values
(1000, 'Afrodita'),
(1001, 'Apolo'),
(1002, 'Ares'),
(1003, 'Artemisa'),
(1004, 'Atenea'),
(1005, 'Dionisio'),
(1006, 'Hefesto'),
(1007, 'Hera'),
(1008, 'Hermes'),
(1009, 'Hades'),
(1010, 'Poseidón'),
(1011, 'Zeus');

-- inserciones para la tabla asignatura_estudiante
insert into asignatura_estudiante (id_asignatura, id_estudiante) values
(101,1000),
(105,1000),
(107,1000),
(101,1001),
(105,1001),
(107,1001),
(101,1002),
(105,1002),
(107,1002),

(102,1003),
(106,1003),
(108,1003),
(102,1004),
(106,1004),
(108,1004),
(102,1005),
(106,1005),
(108,1005),

(103,1006),
(109,1006),
(103,1007),
(109,1007),

(104,1008),
(110,1008),
(104,1009),
(110,1009),
(104,1010),
(110,1010),
(104,1011),
(110,1011);