create table usuario(id_usuario int primary key, nombre_usuario varchar(30) not null,
 ap_paterno varchar(30) not null,ap_materno varchar(30) not null,colonia varchar(30) not null, calle varchar(30) not null, 
 codigo_postal varchar(30) not null, telefono int not null );
 
create table empresa(id_empresa int primary key, nombre_empresa varchar(30) not null, colonia varchar(30) not null, calle varchar(30) not null, c_p int not null,nombre_encargado varchar(50) not null,telefono_encargado int not null);

create table turnos(id_turno int primary key,turno varchar(30) not null , horas_trabajadas time not null, horas_extras time not null,id_empresa int,id_usuario int, foreign key(id_empresa) references empresa(id_empresa),foreign key(id_usuario) references usuario(id_usuario));

create table pago(id_pago int primary key,monto DECIMAL(10,2) not null, metodo_pago varchar(30) not null, fecha_pago TIMESTAMP not null,id_usuario int, foreign key(id_usuario) references usuario(id_usuario));

create table transporte(id_transporte int primary key, nombre_chofer varchar(30) not null, tipo_camioneta varchar(30) not null, salario decimal(10,2) not null, viajes_realizados int not null, telefono int not null);

alter table empresa add id_transporte int;
alter table empresa add CONSTRAINT fk_transporte foreign key(id_transporte) references transporte(id_transporte);

alter table empresa add id_trabajador int;
alter table empresa add CONSTRAINT id_trabajador foreign key(id_trabajador) references trabajadores(id_trabajador);
create table trabajadores(id_trabajador int primary key, nombre varchar(30) not null, ap_paterno varchar(30) not null, ap_materno varchar(30) not null, puesto varchar(30) not null,id_turno int,id_pago int,foreign key(id_turno) references turnos(id_turno),foreign key(id_pago) references pago(id_pago));
 

 
 create database integradora;
 
 \c integradora;
 
 create table usuario(id_usuario int primary key,id_pago int,nombre_usuario varchar(30) not null,
 ap_paterno varchar(30) not null,ap_materno varchar(30) not null,puesto varchar(50) not null,colonia varchar(30) not null, calle varchar(30) not null, 
 codigo_postal varchar(30) not null, telefono int not null,id_transporte int);
 
 alter table usuario add CONSTRAINT id_pago foreign key(id_pago) references pago(id_pago);
 alter table usuario add CONSTRAINT id_transporte foreign key(id_transporte) references transporte(id_transporte);
 
 
 
 
 create table turnos(id_turno int primary key,turno varchar(30) not null , horas_trabajadas time not null,
 horas_extras time not null);
 
 create table pago(id_pago int primary key,monto DECIMAL(10,2) not null, metodo_pago varchar(30) not null, 
 fecha_pago TIMESTAMP not null);
 
 create table transporte(id_transporte int primary key, nombre_chofer varchar(30) not null, tipo_camioneta varchar(30) not null,
 salario decimal(10,2) not null, viajes_realizados int not null, telefono int not null);

 
 
 
 
 
 
 
 
 create table empresa(id_empresa int primary key,id_usuario int,id_turno int,id_transporte int, nombre_empresa varchar(30) not null, colonia varchar(30) not null, calle varchar(30) not null,
 c_p int not null,nombre_encargado varchar(50) not null,telefono_encargado int not null, foreign key(id_usuario) references usuario(id_usuario));
 
 
 
 alter table empresa add CONSTRAINT id_usuario foreign key(id_usuario) references usuario(id_usuario);
  alter table empresa add CONSTRAINT id_turno foreign key(id_turno) references turnos(id_turno);
  alter table empresa add CONSTRAINT id_transporte foreign key(id_transporte) references transporte(id_transporte);
 
 