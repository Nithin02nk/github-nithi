create database Project;
use project;
-- 1. Airlines Table
CREATE TABLE airlines (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_name VARCHAR(255),
    airline_code VARCHAR(10) UNIQUE
);
-- 1. Insert a New Airline

INSERT INTO airlines (airline_name, airline_code) 
VALUES ('Airline A', 'AA001'),
 ('Airline B', 'AB002'),
 ('Airline C', 'AC003'),
('Airline D', 'AD004'),
 ('Airline E', 'AE005');


-- 2. Airports Table

CREATE TABLE airports (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    airport_name VARCHAR(255),
    airport_code VARCHAR(10) UNIQUE,
    location VARCHAR(255)
);

-- 2. Insert a New Airport

INSERT INTO airports (airport_name, airport_code, location)
VALUES ('JFK International Airport', 'JFK', 'New York, USA'),
('NIT International Airport', 'NIT', 'Califorinia, USA'),
('ABI International Airport', 'ABI', 'chicago, USA'),
('JSB International Airport', 'JSB', 'sandiago, USA'),
('ASK International Airport', 'ASK', 'los angle, USA');



-- 3. Flights Table

CREATE TABLE flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_id INT,
    flight_number VARCHAR(10),
    departure_airport_id INT,
    arrival_airport_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    status ENUM('Scheduled', 'Delayed', 'Cancelled'),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (departure_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES airports(airport_id)
);

-- 3. Insert a New Flight

INSERT INTO flights (airline_id, flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, status)
VALUES (1, 'AA123', 1, 2, '2025-03-01 10:00:00', '2025-03-01 12:30:00', 'Scheduled'),
       (2, 'AB124', 2, 1, '2025-03-03 11:00:00', '2025-03-03 13:00:00', 'Scheduled'),
       (3, 'AC125', 3, 4, '2025-03-03 04:00:00', '2025-03-03 18:00:00', 'Scheduled'),
       (1, 'AA121', 1, 2, '2025-03-03 10:00:00', '2025-03-03 14:30:00', 'Delayed'),
	   (2, 'AB122', 2, 3, '2025-03-03 10:00:00', '2025-03-03 12:30:00', 'Cancelled');


-- 4. Passengers Table

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    passport_number VARCHAR(50) UNIQUE,
    nationality VARCHAR(50)
);

-- 4. Insert a New Passenger

INSERT INTO passengers (first_name, last_name, date_of_birth, passport_number, nationality)
VALUES ('John', 'Doe', '1985-06-15', 'A1234567', 'American'),
('Joseph', 'Raj', '1999-07-21', 'A1234563', 'American'),
('Ajay', ' praksh', '1975-08-05', 'A1234562', 'American'),
('Arul', 'Prabin', '1987-06-22', 'A1234561', 'American'),
('Akash', 'Starwin', '1888-10-15', 'A1234568', 'American'),
('Sebastin', 'Joe', '1998-07-31', 'A1234008', 'American');

-- 5. Bookings Table

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATETIME,
    status ENUM('Booked', 'Checked-in', 'Cancelled'),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

-- 5. Insert a Booking for a Passenger


INSERT INTO bookings (passenger_id, flight_id,booking_date ,status)
VALUES (1, 1,'2025-03-03 06:00:00', 'Booked'),
       (2, 1,'2025-03-03 05:00:00', 'Booked'),
       (3, 4,'2025-03-03 09:00:00', 'Checked-in'),
	   (4, 2,'2025-03-03 10:00:00', 'Checked-in'),
       (5, 3,'2025-03-03 03:00:00', 'Cancelled'),
       (6, 5,'2025-03-03 01:00:00', 'Booked');
       
-- 6. Check-ins Table

CREATE TABLE checkins (
    checkin_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    checkin_time DATETIME,
    seat_number VARCHAR(10),
    baggage_count INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

-- 6. Insert a Check-in

INSERT INTO checkins (booking_id,checkin_time, seat_number, baggage_count)
VALUES (1,'2025-03-03 09:00:00', '12A', 2),
       (2,'2025-03-03 09:00:00', '10B', 2),
       (3,'2025-03-03 09:00:00', '14A', 2),
       (4,'2025-03-03 10:00:00', '20B', 2),
       (5,'2025-03-03 03:00:00', '34A', 2),
	   (6,'2025-03-03 09:00:00', '10F', 2);

-- 7. Baggage Table

CREATE TABLE baggage (
    baggage_id INT PRIMARY KEY AUTO_INCREMENT,
    checkin_id INT,
    baggage_weight DECIMAL(5, 2),
    baggage_type ENUM('Cabin', 'Checked'),
    FOREIGN KEY (checkin_id) REFERENCES checkins(checkin_id)
);

 -- 7. Insert Baggage Information

INSERT INTO baggage (checkin_id, baggage_weight, baggage_type)
VALUES (1, 23.5, 'Checked'),
	   (2, 23.5, 'Checked'),
	   (3, 23.5, 'Checked'),
       (4, 23.5, 'Cabin'),
       (6, 23.5, 'Cabin');



-- 8. Flight Schedules Table

CREATE TABLE flight_schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT,
    gate_number VARCHAR(10),
    terminal_number VARCHAR(10),
    schedule_time DATETIME,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);

  -- 8. scheduled flights
  
  insert into flight_schedules ( flight_id,gate_number,terminal_number,schedule_time)
  values(1,'3','11','2025-03-03 10:00:00'),
        (2,'4','9','2025-03-03 11:00:00'),
		(3,'6','16','2025-03-03 04:00:00'),
		(4,'2','5','2025-03-03 12:00:00');



-- select queries


-- 1. Get All Flights for a Specific Airline

SELECT f.flight_number, a.airline_name, f.departure_time, f.arrival_time
FROM flights f
JOIN airlines a ON f.airline_id = a.airline_id
WHERE a.airline_code = 'AA001';

-- 2. Get All Bookings for a Specific Passenger

SELECT b.booking_id, f.flight_number, f.departure_time, f.arrival_time, b.status
FROM bookings b
JOIN flights f ON b.flight_id = f.flight_id
WHERE b.passenger_id = 3;

-- 3. Get All Passengers on a Specific Flight

SELECT p.first_name, p.last_name, p.date_of_birth, p.passport_number
FROM passengers p
JOIN bookings b ON p.passenger_id = b.passenger_id
WHERE b.flight_id = 1;

-- 4. Get Check-in Details for a Specific Booking


SELECT c.checkin_time, c.seat_number, c.baggage_count
FROM checkins c
JOIN bookings b ON c.booking_id = b.booking_id
WHERE b.booking_id = 2;






-- 1.Data Analytics and Reports:
-- Flight Occupancy Rate:

SELECT 
    f.flight_id, 
    f.flight_number, 
    COUNT(b.booking_id) AS total_bookings,

    100 AS total_seats,
    (COUNT(b.booking_id) / 100) * 100 AS occupancy_rate
FROM 
    flights f
LEFT JOIN 
    bookings b ON f.flight_id = b.flight_id
GROUP BY 
    f.flight_id, f.flight_number;
    
    
    
    
    
    
    
   -- Baggage Statistics:
    
    SELECT 
    f.flight_id,
    f.flight_number,
    COUNT(b.baggage_id) AS total_baggage_items,
    SUM(b.baggage_weight) AS total_baggage_weight
FROM 
    flights f
LEFT JOIN 
    bookings bo ON f.flight_id = bo.flight_id
 LEFT JOIN 
 checkins c ON bo.booking_id = c.booking_id
 LEFT JOIN 
    baggage b ON c.checkin_id = b.checkin_id
GROUP BY 
    f.flight_id, f.flight_number;
    
    
    
    
    
    
    
    
    
   -- Booking Trends

    SELECT 
    DATE(b.booking_date) AS booking_day,
    COUNT(b.booking_id) AS total_bookings,
    SUM(CASE WHEN b.status = 'Booked' THEN 1 ELSE 0 END) AS booked_count,
    SUM(CASE WHEN b.status = 'Checked-in' THEN 1 ELSE 0 END) AS checked_in_count,
    SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count
FROM 
    bookings b
GROUP BY 
    DATE(b.booking_date)
ORDER BY 
    booking_day;


-- 2.Customer Notification System:


-- Checkin for schedules

SELECT p.first_name,p.last_name,p.passport_number,
       f.flight_number,f.departure_time,a.airport_name AS departure_airport,
       c.checkin_time,'Get ready on time' AS reminder
      FROM passengers p 
      INNER JOIN bookings b 
      ON b.passenger_id = p.passenger_id
      INNER JOIN flights f 
      ON f.flight_id = b.flight_id
      INNER JOIN airports a 
      ON a.airport_id = f.departure_airport_id
      INNER JOIN checkins c 
      ON c.booking_id = b.booking_id 
      WHERE f.status = 'Scheduled' AND b.status != 'Cancelled';
      
     
     
     
     
     
     -- checkin for delayed
      
      SELECT p.first_name,p.last_name,p.passport_number,
      f.flight_number,fs.schedule_time,a.airport_name AS departure_airport,
      c.checkin_time + INTERVAL 2 HOUR AS checkin_time,
      'Flight delayed' AS reminder
      FROM passengers p 
      INNER JOIN bookings b 
      ON b.passenger_id = p.passenger_id
      INNER JOIN flights f 
      ON f.flight_id = b.flight_id
      INNER JOIN airports a 
      ON a.airport_id = f.departure_airport_id
      INNER JOIN checkins c 
      ON c.booking_id = b.booking_id 
      INNER JOIN flight_schedules fs 
      ON fs.flight_id = f.flight_id
      WHERE f.status = 'Delayed';
      
    
    
    
    -- reminder for cancelled
      
      
      SELECT p.first_name,p.last_name,p.passport_number,
      f.flight_number,a.airport_name AS departure_airport,fs.schedule_time,f.status,
      'Flight cancelled' AS reminder
      FROM passengers p 
      INNER JOIN bookings b 
      ON b.passenger_id = p.passenger_id
      INNER JOIN flights f 
      ON b.flight_id = f.flight_id
      INNER JOIN airports a 
      ON a.airport_id = f.departure_airport_id
      LEFT JOIN flight_schedules fs 
      ON fs.flight_id = f.flight_id
      WHERE f.status = 'Cancelled';
      
      
      
      
-- 3.User Roles and Access Control:

-- Roles

CREATE TABLE roles (
    role_id INT  AUTO_INCREMENT,
    role_name VARCHAR(50) ,
    PRIMARY KEY(role_id,role_name)
);

INSERT INTO roles (role_name) VALUES 
('Admin'),
('Flight Attendant'),
('Check-in Agent'),
('Passenger');

-- User

CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    username VARCHAR(50),
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role_id INT,
    PRIMARY KEY(user_id,username),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

INSERT INTO users (first_name, last_name, username, password, email, role_id)
VALUES ('Alice', 'Smith', 'admin1', 'hashedpassword123', 'alice.smith@example.com', 1),
       ('Bob', 'Johnson', 'attendant1', 'hashedpassword456', 'bob.johnson@example.com', 2),
       ('Charlie', 'Brown', 'checkinagent1', 'hashedpassword789', 'charlie.brown@example.com', 3),
       ('David', 'Williams', 'passenger1', 'hashedpassword101', 'david.williams@example.com', 4);
       
       
       -- Permissions
       
       
       CREATE TABLE permissions (
    permission_id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(100) NOT NULL
   );

INSERT INTO permissions (permission_name) VALUES
('View Flights'),
('Edit Flights'),
('View Check-ins'),
('Edit Check-ins'),
('View Passengers'),
('Create Users'),
('Delete Users');



-- Role permission


CREATE TABLE role_permissions (
    role_id INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
   );
   
   

INSERT INTO role_permissions (role_id, permission_id)
VALUES ( 1,1),
       ( 1,2),
       ( 1,3),
       ( 1,4),
       ( 1,5),
       ( 1,6),
       ( 1,7);

INSERT INTO role_permissions (role_id, permission_id)
VALUES (2, 1),
       (2, 5);

INSERT INTO role_permissions (role_id, permission_id)
VALUES (3, 3), 
       (3, 4);

INSERT INTO role_permissions (role_id, permission_id)
VALUES (4, 1);

       


-- 4.Payment Integration:



CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    payment_amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    payment_date DATETIME,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

INSERT INTO payments (booking_id, payment_amount, payment_method, payment_status, payment_date)
VALUES 
(1, 300.50, 'Credit Card', 'Completed', '2025-03-03 08:30:00'),
(2, 250.75, 'PayPal', 'Completed', '2025-03-03 07:45:00'),
(3, 180.00, 'Credit Card', 'Pending', '2025-03-03 09:10:00'),
(4, 210.00, 'Debit Card', 'Failed', '2025-03-03 10:20:00'),
(5, 500.00, 'Credit Card', 'Completed', '2025-03-03 06:30:00'),
(6, 270.50, 'PayPal', 'Completed', '2025-03-03 05:15:00');





-- 5.Passenger Feedback:



CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT, 
    airport_id INT,
    feedback_type ENUM('Flight', 'Service', 'Airport Amenities') NOT NULL, 
    rating INT CHECK(rating >= 1 AND rating <= 5),
    comments TEXT, 
    feedback_date DATETIME,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id)
);


INSERT INTO feedback (passenger_id, flight_id, airport_id, feedback_type, rating, comments, feedback_date)
VALUES 
(1, 1, 1, 'Flight', 4, 'The flight was comfortable, but there were some delays in the departure.', '2025-03-03 12:30:00'),
(2, 2, 2, 'Service', 5, 'Excellent service by the staff during the flight. Very friendly and professional.', '2025-03-03 13:00:00'),
(3, 3, 3, 'Airport Amenities', 3, 'The airport amenities were decent, but the food options were limited.', '2025-03-03 14:00:00'),
(4, 4, 4, 'Flight', 2, 'The flight had a lot of turbulence and was delayed by several hours.', '2025-03-03 15:00:00'),
(5, 5, 5, 'Airport Amenities', 4, 'The airport had great lounges, but the Wi-Fi was not fast enough.', '2025-03-03 16:00:00'),
(6, 1, 1, 'Service', 5, 'The flight attendants were very helpful and provided great service.', '2025-03-03 17:00:00');





