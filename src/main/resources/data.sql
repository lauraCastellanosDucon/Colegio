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
insert into colegio (id,nombre) values (1, 'colegio atlantis');

-- inserciones para la tabla curso
insert into curso (id, grado, salon,id_colegio) values (1, 8,'A',1),(2, 8,'B',1),(3, 8,'C',1),(4, 8,'D',1);

-- inserciones para la tabla profesor
insert into profesor (id,nombre) values (10,'juan'),(11,'luisa'),(12,'pedro'),(13,'maria'),(14,'jose');

-- inserciones para la tabla asignatura
insert into asignatura (id, nombre, id_curso,id_profesor) values (101,'Física',1,10),(102,'Química',2,11),(103,'Matemáticas',3,12),(104,'Español',4,13),(105,'Historia',2,14);

-- inserciones para la tabla estudiante
insert into estudiante (id, nombre) values (1000, 'alexander'),(1001, 'brenda'),(1002, 'camilo'), (1003, 'diana'),(1004, 'esteban'), (1005, 'francy');

-- inserciones para la tabla asignatura_estudiante
insert into asignatura_estudiante (id_asignatura, id_estudiante) values (101,1000),(102,1001),(103,1002),(103,1005),(104,1003),(105,1002),(105,1005),(101,1004);

