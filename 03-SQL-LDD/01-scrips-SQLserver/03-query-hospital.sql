CREATE DATABASE Hospital;
go

use Hospital;
go 

CREATE TABLE Doctor (
IdDoctor int not null,
Nombre nvarchar(45) not null,
Ap_Paterno nvarchar(45) not null,
Ap_Materno nvarchar(45) not null,
area nvarchar(45) not null, 

CONSTRAINT pk_Doctor
PRIMARY KEY (IdDoctor)
);

CREATE TABLE Paciente (
IdPaciente int not null,
Nombre nvarchar(45) not null,
Ap_Paterno nvarchar(45) not null,
Ap_Materno nvarchar(45) not null,

CONSTRAINT pk_Paciente 
PRIMARY KEY (IdPaciente)
);

CREATE TABLE Atencion (
IdAtencion int not null,
IdDoctor  int not null,
IdPaciente  int not null,
Fecha date not null,
Diagnostico nvarchar(45),

CONSTRAINT pk_Atencion
PRIMARY KEY(IdAtencion),

CONSTRAINT fk_Atencion_Doctor
FOREIGN KEY (IdDoctor)
REFERENCES Doctor(IdDoctor),

CONSTRAINT fk_Atencion_Paciente
FOREIGN KEY (IdPaciente)
REFERENCES Paciente(IdPaciente)
);
