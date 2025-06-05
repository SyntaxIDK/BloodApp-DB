CREATE TABLE Donor (
    DonorID INT PRIMARY KEY, 
    DonorName VARCHAR(100) NOT NULL, 
    DonorContact VARCHAR(15) NOT NULL, 
    BloodType VARCHAR(3) NOT NULL, 
    Location VARCHAR(100) NOT NULL, 
    AvailabilityStatus VARCHAR(20) NOT NULL, 
    DOB DATE NOT NULL
);

CREATE TABLE Recipient (
    RecipientID INT PRIMARY KEY, 
    RecipientName VARCHAR(100) NOT NULL, 
    RecipientContact VARCHAR(15) NOT NULL, 
    BloodTypeRequired VARCHAR(3) NOT NULL, 
    Location VARCHAR(100) NOT NULL, 
    UrgencyLevel VARCHAR(20) NULL
);

CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY, 
    HospitalName VARCHAR(150) NOT NULL, 
    HospitalContact VARCHAR(15) NOT NULL
);

CREATE TABLE BloodRequest (
    RequestID INT PRIMARY KEY, 
    RecipientID INT NOT NULL, 
    HospitalID INT NOT NULL, 
    BloodTypeRequired VARCHAR(3) NOT NULL, 
    RequestDate DATE NOT NULL, 
    Status VARCHAR(20) NOT NULL, 
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

CREATE TABLE DonationRecord (
    DonationID INT PRIMARY KEY, 
    DonorID INT NOT NULL, 
    DonationDate DATE NOT NULL, 
    RecipientID INT NULL, 
    HospitalID INT NOT NULL, 
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

CREATE TABLE Admin (
    AdminID INT PRIMARY KEY, 
    AdminName VARCHAR(100) NOT NULL, 
    AdminEmail VARCHAR(100) NOT NULL, 
    Role VARCHAR(50) NOT NULL
);

INSERT INTO Donor (DonorID, DonorName, DonorContact, BloodType, Location, AvailabilityStatus, DOB) 
VALUES 
(1, 'John Mike', '0761234567', 'A+', 'Kandy', 'Available', '2000-01-01'),
(2, 'Sarah Lee', '0762345678', 'O-', 'Colombo', 'Unavailable', '1995-05-12'),
(3, 'David Kim', '0763456789', 'B+', 'Galle', 'Available', '1989-07-22'),
(4, 'Emily Chan', '0764567890', 'AB-', 'Kandy', 'Available', '1992-03-15'),
(5, 'Michael Tan', '0765678901', 'O+', 'Jaffna', 'Available', '1985-02-10'),
(6, 'Olivia Smith', '0766789012', 'A-', 'Kandy', 'Unavailable', '1997-11-05'),
(7, 'Chris Wong', '0767890123', 'B-', 'Colombo', 'Available', '1988-06-19'),
(8, 'Rachel Green', '0768901234', 'AB+', 'Galle', 'Available', '1990-10-30'),
(9, 'Matthew White', '0769012345', 'O-', 'Jaffna', 'Unavailable', '1982-09-18'),
(10, 'Sophia Brown', '0760123456', 'A+', 'Kandy', 'Available', '1993-12-01');

INSERT INTO Recipient (RecipientID, RecipientName, RecipientContact, BloodTypeRequired, Location, UrgencyLevel) 
VALUES 
(1, 'Alex', '0764629462', 'O+', 'Kandy', 'High'),
(2, 'Mathew', '0712846192', 'B-', 'Peradeniya', 'Medium'),
(3, 'Lucy', '0713947602', 'A+', 'Colombo', 'Low'),
(4, 'Mark', '0714045603', 'O-', 'Galle', 'High'),
(5, 'Zoe', '0715146804', 'B+', 'Kandy', 'Medium'),
(6, 'Ella', '0716247905', 'AB-', 'Jaffna', 'Low'),
(7, 'John', '0717348906', 'A-', 'Colombo', 'High'),
(8, 'Sophia', '0718449607', 'O+', 'Galle', 'Medium'),
(9, 'Liam', '0719540708', 'AB+', 'Peradeniya', 'Low'),
(10, 'Isabella', '0720641809', 'B-', 'Jaffna', 'High');

INSERT INTO Hospital (HospitalID, HospitalName, HospitalContact) 
VALUES 
(1, 'Kandy General Hospital', '0812749261'),
(2, 'Colombo National Hospital', '0112345678'),
(3, 'Galle Hospital', '0912233445'),
(4, 'Peradeniya Medical Center', '0813254767'),
(5, 'Jaffna General Hospital', '0212354656'),
(6, 'Matara District Hospital', '0412556789'),
(7, 'Kurunegala Hospital', '0372634789'),
(8, 'Badulla Hospital', '0553678923'),
(9, 'Negombo General Hospital', '0314659873'),
(10, 'Kalutara Hospital', '0345276481');

INSERT INTO BloodRequest (RequestID, RecipientID, HospitalID, BloodTypeRequired, RequestDate, Status) 
VALUES 
(1, 1, 1, 'O+', '2025-04-10', 'Pending'),
(2, 2, 1, 'B-', '2025-03-25', 'Completed'),
(3, 3, 2, 'A+', '2025-05-01', 'Pending'),
(4, 4, 3, 'O-', '2025-05-05', 'Completed'),
(5, 5, 4, 'B+', '2025-05-12', 'Pending'),
(6, 6, 5, 'AB-', '2025-05-18', 'Completed'),
(7, 7, 1, 'A-', '2025-06-01', 'Pending'),
(8, 8, 2, 'O+', '2025-06-05', 'Completed'),
(9, 9, 3, 'AB+', '2025-06-10', 'Pending'),
(10, 10, 4, 'B-', '2025-06-15', 'Completed');

INSERT INTO DonationRecord (DonationID, DonorID, DonationDate, RecipientID, HospitalID) 
VALUES 
(1, 1, '2025-03-01', 1, 1),
(2, 1, '2025-05-13', 2, 1),
(3, 2, '2025-04-05', 3, 2),
(4, 3, '2025-05-07', 4, 3),
(5, 4, '2025-05-12', 5, 4),
(6, 5, '2025-06-01', 6, 5),
(7, 6, '2025-06-04', 7, 1),
(8, 7, '2025-06-10', 8, 2),
(9, 8, '2025-06-14', 9, 3),
(10, 9, '2025-06-18', 10, 4);

INSERT INTO Admin (AdminID, AdminName, AdminEmail, Role) 
VALUES 
(1, 'Admin1', 'admin1@gmail.com', 'SuperAdmin'),
(2, 'Admin2', 'admin2@gmail.com', 'Moderator'),
(3, 'Admin3', 'admin3@gmail.com', 'Moderator'),
(4, 'Admin4', 'admin4@gmail.com', 'SuperAdmin'),
(5, 'Admin5', 'admin5@gmail.com', 'SuperAdmin'),
(6, 'Admin6', 'admin6@gmail.com', 'Moderator'),
(7, 'Admin7', 'admin7@gmail.com', 'SuperAdmin'),
(8, 'Admin8', 'admin8@gmail.com', 'Moderator'),
(9, 'Admin9', 'admin9@gmail.com', 'SuperAdmin'),
(10, 'Admin10', 'admin10@gmail.com', 'Moderator');