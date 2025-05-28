CREATE TABLE Events (
	Event_Id INT PRIMARY KEY,
	Event_Name VARCHAR(100),
	Event_Date DATE,
	Event_Location VARCHAR(100),
	Event_Description VARCHAR(200)
);

CREATE TABLE Attendees (
	Attendee_Id INT PRIMARY KEY,
	Attendee_Name VARCHAR(50),
	Attendee_Phone VARCHAR(15),
	Attendee_Email VARCHAR(50),
	Attendee_City VARCHAR(50)
);

CREATE TABLE Registrations (
	Registration_Id INT,
	Event_Id INT,
	Attendee_Id INT,
	Registration_Date DATE,
	Registration_Amount NUMERIC,
	FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
	FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES
	(1, 'Tech Conference 2024', '2024-06-15', 'Radisson Blu Hotel, Bucharest', 'Annual technology conference featuring AI and ML topics'),
	(2, 'Summer Music Festival', '2024-07-20', 'Central Park, Cluj-Napoca', 'Outdoor music festival with local and international artists'),
	(3, 'Business Summit', '2024-08-10', 'Marriott Hotel, Bucharest', 'Leadership and entrepreneurship workshop'),
	(4, 'Food & Wine Expo', '2024-09-05', 'Expo Center, Timisoara', 'Culinary exhibition featuring local wines and cuisine'),
	(5, 'Art Gallery Opening', '2024-10-01', 'National Art Museum, Bucharest', 'Contemporary art exhibition opening');

SELECT * FROM Events;

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES
	(1, 'Ana Popescu', '0722123456', 'ana.popescu@email.com', 'Bucharest'),
	(2, 'Mihai Ionescu', '0733234567', 'mihai.i@email.com', 'Cluj-Napoca'),
	(3, 'Elena Dumitrescu', '0744345678', 'elena.d@email.com', 'Timisoara'),
	(4, 'Dan Marinescu', '0755456789', 'dan.m@email.com', 'Bucharest'),
	(5, 'Maria Popa', '0766567890', 'maria.p@email.com', 'Iasi'),
	(6, 'Ioan Rusu', '0777678901', 'ioan.r@email.com', 'Brasov'),
	(7, 'Carmen Stanciu', '0788789012', 'carmen.s@email.com', 'Cluj-Napoca');	

SELECT * FROM Attendees;

INSERT INTO Registrations (Registration_id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES
	(1, 1, 1, '2024-05-01', 250.00),
	(2, 1, 4, '2024-05-02', 250.00),
	(3, 2, 2, '2024-06-15', 150.00),
	(4, 2, 7, '2024-06-16', 150.00),
	(5, 3, 1, '2024-07-01', 350.00),
	(6, 3, 5, '2024-07-02', 350.00),
	(7, 4, 3, '2024-08-15', 100.00),
	(8, 4, 6, '2024-08-16', 100.00),
	(9, 5, 2, '2024-09-01', 75.00),
	(10, 5, 4, '2024-09-02', 75.00);

SELECT * FROM Registrations;

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) 
VALUES 
	(6,'Winter Code Camp', '2024-12-15', 'Continental Hotel, Sibiu', 'Intensive coding bootcamp for web development and mobile apps');

UPDATE Events
SET Event_Location='International Hotel, Iasi'
WHERE Event_Id=5;

DELETE FROM Registrations 
WHERE Event_Id = 4;

DELETE FROM Events 
WHERE Event_Id = 4;

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) 
VALUES
	(8, 'Andrei Vasilescu', '0799123456', 'andrei.vasilescu@email.com', 'Constanta');

INSERT INTO Registrations (Registration_id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) 
VALUES
	(10,6,3,'2024-10-12',120.00);

SELECT 
    e.Event_Id,
    e.Event_Name,
    e.Event_Date,
    e.Event_Location,
    COUNT(r.Registration_id) as total_attendees,
    SUM(r.Registration_Amount) as total_revenue
FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Id, e.Event_Name, e.Event_Date, e.Event_Location
ORDER BY e.Event_Date;

SELECT 
    e.Event_Name,
    e.Event_Date,
    a.Attendee_Name,
    a.Attendee_City,
    a.Attendee_Email,
    r.Registration_Date,
    r.Registration_Amount
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
ORDER BY e.Event_Date, a.Attendee_Name;

SELECT 
    e.Event_Name,
    COUNT(r.Registration_id) as number_of_registrations,
    MIN(r.Registration_Amount) as min_price,
    MAX(r.Registration_Amount) as max_price,
    ROUND(AVG(r.Registration_Amount),2) as avg_price,
    SUM(r.Registration_Amount) as total_revenue
FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Id, e.Event_Name
ORDER BY total_revenue DESC;

