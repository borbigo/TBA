-- queries used in the app.py file to support the functionality

SELECT * FROM EMPLOYEE;
SELECT * FROM CLASS;
SELECT * FROM GYM;
SELECT * FROM GEAR;
SELECT * FROM ROOM;
SELECT * FROM MEMBER;
SELECT * FROM EQUIPMENT;

SELECT DISTINCT Location FROM GYM;

SELECT CLASS.Type, CLASS.Time, CLASS.Day, EMPLOYEE.Name AS Instructor, GYM.Location AS Location
    FROM CLASS
    JOIN EMPLOYEE ON CLASS.ID = EMPLOYEE.ClassID
    JOIN GYM ON CLASS.Branch = GYM.Location
    WHERE GYM.Location = "Bellevue";
-- WHERE statement used a variable selected_location to get data from any selected branch

SELECT MEMBER.Name AS Member, ROOM.Name AS Room, ROOM.Branch 
    FROM MEMBER
    JOIN ROOM 
    ON MEMBER.Reserved = ROOM.RoomID
    WHERE ROOM.Branch = "Bellevue";
-- WHERE statement used a variable selected_location to get data from any selected branch

SELECT DISTINCT Type FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE Type = "Receptionist";
-- WHERE statement used a variable selected_Type to get data from any selected type

SELECT * FROM ROOM WHERE Branch = "Bellevue";
-- WHERE statement used a variable selected_location to get data from any selected branch

SELECT DISTINCT Type FROM EQUIPMENT;

SELECT E.Name AS 'Equipment', E. Weight, E.Type, E.Location, R.RoomID, R.Name AS 'Room'
      FROM EQUIPMENT E, ROOM R
      WHERE E.Location = R.RoomID
      AND E.Type = "Cardio";
-- AND statement used a variable selected_Type to get data from any selected type

SELECT * FROM GEAR WHERE Branch = "Bellevue";
-- WHERE statement used a variable selected_location to get data from any selected branch

SELECT COUNT(*) FROM MEMBER;
