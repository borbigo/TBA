--TOTAL BODY ATHLETICS CREATION DOCUMENTATION: 

--EMPLOYEE: 
CREATE TABLE IF NOT EXISTS EMPLOYEE (
    Age INT,
    SSN CHAR(11),
    Name VARCHAR(20),
    Gender VARCHAR(20),
    Type VARCHAR(20),
    ID INT,
    Location VARCHAR(20) NOT NULL,
    ClassID INT, 
    PRIMARY KEY (ID),
    FOREIGN KEY(ClassID) REFERENCES CLASS(ID),
    FOREIGN KEY(Location) REFERENCES GYM(Location) 
);

INSERT INTO EMPLOYEE (Age, SSN, Name, Gender, Type, ID, Location, ClassID) VALUES
(30, '542-24-8975', 'John Smith', 'Male', 'Manager', 101, 'Bellevue', 1001),
(25, '789-45-2310', 'Emma Johnson', 'Female', 'Trainer', 102, 'Bellingham', 1002),
(35, '654-32-1098', 'Michael Williams', 'Male', 'Janitor', 103, 'Bothell', 1003),
(28, '890-12-3456', 'Sophia Brown', 'Female', 'Receptionist', 104, 'Burien', 1004),
(33, '123-45-6789', 'William Davis', 'Male', 'Trainer', 105, 'Everett', 1005),
(29, '567-89-0123', 'Olivia Garcia', 'Female', 'Manager', 106, 'Kirkland', 1006),
(27, '432-10-9876', 'James Martinez', 'Male', 'Janitor', 107, 'Renton', 1007),
(31, '210-98-7654', 'Ava Jones', 'Female', 'Trainer', 108, 'Seattle', 1008),
(26, '876-54-3210', 'Ethan Miller', 'Male', 'Receptionist', 109, 'Tacoma', 1009),
(32, '109-87-6543', 'Isabella Wilson', 'Female', 'Manager', 110, 'Tukwila', 1010),
(34, '456-78-9012', 'Liam Anderson', 'Male', 'Janitor', 111, 'Bellevue', 1011),
(30, '987-65-4321', 'Mia Thomas', 'Female', 'Trainer', 112, 'Bellingham', 1012),
(29, '321-09-8765', 'Elijah Jackson', 'Male', 'Receptionist', 113, 'Bothell', 1013),
(27, '543-21-0987', 'Amelia White', 'Female', 'Manager', 114, 'Burien', 1014),
(35, '876-54-3210', 'Noah Taylor', 'Male', 'Janitor', 115, 'Everett', 1015),
(26, '210-98-7654', 'Charlotte Moore', 'Female', 'Trainer', 116, 'Kirkland', 1016),
(33, '654-32-1098', 'Lucas Lee', 'Male', 'Receptionist', 117, 'Renton', 1017),
(28, '890-12-3456', 'Harper Adams', 'Female', 'Manager', 118, 'Seattle', 1018),
(31, '432-10-9876', 'Evelyn Garcia', 'Female', 'Janitor', 119, 'Tacoma', 1019),
(27, '123-45-6789', 'Alexander Brown', 'Male', 'Trainer', 120, 'Tukwila', 1020),
(29, '567-89-0123', 'Aria Clark', 'Female', 'Receptionist', 121, 'Bellevue', 1021),
(30, '109-87-6543', 'William Rodriguez', 'Male', 'Manager', 122, 'Bellingham', 1022),
(32, '789-45-2310', 'Luna Hernandez', 'Female', 'Janitor', 123, 'Bothell', 1023),
(28, '432-10-9876', 'Mason Flores', 'Male', 'Trainer', 124, 'Burien', 1024),
(34, '654-32-1098', 'Grace Parker', 'Female', 'Receptionist', 125, 'Everett', 1025),
(26, '210-98-7654', 'Oliver Wood', 'Male', 'Manager', 126, 'Kirkland', 1026),
(33, '109-87-6543', 'Hazel Hill', 'Female', 'Janitor', 127, 'Renton', 1027),
(31, '876-54-3210', 'Scarlett Turner', 'Female', 'Trainer', 128, 'Seattle', 1028),
(27, '123-45-6789', 'Logan Powell', 'Male', 'Receptionist', 129, 'Tacoma', 1029),
(29, '567-89-0123', 'Chloe Stewart', 'Female', 'Manager', 130, 'Tukwila', 1030);


----------------------------------------------------------------------------------------------------------------------------


--CLASS: 
CREATE TABLE IF NOT EXISTS CLASS (
    ID INT,
    Type VARCHAR(20),
    Time VARCHAR(11), -- Assuming Assuming format ex: 05:00-09:00
    Room INT, -- Will be the location in the gym (i.e. court)
    Day VARCHAR(2),
    Branch VARCHAR(20) NOT NULL, -- Will be the branch the class is in
    PRIMARY KEY (ID),
    FOREIGN KEY(Branch) REFERENCES GYM(Location),
    FOREIGN KEY(Room) REFERENCES ROOM(RoomID)
);

INSERT INTO CLASS (ID, Type, Time, Room, Day, Branch) VALUES
(1001, 'Kickboxing', '08:00-09:00', 1, 'Mo', 'Bellevue'),
(1002, 'Running', '07:00-08:00', 2, 'Tu', 'Bellingham'),
(1003, 'Weight Training', '18:00-19:00', 3, 'We', 'Bothell'),
(1004, 'Basketball', '17:00-18:00', 4, 'Th', 'Burien'),
(1005, 'Yoga', '09:00-10:00', 5, 'Fr', 'Everett'),
(1006, 'Zumba', '16:00-17:00', 6, 'Sa', 'Kirkland'),
(1007, 'Pilates', '12:00-13:00', 7, 'Su', 'Renton'),
(1008, 'Cycling', '06:00-07:00', 8, 'Mo', 'Seattle'),
(1009, 'HIIT', '19:00-20:00', 9, 'Tu', 'Tacoma'),
(1010, 'Dance', '14:00-15:00', 10, 'We', 'Tukwila'),
(1011, 'Boxing', '07:30-08:30', 1, 'Th', 'Bellevue'),
(1012, 'CrossFit', '17:30-18:30', 2, 'Fr', 'Bellingham'),
(1013, 'Aerobics', '09:30-10:30', 3, 'Sa', 'Bothell'),
(1014, 'Martial Arts', '18:30-19:30', 4, 'Su', 'Burien'),
(1015, 'Piloxing', '13:30-14:30', 5, 'Mo', 'Everett'),
(1016, 'Functional Training', '08:30-09:30', 6, 'Tu', 'Kirkland'),
(1017, 'Spinning', '19:30-20:30', 7, 'We', 'Renton'),
(1018, 'Bootcamp', '15:30-16:30', 8, 'Th', 'Seattle'),
(1019, 'Barre', '10:30-11:30', 9, 'Fr', 'Tacoma'),
(1020, 'Taekwondo', '16:30-17:30', 10, 'Sa', 'Tukwila'),
(1021, 'TRX', '11:00-12:00', 1, 'Su', 'Bellevue'),
(1022, 'Plyometrics', '17:00-18:00', 2, 'Mo', 'Bellingham'),
(1023, 'Gymnastics', '14:00-15:00', 3, 'Tu', 'Bothell'),
(1024, 'Circuit Training', '19:00-20:00', 4, 'We', 'Burien'),
(1025, 'Swimming', '08:00-09:00', 5, 'Th', 'Everett'),
(1026, 'MMA', '16:00-17:00', 6, 'Fr', 'Kirkland'),
(1027, 'Stretching', '12:00-13:00', 7, 'Sa', 'Renton'),
(1028, 'Core Workout', '18:00-19:00', 8, 'Su', 'Seattle'),
(1029, 'Hiking', '07:30-08:30', 9, 'Mo', 'Tacoma'),
(1030, 'Paddleboarding', '17:30-18:30', 10, 'Tu', 'Tukwila');


----------------------------------------------------------------------------------------------------------------------------


--GYM: 
CREATE TABLE IF NOT EXISTS GYM (
    Name VARCHAR(20),
    Location VARCHAR(20),
    Hours VARCHAR(11), -- Assuming format ex: 05:00-09:00
    PRIMARY KEY (Location)
);

INSERT INTO GYM (Name, Location, Hours) VALUES
('TBA', 'Seattle', '7:00-9:00'),
('TBA', 'Bellevue', '6:00-8:00'),
('TBA', 'Everett', '8:00-10:00'),
('TBA', 'Renton', '9:00-11:00'),
('TBA', 'Tacoma', '7:30-9:30'),
('TBA', 'Bellingham', '6:30-8:30'),
('TBA', 'Bothell', '8:30-10:30'),
('TBA', 'Kirkland', '9:30-11:30'),
('TBA', 'Tukwila', '7:00-9:00'),
('TBA', 'Burien', '6:00-8:00');

----------------------------------------------------------------------------------------------------------------------------

--GEAR:
CREATE TABLE IF NOT EXISTS GEAR (
    Name VARCHAR(20),
    ItemID INT,
    Price DECIMAL(5,2), -- Assuming maximum price is $999.99
    Size VARCHAR(2), -- needs to be var 2 since could be S/XS
    Gender VARCHAR(20),
    Branch VARCHAR(20) NOT NULL, --	
    PRIMARY KEY (ItemID),
    FOREIGN KEY(Branch) REFERENCES GYM(Location)
);

INSERT INTO GEAR (Name, ItemID, Price, Size, Gender, Branch) VALUES
('Hoodie', 101, 39.99, 'M', 'Unisex', 'Bellevue'),
('Weight Training Gloves', 102, 19.99, 'L', 'Unisex', 'Bellingham'),
('Yoga Mat', 103, 29.99, 'S', 'Unisex', 'Bothell'),
('Total Body Athletics T-shirt', 104, 24.99, 'M', 'Unisex', 'Burien'),
('Headband', 105, 9.99, 'One Size', 'Unisex', 'Everett'),
('Water Bottle', 106, 14.99, '500ml', 'Unisex', 'Kirkland'),
('Compression Socks', 107, 17.99, 'S', 'Unisex', 'Renton'),
('Gym Bag', 108, 34.99, 'L', 'Unisex', 'Seattle'),
('Training Shoes', 109, 79.99, '9', 'Men', 'Tacoma'),
('Workout Leggings', 110, 44.99, 'M', 'Women', 'Tukwila'),
('Total Body Athletics Cap', 111, 19.99, 'One Size', 'Unisex', 'Bellevue'),
('Weightlifting Belt', 112, 29.99, 'L', 'Unisex', 'Bellingham'),
('Resistance Bands Set', 113, 49.99, 'One Size', 'Unisex', 'Bothell'),
('Jump Rope', 114, 12.99, 'Adjustable', 'Unisex', 'Burien'),
('Total Body Athletics Tank Top', 115, 22.99, 'S', 'Women', 'Everett');


----------------------------------------------------------------------------------------------------------------------------

--ROOM: 
CREATE TABLE IF NOT EXISTS ROOM (
    RoomID INT, 
    Name VARCHAR(20),
    Type VARCHAR(20),
    Hours_Reserved VARCHAR(11), -- Assuming format ex: 05:00-09:00
    Branch VARCHAR(20) NOT NULL, -- Let's them know which branch has this room
    PRIMARY KEY (RoomID),
    FOREIGN KEY(Branch) REFERENCES GYM(Location)
);

INSERT INTO ROOM (RoomID, Name, Type, Hours_Reserved, Branch) VALUES
(1, 'Cardio Studio', 'Cardio', '08:00-10:00', 'Bellevue'),
(2, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Bellingham'),
(3, 'Yoga Room', 'Yoga', '09:00-12:00', 'Bothell'),
(4, 'Boxing Arena', 'Boxing', '16:00-18:00', 'Burien'),
(5, 'Cycling Studio', 'Cycling', '10:00-11:30', 'Everett'),
(6, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Kirkland'),
(7, 'Group Exercise Room', 'Group Exercise', '11:30-13:30', 'Renton'),
(8, 'Pilates Studio', 'Pilates', '09:00-11:00', 'Seattle'),
(9, 'Meditation Room', 'Mindfulness', '15:00-17:00', 'Tacoma'),
(10, 'CrossFit Box', 'CrossFit', '12:00-14:00', 'Tukwila');

INSERT INTO ROOM(RoomID, Name, Type, Hours_Reserved, Branch) VALUES
(11, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Bellevue'),
(12, 'Yoga Room', 'Yoga', '09:00-12:00', 'Bellevue'),
(13, 'Basketball Court', 'Sports', '13:00-14:00', 'Bellevue'),
(14, 'Cycling Studio', 'Cycling', '07:00-08:00', 'Bellevue'),
(15, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Bellevue'),
(16, 'Basketball Court', 'Sports', '13:00-15:00', 'Bellingham'),
(17, 'Yoga Room', 'Yoga', '09:00-12:00', 'Bellingham'),
(18, 'Basketball Court', 'Sports', '13:00-14:00', 'Bellingham'),
(19, 'Cycling Studio', 'Cycling', '07:00-08:00', 'Bellingham'),
(20, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Bellingham'),
(21, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Bothell'),
(22, 'Yoga Room', 'Yoga', '09:00-12:00', 'Bothell'),
(23, 'Basketball Court', 'Sports', '13:00-14:00', 'Bothell'),
(24, 'Cycling Studio', 'Cycling', '07:00-08:00', 'Bothell'),
(25, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Bothell'),
(26, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Burien'),
(27, 'Yoga Room', 'Yoga', '09:00-12:00', 'Burien'),
(28, 'Basketball Court', 'Sports', '13:00-14:00', 'Burien'),
(29, 'Cycling Studio', 'Cycling', '07:00-08:00', 'Burien'),
(30, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Burien'),
(31, 'Weight Training Area', 'Weight Training' '13:00-15:00', 'Everett'),
(32, 'Yoga Room', 'Yoga', '09:00-12:00', 'Everett'),
(33, 'Basketball Court', 'Sports', '13:00-14:00', 'Everett'),
(34, 'Tennis Courts', 'Sports', '07:00-08:00', 'Everett'),
(35, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Everett'),
(36, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Kirkland'),
(37, 'Yoga Room', 'Yoga', '09:00-12:00', 'Kirkland'),
(38, 'Basketball Court', 'Sports', '13:00-14:00', 'Kirkland'),
(39, 'Cycling Studio', 'Cycling', '07:00-08:00', 'Kirkland'),
(40, 'Turf Field', 'Sports', 03:00-05:00', 'Kirkland'),
(41, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Renton'),
(42, 'Yoga Room', 'Yoga', '09:00-12:00', 'Renton'),
(43, 'Basketball Court', 'Sports', '13:00-14:00', 'Renton'),
(44, 'Cycling Studio', 'Cycling', '7:00-8:00', 'Renton'),
(45, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Renton'),
(46, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Seattle'),
(47, 'Yoga Room', 'Yoga', '09:00-12:00', 'Seattle'),
(48, 'Basketball Court', 'Sports', '13:00-14:00', 'Seattle'),
(49, 'Cycling Studio', 'Cycling', '7:00-8:00', 'Seattle'),
(50, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Seattle'),
(51, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Tacoma'),
(52, 'Yoga Room', 'Yoga', '09:00-12:00', 'Tacoma'),
(53, 'Basketball Court', 'Sports', '13:00-14:00', 'Tacoma'),
(54, 'Cycling Studio', 'Cycling', '7:00-8:00', 'Tacoma'),
(55, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Tacoma'),
(56, 'Weight Training Area', 'Weight Training', '13:00-15:00', 'Tukwila'),
(57, 'Yoga Room', 'Yoga', '09:00-12:00', 'Tukwila'),
(58, 'Basketball Court', 'Sports', '13:00-14:00', 'Tukwila'),
(59, 'Cycling Studio', 'Cycling', '7:00-8:00', 'Tukwila'),
(60, 'Functional Training Area', 'Functional Training', '14:00-16:00', 'Tukwila');

—----------------------------------------------------------------------------------------------------------------------------

--MEMBER:
CREATE TABLE IF NOT EXISTS MEMBER (
    SSN CHAR(9),
    Name VARCHAR(20),
    ID INT,
    Age INT,
    Birthday DATE,
    Gender VARCHAR(20),
    Reserved INT, 
    PRIMARY KEY (ID),
    FOREIGN KEY(Reserved) REFERENCES ROOM(RoomID)
);


INSERT INTO MEMBER (SSN, Name, ID, Age, Birthday, Gender, Reserved) VALUES
('123456789', 'Alice Johnson', 1001, 25, '1998-04-15', 'Female', 5),
('234567890', 'Bob Smith', 1002, 30, '1993-09-22', 'Male', 8),
('345678901', 'Claire Williams', 1003, 28, '1995-12-10', 'Female', 3),
('456789012', 'David Brown', 1004, 22, '2001-07-05', 'Male', 6),
('567890123', 'Emma Davis', 1005, 35, '1988-11-30', 'Female', NULL),
('678901234', 'Frank Miller', 1006, 29, '1994-03-18', 'Male', 2),
('789012345', 'Grace Wilson', 1007, 27, '1996-06-25', 'Female', 7),
('890123456', 'Henry Moore', 1008, 33, '1989-10-12', 'Male', 4),
('901234567', 'Isabel Taylor', 1009, 26, '1997-01-20', 'Female', 1),
('012345678', 'Jack Anderson', 1010, 31, '1992-08-08', 'Male', 10),
('123454321', 'Sophia Martinez', 1011, 24, '1999-05-28', 'Female', NULL),
('234543210', 'Thomas Garcia', 1012, 32, '1991-02-14', 'Male', 8),
('345432109', 'Olivia Rodriguez', 1013, 27, '1996-07-17', 'Female', 3),
('456321098', 'William Hernandez', 1014, 23, '2000-09-03', 'Male', 6),
('567210987', 'Ava Lopez', 1015, 34, '1987-12-25', 'Female', 9),
('678109876', 'Noah Gonzalez', 1016, 28, '1994-04-20', 'Male', 2),
('789098765', 'Charlotte Perez', 1017, 26, '1997-10-05', 'Female', NULL),
('890987654', 'James Torres', 1018, 32, '1991-01-15', 'Male', 4),
('901876543', 'Mia Flores', 1019, 25, '1998-06-12', 'Female', 1),
('012765432', 'Ethan Ramirez', 1020, 30, '1993-03-08', 'Male', 10),
('123876543', 'Liam Evans', 1021, 29, '1994-08-02', 'Male', 8),
('234987654', 'Harper Collins', 1022, 27, '1996-11-27', 'Female', 3),
('345098765', 'Evelyn Murphy', 1023, 24, '1999-04-18', 'Female', 6),
('456109876', 'Michael Cook', 1024, 33, '1989-09-10', 'Male', 9),
('567210987', 'Emily Richardson', 1025, 31, '1992-12-05', 'Female', 2),
('678321098', 'Alexander Wood', 1026, 28, '1995-05-30', 'Male', 7),
('789432109', 'Avery Watson', 1027, 25, '1998-08-22', 'Female', 4),
('890543210', 'Benjamin Brooks', 1028, 32, '1991-11-13', 'Male', 1),
('901654321', 'Sofia Price', 1029, 26, '1997-02-09', 'Female', 10),
('012765432', 'Logan Sanders', 1030, 30, '1993-07-03', 'Male', NULL),
('123876543', 'Abigail Barnes', 1031, 29, '1994-10-28', 'Female', NULL),
('234987654', 'Mason Peterson', 1032, 27, '1996-01-22', 'Male', 3),
('345098765', 'Chloe Coleman', 1033, 24, '1999-06-15', 'Female', 6),
('456109876', 'Elijah Jenkins', 1034, 33, '1989-11-07', 'Male', 9),
('567210987', 'Scarlett Howard', 1035, 31, '1992-02-02', 'Female', 2),
('678321098', 'Jackson Russell', 1036, 28, '1995-09-27', 'Male', 7),
('789432109', 'Lily Cooper', 1037, 25, '1998-12-20', 'Female', 4),
('890543210', 'Lucas Ward', 1038, 32, '1991-03-15', 'Male', 1),
('901654321', 'Aria Hayes', 1039, 26, '1997-04-10', 'Female', NULL),
('012765432', 'Carter Ortiz', 1040, 30, '1993-09-04', 'Male', 5); 

INSERT INTO MEMBER (SSN, Name, ID, Age, Birthday, Gender, Reserved) VALUES
('234987654', 'Mia Turner', 1041, 29, '1994-02-20', 'Female', NULL),
('345098765', 'Landon Foster', 1042, 27, '1996-08-17', 'Male', 3),
('456109876', 'Avery Bennett', 1043, 24, '1999-10-11', 'Female', 6),
('567210987', 'Owen Reed', 1044, 33, '1989-12-30', 'Male', 9),
('678321098', 'Luna Parker', 1045, 31, '1992-04-25', 'Female', 2),
('789432109', 'Eli Carter', 1046, 28, '1995-11-09', 'Male', 7),
('890543210', 'Harper Hughes', 1047, 25, '1998-03-12', 'Female', 4),
('901654321', 'Logan Gray', 1048, 32, '1991-06-19', 'Male', 1),
('012765432', 'Nova Foster', 1049, 26, '1997-07-14', 'Female', 10),
('123876543', 'Kai Butler', 1050, 30, '1993-10-08', 'Male', 5);

INSERT INTO MEMBER (SSN, Name, ID, Age, Birthday, Gender, Reserved) VALUES
('123456790', 'Emma Johnson', 1051, 27, '1996-02-12', 'Female', 22),
('234567891', 'James Smith', 1052, 33, '1989-05-19', 'Male', 37),
('345678902', 'Ella Williams', 1053, 25, '1998-08-05', 'Female', 45),
('456789013', 'Michael Brown', 1054, 28, '1994-11-27', 'Male', 12),
('567890124', 'Olivia Davis', 1055, 31, '1992-04-03', 'Female', 14),
('678901235', 'Liam Miller', 1056, 29, '1993-10-18', 'Male', 19),
('789012346', 'Ava Wilson', 1057, 26, '1997-01-10', 'Female', 31),
('890123457', 'Noah Moore', 1058, 34, '1987-06-15', 'Male', 28),
('901234568', 'Sophia Taylor', 1059, 32, '1989-09-20', 'Female', 53),
('012345679', 'Jack Anderson', 1060, 27, '1995-12-08', 'Male', 2),
('123454322', 'Isaac Martinez', 1061, 23, '2000-03-25', 'Male', 41),
('234543211', 'Lily Garcia', 1062, 30, '1993-07-01', 'Female', 8),
('345432110', 'Daniel Rodriguez', 1063, 28, '1995-09-14', 'Male', 10),
('456321099', 'Chloe Hernandez', 1064, 26, '1997-11-28', 'Female', 56),
('567210988', 'Logan Lopez', 1065, 31, '1992-02-19', 'Male', 35),
('678109877', 'Mia Gonzalez', 1066, 28, '1995-05-24', 'Female', 47),
('789098766', 'Elijah Perez', 1067, 25, '1998-08-17', 'Male', 59),
('890987655', 'Harper Torres', 1068, 32, '1991-11-08', 'Female', 17),
('901876544', 'Aiden Flores', 1069, 26, '1997-02-03', 'Male', 5),
('012765433', 'Grace Ramirez', 1070, 30, '1993-07-27', 'Female', 36),
('123876544', 'Ethan Evans', 1071, 29, '1994-12-21', 'Male', 26),
('234987655', 'Scarlett Collins', 1072, 27, '1996-02-15', 'Female', 40),
('345098766', 'William Murphy', 1073, 24, '1999-05-08', 'Male', 48),
('456109877', 'Aria Cook', 1074, 33, '1989-10-01', 'Female', 55),
('567210988', 'Jackson Richardson', 1075, 31, '1992-12-26', 'Male', 32),
('678321099', 'Luna Wood', 1076, 28, '1995-05-21', 'Female', 7),
('789432110', 'Eli Watson', 1077, 25, '1998-09-14', 'Male', 3),
('890543221', 'Sophie Brooks', 1078, 32, '1991-12-07', 'Female', 21),
('901654332', 'Liam Price', 1079, 26, '1997-03-04', 'Male', 60),
('012765443', 'Ava Sanders', 1080, 30, '1993-07-29', 'Female', 29),
('123876554', 'Owen Barnes', 1081, 29, '1994-11-23', 'Male', 4),
('234987665', 'Emma Peterson', 1082, 27, '1996-02-16', 'Female', 11),
('345098776', 'Ethan Coleman', 1083, 24, '1999-05-11', 'Male', 20),
('456109887', 'Chloe Jenkins', 1084, 33, '1989-10-04', 'Female', 23),
('567210998', 'Noah Howard', 1085, 31, '1992-12-29', 'Male', 44),
('678321109', 'Aria Russell', 1086, 28, '1995-05-24', 'Female', 37),
('789432120', 'Liam Cooper', 1087, 25, '1998-09-17', 'Male', 19),
('890543231', 'Mia Ward', 1088, 32, '1991-12-10', 'Female', 1),
('901654342', 'Jackson Hayes', 1089, 26, '1997-03-05', 'Male', NULL),
('012765453', 'Sophia Ortiz', 1090, 30, '1993-07-30', 'Female', 10),
('123876564', 'Logan Turner', 1091, 29, '1994-11-24', 'Male', 42),
('234987675', 'Ava Foster', 1092, 27, '1996-02-17', 'Female', 32),
('345098786', 'Eli Bennett', 1093, 24, '1999-05-12', 'Male', 6),
('456109897', 'Harper Reed', 1094, 33, '1989-10-05', 'Female', 9),
('567210908', 'Liam Parker', 1095, 31, '1992-12-30', 'Male', 56),
('678321119', 'Aria Cooper', 1096, 28, '1995-05-25', 'Female', 27),
('789432130', 'Eli Ward', 1097, 25, '1998-09-18', 'Male', 14),
('890543241', 'Sophie Watson', 1098, 32, '1991-12-11', 'Female', 17),
('901654352', 'Liam Price', 1099, 26, '1997-03-06', 'Male', 3),
('012765463', 'Ava Sanders', 1100, 30, '1993-07-31', 'Female', 49);

INSERT INTO MEMBER (SSN, Name, ID, Age, Birthday, Gender, Reserved) VALUES
('123456791', 'Sophie Johnson', 1101, 28, '1995-03-22', 'Female', 18),
('234567892', 'Oliver Smith', 1102, 32, '1990-06-19', 'Male', 26),
('345678903', 'Aria Williams', 1103, 25, '1998-09-14', 'Female', 43),
('456789014', 'Ethan Brown', 1104, 29, '1993-12-12', 'Male', 15),
('567890125', 'Chloe Davis', 1105, 31, '1992-03-08', 'Female', 28),
('678901236', 'Liam Miller', 1106, 27, '1995-06-17', 'Male', 32),
('789012347', 'Ava Wilson', 1107, 26, '1996-09-10', 'Female', 21),
('890123458', 'Noah Moore', 1108, 33, '1989-12-03', 'Male', 14),
('901234569', 'Sophia Taylor', 1109, 32, '1990-03-25', 'Female', 37),
('012345670', 'Jack Anderson', 1110, 28, '1995-06-18', 'Male', 8),
('123454323', 'Isaac Martinez', 1111, 24, '1999-09-14', 'Male', 19),
('234543212', 'Lily Garcia', 1112, 29, '1994-12-11', 'Female', 45),
('345432111', 'Daniel Rodriguez', 1113, 28, '1995-03-06', 'Male', 37),
('456321100', 'Chloe Hernandez', 1114, 26, '1996-06-30', 'Female', 12),
('567210989', 'Logan Lopez', 1115, 31, '1992-09-22', 'Male', 50),
('678109878', 'Mia Gonzalez', 1116, 28, '1995-12-17', 'Female', 9),
('789098767', 'Elijah Perez', 1117, 25, '1998-03-12', 'Male', 24),
('890987656', 'Harper Torres', 1118, 32, '1990-06-06', 'Female', 51),
('901876545', 'Aiden Flores', 1119, 26, '1996-09-01', 'Male', 6),
('012765434', 'Grace Ramirez', 1120, 30, '1993-12-29', 'Female', 29),
('123876545', 'Ethan Evans', 1121, 29, '1995-03-25', 'Male', 40),
('234987656', 'Scarlett Collins', 1122, 27, '1996-06-17', 'Female', 55),
('345098767', 'William Murphy', 1123, 24, '1999-09-10', 'Male', 41),
('456109878', 'Aria Cook', 1124, 33, '1989-12-05', 'Female', 10),
('567210989', 'Jackson Richardson', 1125, 31, '1992-03-02', 'Male', 20),
('678321100', 'Luna Wood', 1126, 28, '1995-06-28', 'Female', 14),
('789432111', 'Eli Watson', 1127, 25, '1998-09-21', 'Male', 3),
('890543222', 'Sophie Brooks', 1128, 32, '1990-12-14', 'Female', 27),
('901654333', 'Liam Price', 1129, 26, '1997-03-09', 'Male', 1),
('012765444', 'Ava Sanders', 1130, 30, '1993-07-04', 'Female', 16),
('123876555', 'Owen Barnes', 1131, 29, '1994-10-28', 'Male', 46),
('234987666', 'Emma Peterson', 1132, 27, '1996-01-23', 'Female', 11),
('345098777', 'Ethan Coleman', 1133, 24, '1999-04-17', 'Male', 35),
('456109888', 'Chloe Jenkins', 1134, 33, '1989-07-10', 'Female', 59),
('567210999', 'Noah Howard', 1135, 31, '1992-09-04', 'Male', 8),
('678321110', 'Aria Russell', 1136, 28, '1995-12-29', 'Female', 53),
('789432121', 'Liam Cooper', 1137, 25, '1998-03-24', 'Male', 24),
('890543232', 'Mia Ward', 1138, 32, '1990-06-17', 'Female', 37),
('901654343', 'Jackson Hayes', 1139, 26, '1996-09-10', 'Male', 48),
('012765454', 'Sophia Ortiz', 1140, 30, '1993-12-05', 'Female', 22),
('123876565', 'Logan Turner', 1141, 29, '1995-03-30', 'Male', 45),
('234987676', 'Ava Foster', 1142, 27, '1996-06-23', 'Female', 14),
('345098787', 'Eli Bennett', 1143, 33, '1989-09-17', 'Male', 37),
('456109898', 'Harper Reed', 1144, 31, '1992-12-12', 'Female', 10),
('567210909', 'Liam Parker', 1145, 28, '1995-03-07', 'Male', 3),
('678321120', 'Aria Cooper', 1146, 25, '1998-05-31', 'Female', 28),
('789432131', 'Eli Ward', 1147, 32, '1991-09-22', 'Male', 41),
('890543242', 'Sophie Watson', 1148, 26, '1996-12-15', 'Female', 18),
('901654353', 'Liam Price', 1149, 29, '1994-03-10', 'Male', 34),
('012765464', 'Ava Sanders', 1150, 33, '1989-06-03', 'Female', 7);

----------------------------------------------------------------------------------------------------------------------------

--EQUIPMENT: 
CREATE TABLE IF NOT EXISTS EQUIPMENT (
    Name VARCHAR(20),
    Weight INT,
    Type VARCHAR(20),
    Location INT, -- Should reference the ROOM Name
    PRIMARY KEY (Name),
    FOREIGN KEY(Location) REFERENCES ROOM(RoomID)
);

INSERT INTO EQUIPMENT (Name, Weight, Type, Location) VALUES
('Bench Press', 200, 'Weights', 1),
('Treadmill', 250, 'Cardio', 2),
('Dumbbell Set', 150, 'Weights', 3),
('Elliptical Machine', 180, 'Cardio', 4),
('Leg Press', 300, 'Weights', 5),
('Stationary Bike', 180, 'Cardio', 6),
('Squat Rack', 250, 'Weights', 7),
('Rowing Machine', 220, 'Cardio', 8),
('Chest Fly Machine', 200, 'Weights', 9),
('Stair Climber', 210, 'Cardio', 10),
('Barbell', 180, 'Weights', 1),
('Spin Bike', 150, 'Cardio', 2),
('Kettlebell Set', 160, 'Weights', 3),
('Punching Bag', 250, 'Cardio', 4),
('Smith Machine', 300, 'Weights', 5),
('Step Machine', 180, 'Cardio', 6),
('Cable Machine', 200, 'Weights', 7),
('Arc Trainer', 220, 'Cardio', 8),
('Shoulder Press', 190, 'Weights', 9),
('Assault Bike', 200, 'Cardio', 10),
('Hammer Strength Machine', 250, 'Weights', 1),
('Pilates Reformer', 170, 'Cardio', 2),
('Resistance Bands', 140, 'Weights', 3),
('Battle Ropes', 180, 'Cardio', 4),
('Hack Squat Machine', 300, 'Weights', 5),
('Trampoline', 160, 'Cardio', 6),
('Lat Pulldown Machine', 200, 'Weights', 7),
('Jacobs Ladder', 220, 'Cardio', 8),
('Ab Roller', 150, 'Weights', 9),
('Water Rower', 190, 'Cardio', 10);








