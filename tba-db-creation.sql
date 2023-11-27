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








