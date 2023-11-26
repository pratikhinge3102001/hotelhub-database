-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);

-- Inserting values into User Table
INSERT INTO User (UserID, Username, Password, Email, FirstName, LastName)
VALUES
    (101, 'user1', 'pass1', 'user1@email.com', 'prathamesh', 'hinge'),
    (102, 'user2', 'pass2', 'user2@email.com', 'shubman', 'gill'),
    (103, 'user3', 'pass3', 'user3@email.com', 'pratik', 'hinge'),
    (104, 'user4', 'pass4', 'user4@email.com', 'nikhil', 'patil'),
    (105, 'user5', 'pass1', 'user5@email.com', 'ritesh', 'patil'),
    (106, 'user6', 'pass1', 'user6@email.com', 'mrunalini', 'netkar'),
    (107, 'user7', 'pass1', 'user7@email.com', 'hrishi ', 'nikam'),
    (108, 'user8', 'pass1', 'user8@email.com', 'mayur', 'mali'),
    (109, 'user9', 'pass1', 'user9@email.com', 'anushka ', 'sen'),
    (110, 'user10', 'pass1', 'user10@email.com', 'aaliya', 'bhatt'),
    (111, 'user11', 'pass1', 'user11@email.com', 'sejal', 'yadav'),
    (112, 'user12', 'pass1', 'user12@email.com', 'akash', 'salvi'),
    (113, 'user13', 'pass1', 'user13@email.com', 'ashutosh', 'kokate'),
    (114, 'user14', 'pass1', 'user14@email.com', 'vivek', 'nand'),
    (115, 'user15', 'pass1', 'user15@email.com', 'vivekanand', 'kumar'),
    (116, 'user16', 'pass1', 'user16@email.com', 'virat', 'kohli'),
    (117, 'user17', 'pass1', 'user17@email.com', 'sakshi ', 'chavare'),
    (118, 'user18', 'pass1', 'user18@email.com', 'priya', 'jagtap'),
    (119, 'user19', 'pass1', 'user19@email.com', 'steven', 'smith'),
    (120, 'user20', 'pass1', 'user20@email.com', 'joe', 'root')
    
	;
	
select * from user;


-- Room Table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    RoomNumber INT UNIQUE,
    Type VARCHAR(255),
    Description TEXT,
    Rate DECIMAL(10, 2)
);

-- Inserting values into Room Table
INSERT INTO Room (RoomID, RoomNumber, Type, Description, Rate)
VALUES
    (1001,11, 'Single', 'A cozy single room', 100),
    (1002,12, 'Double', 'Spacious double room', 200),
    (1003,13, 'Single', 'A cozy single room', 100),
    (1004,14, 'Double', 'Spacious double room', 200),
    (1005,15, 'Single', 'A cozy single room', 100),
    (1006,16, 'Double', 'Spacious double room', 200),
    (1007,17, 'Single', 'A cozy single room', 100),
    (1008,18, 'Double', 'Spacious double room', 200),
    (1009,19, 'Single', 'A cozy single room', 100),
    (1010,20, 'Double', 'Spacious double room', 200),
    (1011,21, 'Single', 'A cozy single room', 100),
    (1012,22, 'Double', 'Spacious double room', 200),
    (1013,23, 'Single', 'A cozy single room', 100),
    (1014,24, 'Double', 'Spacious double room', 200),
    (1015,25, 'Single', 'A cozy single room', 100)
    
    
	;
	
select * from room;

-- Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    UserID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalCost DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Inserting values into Reservation Table
INSERT INTO Reservation (ReservationID, UserID, RoomID, CheckInDate, CheckOutDate, TotalCost)
VALUES
    (10001, 101, 1001, '2023-12-01', '2023-12-05', null),
    (10002, 102, 1002, '2023-12-01', '2023-12-05', null)
    
    
	;
	
select * from Reservation;

-- Availability Table
CREATE TABLE Availability (
    AvailabilityID INT PRIMARY KEY,
    RoomID INT,
    Date DATE,
    AvailableRooms INT,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
    UNIQUE (RoomID, Date)
);

-- Inserting values into Availability Table
INSERT INTO Availability (AvailabilityID, RoomID, Date, AvailableRooms)
VALUES
    (1, 1001, '2023-12-01', 1),
    (2, 1002, '2023-12-02', 1),
    (3, 1003, '2023-12-15', 1),
    (4, 1004, '2023-12-20', 1),
    (5, 1005, '2024-01-01', 1),
    (6, 1006, '2024-02-01', 1),
    (7, 1007, '2024-03-01', 1),
    (8, 1008, '2024-04-02', 1),
    (9, 1009, '2024-08-01', 1),
    (10, 1010, '2024-12-02', 1),
    (11, 1011, '2025-01-01', 1),
    (12, 1012, '2024-12-05', 1),
    (13, 1013, '2025-12-06', 1),
    (14, 1014, '2023-12-19', 1),
    (15, 1015, '2024-12-01', 1)
    ;
    
    
select * from Availability;

-- Review Table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    RoomID INT,
    Rating INT,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Inserting values into Review Table
INSERT INTO Review (ReviewID, UserID, RoomID, Rating, Comment)
VALUES
    (1, 101, 1001, 4, 'Enjoyed my stay!'),
    (2, 102, 1002, 5, 'Amazing room and service'),
    (3, 103, 1001, 4, 'Enjoyed my stay!'),
    (4, 104, 1002, 5, 'Amazing room and service'),
    (5, 105, 1001, 4, 'Enjoyed my stay!'),
    (6, 106, 1002, 5, 'Amazing room and service'),
    (7, 107, 1001, 4, 'Enjoyed my stay!'),
    (8, 108, 1002, 5, 'Amazing room and service'),
    (9, 109, 1001, 4, 'Enjoyed my stay!'),
    (10, 110, 1002, 5, 'Amazing room and service'),
    (11, 111, 1001, 4, 'Enjoyed my stay!'),
    (12, 112, 1002, 5, 'Amazing room and service'),
    (13, 113, 1001, 4, 'Enjoyed my stay!'),
    (14, 114, 1002, 5, 'Amazing room and service'),
    (15, 115, 1001, 4, 'Enjoyed my stay!'),
    (16, 116, 1002, 5, 'Amazing room and service'),
    (17, 117, 1001, 4, 'Enjoyed my stay!'),
    (18, 118, 1002, 5, 'Amazing room and service'),
    (19, 119, 1001, 4, 'Enjoyed my stay!'),
    (20, 120, 1002, 5, 'Amazing room and service')
	;
	
select * from review ;

-- Index for User Table
CREATE INDEX idx_username ON User(Username);

-- Index for Room Table
CREATE INDEX idx_room_number ON Room(RoomNumber);

-- Index for Reservation Table
CREATE INDEX idx_checkin_date ON Reservation(CheckInDate);
CREATE INDEX idx_checkout_date ON Reservation(CheckOutDate);

-- Index for Review Table
CREATE INDEX idx_rating ON Review(Rating);

-- View to display reservations with user and room information
CREATE VIEW ReservationDetails AS
SELECT
    r.ReservationID,
    u.Username,
    u.FirstName,
    u.LastName,
    r.CheckInDate,
    r.CheckOutDate,
    rt.RoomNumber,
    rt.Type,
    rt.Description,
    rt.Rate,
    r.TotalCost
FROM Reservation r
JOIN User u ON r.UserID = u.UserID
JOIN Room rt ON r.RoomID = rt.RoomID;

select * from ReservationDetails;


DELIMITER //

CREATE PROCEDURE GetAvailableRooms(IN checkDate DATE)
    BEGIN
        SELECT
             a.RoomID,
             r.RoomNumber,
             r.Type,
             r.Description,
             r.Rate,
             a.AvailableRooms
         FROM Availability a
         JOIN Room r ON a.RoomID = r.RoomID
         WHERE a.Date = checkDate;
    END //
	
DELIMITER ;

DELIMITER //

-- Your SQL statements go here
call GetAvailableRooms('2023-12-10');

//

DELIMITER ;





DELIMITER //

CREATE PROCEDURE GetRoomReviews(
    IN roomID INT, 
    OUT result_userID INT, 
    OUT result_rating INT, 
    OUT result_comment TEXT
)
BEGIN
    -- Ensure OUT parameters have initial values
    SET result_userID = NULL;
    SET result_rating = NULL;
    SET result_comment = NULL;

    -- Select the values directly
    SELECT 
        UserID, Rating, Comment
    INTO
        result_userID, result_rating, result_comment
    FROM Review
    WHERE RoomID = roomID
    ORDER BY RoomID 
    LIMIT 1;  -- Limit to one row, assuming you want the latest review
END //

DELIMITER ;
-- Reset variables before calling the procedure
SET @out_userID = NULL;
SET @out_rating = NULL;
SET @out_comment = NULL;

-- Call the procedure
CALL GetRoomReviews(4, @out_userID, @out_rating, @out_comment);

-- Display the results
SELECT @out_userID, @out_rating, @out_comment;


SHOW TRIGGERS LIKE 'UpdateAvailableRooms';

-- trigger for each row
DELIMITER //
CREATE TRIGGER UpdateAvailableRooms AFTER INSERT ON Reservation
    FOR EACH ROW
    BEGIN
         DECLARE roomsAvailable INT;
    
         -- Check for availability
         SELECT AvailableRooms INTO roomsAvailable
         FROM Availability
         WHERE RoomID = NEW.RoomID AND Date = NEW.CheckInDate;
    
         IF roomsAvailable > 0 THEN
             -- Update available rooms
             UPDATE Availability
             SET AvailableRooms = AvailableRooms - 1
             WHERE RoomID = NEW.RoomID AND Date = NEW.CheckInDate;
         ELSE
             -- If no available rooms, you might want to handle this situation (e.g., raise an error, log, or do nothing)
             -- For example, you can signal an error and roll back the transaction:
             SIGNAL SQLSTATE '45000'
             SET MESSAGE_TEXT = 'No available rooms for the selected dates';
         END IF;
     END;
     //
DELIMITER ;




















-- function for calculating totalcost 

DELIMITER //

CREATE FUNCTION CalculateTotalCost(
    p_RoomRate DECIMAL(10, 2), 
    p_CheckInDate DATE, 
    p_CheckOutDate DATE
) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE totalDays INT;
    SET totalDays = DATEDIFF(p_CheckOutDate, p_CheckInDate);
    RETURN p_RoomRate * totalDays;
END //

DELIMITER ;


SELECT 
    r.roomID,
    r.Rate AS RoomRate,
    res.CheckInDate,
    res.CheckOutDate,
    CalculateTotalCost(r.Rate, res.CheckInDate, res.CheckOutDate) AS Total_Cost
FROM 
    room r
JOIN 
    reservation res 
	ON r.roomID = res.roomID;
	

select * from Reservation ;

 INSERT INTO Reservation (ReservationID, UserID, RoomID, CheckInDate, CheckOutDate, TotalCost)
VALUES
    (10005, 103, 1010, '2024-12-02', '2024-12-05', null),
    (10006, 104, 1015, '2024-12-01', '2024-12-05', null);
select * from Reservation ;


UPDATE Reservation
    SET TotalCost = CalculateTotalCost(
                         (SELECT Rate FROM Room WHERE RoomID = Reservation.RoomID),
                         Reservation.CheckInDate,
                         Reservation.CheckOutDate
                     );
select * from reservation;




