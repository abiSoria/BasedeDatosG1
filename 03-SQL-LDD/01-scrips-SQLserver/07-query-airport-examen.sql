CREATE DATABASE AIRPORT;
GO

USE AIRPORT;
GO

CREATE TABLE AIRPORT(
    AirportCode int PRIMARY KEY,
    CityAirport nvarchar(50) not null,
    StateAirport nvarchar(50)not null,
	NameAirport nvarchar(50)not null,
);
GO

CREATE TABLE AIRPLANE_TYP(
Type_name_AIRPLANE_TYP int PRIMARY KEY,
Company nvarchar(50) not null,
Max__seat nvarchar not null
);
GO

CREATE TABLE CAN_LAND(
NumCan_land int PRIMARY KEY,
AirportCode int not null,
Type_name_AIRPLANE_TYP int not null,
CONSTRAINT fk_can_land_airport
FOREIGN KEY (AirportCode) 
REFERENCES AIRPORT(AirportCode),
FOREIGN KEY (Type_name_AIRPLANE_TYP) 
REFERENCES AIRPLANE_TYP(Type_name_AIRPLANE_TYP)
);
GO

CREATE TABLE AIRPLANE(
AirplaneId int PRIMARY KEY,
Total_no_of_seat nvarchar(50) not null,
Type_name_AIRPLANE_TYP int not null,
FOREIGN KEY (Type_name_AIRPLANE_TYP) 
REFERENCES AIRPLANE_TYP(Type_name_AIRPLANE_TYP)
);
go

CREATE TABLE FLIGHT_LEG(
Leg_no int PRIMARY KEY,
AirportCode int not null,
NumerFlingt int not null,
Departure_airport nvarchar(50)not null,
Arrival_airport nvarchar(50)not null,
FOREIGN KEY (AirportCode) 
REFERENCES AIRPORT(AirportCode),
FOREIGN KEY (NumerFlingt) 
REFERENCES FLIGHT(NumerFlingt)
);
GO

CREATE TABLE FLIGHT(
NumerFlingt int PRIMARY KEY,
Airline nvarchar(50) not null,
WeekDays date not null
);
GO

CREATE TABLE FARE(
Core int PRIMARY KEY,
Amount nvarchar(50) not null,
Restrictions nvarchar(100) not null,
NumerFlingt int not null,
FOREIGN KEY (NumerFlingt) 
REFERENCES FLIGHT(NumerFlingt)
);
GO

CREATE TABLE LEG_INSTANCE(
Date_Leg_Instase int PRIMARY KEY,
No_fo_avail_seats nvarchar(50) not null,
Dep_time time not null,
Arr_time time not null,

Leg_no int not null,
AirportCode int not null,
AirplaneId int not null,
NumerFlingt int not null,
Departure_airport nvarchar(50)not null,
Arrival_airport nvarchar(50)not null,
Departs_airport int,
Arrives_airport int,
FOREIGN KEY (Leg_no)
REFERENCES FLIGHT_LEG(Leg_no),
FOREIGN KEY (AirportCode)
REFERENCES AIRPORT(AirportCode),
FOREIGN KEY (AirplaneId)
REFERENCES AIRPLANE(AirplaneId),
FOREIGN KEY (NumerFlingt)
REFERENCES FLIGHT(NumerFlingt),
FOREIGN KEY (Leg_no)
REFERENCES FLIGHT_LEG(Leg_no),
);
GO

CREATE TABLE SEAT(
Seat_no int PRIMARY KEY,
Date_Leg_Instase int NOT NULL,
Leg_no int not null,
AirportCode int not null,
AirplaneId int not null,
NumerFlingt int not null,
Departs_airport int,
Arrives_airport int,
eparture_airport nvarchar(50)not null,
Arrival_airport nvarchar(50)not null,
FOREIGN KEY (Date_Leg_Instase)
REFERENCES LEG_INSTANCE(Date_Leg_Instase),
);
GO