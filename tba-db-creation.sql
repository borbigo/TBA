CREATE TABLE EMPLOYEE (
    Age INT,
    SSN CHAR(9),
    Name VARCHAR(20),
    Gender VARCHAR(20),
    Type VARCHAR(20),
    ID INT,
    PRIMARY KEY (ID)
);

INSERT INTO EMPLOYEE (Age, SSN, Name, Gender, Type, ID) VALUES
(28, '123456789', 'Alice Johnson', 'Female', 'Manager', 1001),
(35, '987654321', 'Bob Smith', 'Male', 'Trainer', 1002),
(22, '111223344', 'Charlie Davis', 'Male', 'Front Desk', 1003),
(30, '555666777', 'Diana White', 'Female', 'Janitor', 1004),
(40, '444333222', 'Edward Turner', 'Male', 'Trainer', 1005),
(27, '777888999', 'Fiona Brown', 'Female', 'Front Desk', 1006),
(26, '666555444', 'George Lee', 'Male', 'Trainer', 1007),
(31, '999000111', 'Hannah Miller', 'Female', 'Manager', 1008),
(29, '222111000', 'Ian Brown', 'Male', 'Front Desk', 1009),
(33, '888999000', 'Jessica Taylor', 'Female', 'Trainer', 1010);

CREATE TABLE CLASS (
    ID INT,
    Type VARCHAR(20),
    Time VARCHAR(11), -- Assuming Assuming format ex: 05:00-09:00
    Location VARCHAR(20),
    Day VARCHAR(2),
    PRIMARY KEY (ID)
);

CREATE TABLE GYM (
    Name VARCHAR(20),
    Location VARCHAR(20),
    Hours VARCHAR(11), -- Assuming format ex: 05:00-09:00
    PRIMARY KEY (Location)
);

INSERT INTO GYM (Name, Location, Hours) VALUES
('TBA', 'New York', '7:00-9:00'),
('TBA', 'Los Angeles', '6:00-8:00'),
('TBA', 'Chicago', '8:00-10:00'),
('TBA', 'Houston', '9:00-11:00'),
('TBA', 'Miami', '7:30-9:30'),
('TBA', 'Seattle', '6:30-8:30'),
('TBA', 'Portland', '8:30-10:30'),
('TBA', 'San Francisco', '9:30-11:30'),
('TBA', 'Washington, D.C.', '7:00-9:00'),
('TBA', 'Boston', '6:00-8:00');

CREATE TABLE GEAR (
    Name VARCHAR(20),
    Price DECIMAL(5,2), -- Assuming maximum price is $999.99
    Size CHAR(1),
    Gender VARCHAR(20),
    PRIMARY KEY (Name)
);

CREATE TABLE ROOM (
    Name VARCHAR(20),
    Type VARCHAR(20),
    Hours_Reserved VARCHAR(11), -- Assuming format ex: 05:00-09:00
    PRIMARY KEY (Name)
);

CREATE TABLE MEMBER (
    SSN CHAR(9),
    Name VARCHAR(20),
    ID INT,
    Age INT,
    Birthday DATE,
    Gender VARCHAR(20),
    PRIMARY KEY (ID)
);

INSERT INTO MEMBER (SSN, Name, ID, Age, Birthday, Gender) VALUES
('123456789', 'John Doe', 00001, 25, '1998-05-15', 'Male'),
('987654321', 'Jane Smith', 00002, 30, '1993-11-20', 'Female'),
('111223344', 'Mike Johnson', 00003, 22, '2001-08-10', 'Male'),
('555666777', 'Emily White', 00004, 28, '1995-03-05', 'Female'),
('444333222', 'Alex Turner', 00005, 35, '1988-12-02', 'Male'),
('777888999', 'Sarah Brown', 00006, 29, '1994-06-18', 'Female'),
('666555444', 'Daniel Lee', 00007, 26, '1997-09-25', 'Male'),
('999000111', 'Amanda Miller', 00008, 31, '1992-04-12', 'Female'),
('222111000', 'Chris Brown', 00009, 27, '1996-01-08', 'Male'),
('888999000', 'Jessica Taylor', 00010, 33, '1989-07-30', 'Female');

CREATE TABLE EQUIPMENT (
    Name VARCHAR(20),
    Weight INT,
    Type VARCHAR(20),
    PRIMARY KEY (Name)
);





