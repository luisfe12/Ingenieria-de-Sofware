CREATE TABLE IF NOT EXISTS persona(
	dni varchar(8) NOT NULL PRIMARY KEY,
	nombre varchar(20) NOT NULL,
	apellido_paterno varchar(20) NOT NULL,
	apellido_materno varchar(20) NOT NULL,
    celular varchar(9)
);

INSERT INTO persona VALUES ('72185515','Jhoel Salomon','Tapara','Quispe','913165243');

CREATE TABLE IF NOT EXISTS doctor(
	codigo_doctor varchar(8) NOT NULL PRIMARY KEY,
	dni_doctor varchar(8) NOT NULL,
	especialidad varchar(20) NOT NULL,
	salario decimal(6,2) NOT NULL,
	horario_entrada time NOT NULL,
    horario_salida time NOT NULL,
	FOREIGN KEY (dni_doctor) REFERENCES persona(dni)
);

INSERT INTO doctor VALUES ('1','72185515','Pediatria',3500,'9:30','21:00');

CREATE TABLE IF NOT EXISTS trabajador(
	codigo_trabajador varchar(8) NOT NULL PRIMARY KEY,
	dni_trabajador varchar(8) NOT NULL,
	cargo varchar(20) NOT NULL,
	salario decimal(6,2) NOT NULL,
	horario_entrada time NOT NULL,
    horario_salida time NOT NULL,
	FOREIGN KEY (dni_trabajador) REFERENCES persona(dni)
);

INSERT INTO trabajador VALUES ('1','72185515','Recepcionista',3500,'9:30','21:00');

CREATE TABLE IF NOT EXISTS usuario(
	codigo_usuario varchar(8) NOT NULL PRIMARY KEY,
	dni_usuario varchar(8) NOT NULL,
	FOREIGN KEY (dni_usuario) REFERENCES persona(dni) 
);

INSERT INTO usuario VALUES ('1','72185515');

CREATE TABLE IF NOT EXISTS sala_virtual(
	codigo_sala varchar(8) NOT NULL PRIMARY KEY,
	codigo_usuario varchar(8) NOT NULL,
    codigo_doctor varchar(8) NOT NULL,
	especialidad varchar(20) NOT NULL,
	horario_inicio time NOT NULL,
    horario_final time NOT NULL,
	link_meet varchar(50) NOT NULL,   
	FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario),
	FOREIGN KEY (codigo_doctor) REFERENCES doctor(codigo_doctor)
);

INSERT INTO sala_virtual VALUES ('1','1','1','Pediatria','9:30','10:30','https://meet.google.com/wvj-axhd-rmt');

CREATE TABLE IF NOT EXISTS historia(
	codigo_historia varchar(8) NOT NULL PRIMARY KEY,
	codigo_usuario varchar(8) NOT NULL,
	FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario)
    
);

INSERT INTO historia VALUES ('1','1');

CREATE TABLE IF NOT EXISTS cita(
	codigo_cita varchar(8) NOT NULL PRIMARY KEY,
	codigo_historia varchar(8) NOT NULL,    
	codigo_doctor varchar(8) NOT NULL,
    fecha time NOT NULL,
	FOREIGN KEY (codigo_doctor) REFERENCES doctor(codigo_doctor),
    FOREIGN KEY (codigo_historia) REFERENCES historia(codigo_historia)
);

INSERT INTO cita VALUES ('1','1','1','2014-10-25 9:30');

CREATE TABLE IF NOT EXISTS medicamento(
	codigo_medicamento varchar(8) NOT NULL PRIMARY KEY,  
	precio decimal(6,2) NOT NULL,
	stock integer NOT NULL,
    indicaciones varchar(50) NOT NULL
);

INSERT INTO medicamento VALUES ('1',15.3,5,'tomar uno cada 8 horas.');

CREATE TABLE IF NOT EXISTS receta(
	codigo_receta varchar(8) NOT NULL PRIMARY KEY,
	observaciones varchar(20) NOT NULL,
    codigo_sala varchar(8) NOT NULL,
    codigo_usuario varchar(8) NOT NULL,
    codigo_doctor varchar(8) NOT NULL,  
	FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo_usuario),
	FOREIGN KEY (codigo_doctor) REFERENCES doctor(codigo_doctor)
);

INSERT INTO receta VALUES ('1','Ninguna','1','1','1');

CREATE TABLE IF NOT EXISTS linea_receta(
	numero_linea varchar(4) NOT NULL PRIMARY KEY,
	codigo_receta varchar(8) NOT NULL,    
	codigo_medicamento varchar(8) NOT NULL,
	cantidad integer NOT NULL,
    indicaciones varchar(50) NOT NULL,
	FOREIGN KEY (codigo_medicamento) REFERENCES medicamento(codigo_medicamento),
	FOREIGN KEY (codigo_receta) REFERENCES receta(codigo_receta)
);

INSERT INTO linea_receta VALUES ('1','1','1','10','Debe tomarlo dos veces al dia en ayunas');





