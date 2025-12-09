CREATE DATABASE TransportAssistance;
USE TransportAssistance;

-- Table to store users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL
);

-- Table to store transport options
CREATE TABLE TransportOptions (
    TransportID INT PRIMARY KEY AUTO_INCREMENT,
    TransportName VARCHAR(50) NOT NULL,
    TransportType VARCHAR(20) NOT NULL,
    Capacity INT
);

-- Table to store user requests
CREATE TABLE UserRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    TransportID INT,
    RequestTime DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (TransportID) REFERENCES TransportOptions(TransportID)
);

-- Inserting sample users
INSERT INTO Users (UserName, PhoneNumber) VALUES
('John Doe', '123-456-7890'),
('Jane Smith', '987-654-3210');

-- Inserting sample transport options
INSERT INTO TransportOptions (TransportName, TransportType, Capacity) VALUES
('Car', 'Personal', 4),
('Bus', 'Public', 40),
('Bike', 'Personal', 1);

-- Inserting sample user requests
INSERT INTO UserRequests (UserID, TransportID, RequestTime) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(2, 3, NOW());


SELECT u.UserName, u.PhoneNumber, t.TransportName, t.TransportType, t.Capacity, ur.RequestTime
FROM UserRequests ur
JOIN Users u ON ur.UserID = u.UserID
JOIN TransportOptions t ON ur.TransportID = t.TransportID;
