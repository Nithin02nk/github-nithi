use project;
-- 1. Insert a New Airline

INSERT INTO airlines (airline_name, airline_code) 
VALUES ('Airline A', 'AA001'),
 ('Airline B', 'AB002'),
 ('Airline C', 'AC003'),
('Airline D', 'AD004'),
 ('Airline E', 'AE005');
 
 
 
 
-- 2. Insert a New Airport

INSERT INTO airports (airport_name, airport_code, location)
VALUES ('JFK International Airport', 'JFK', 'New York, USA'),
('NIT International Airport', 'NIT', 'Califorinia, USA'),
('ABI International Airport', 'ABI', 'chicago, USA'),
('JSB International Airport', 'JSB', 'sandiago, USA'),
('ASK International Airport', 'ASK', 'los angle, USA');

-- 3. Insert a New Flight

INSERT INTO flights (airline_id, flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, status)
VALUES
 (2, 'AB124', 2, 1, '2025-03-03 11:00:00', '2025-03-03 01:00:00', 'Scheduled'),
 (3, 'AC125', 3, 4, '2025-03-03 04:00:00', '2025-03-03 06:00:00', 'Scheduled'),
 (1, 'AA121', 1, 2, '2025-03-03 10:00:00', '2025-03-03 02:30:00', 'Delayed'),
(2, 'AB122', 2, 3, '2025-03-03 10:00:00', '2025-03-03 12:30:00', 'Cancelled');


select * from  FLIGHTS ;


-- 4. Insert a New Passenger

INSERT INTO passengers (first_name, last_name, date_of_birth, passport_number, nationality)
VALUES ('John', 'Doe', '1985-06-15', 'A1234567', 'American'),
('Joseph', 'Raj', '1999-07-21', 'A1234563', 'American'),
('Ajay', ' praksh', '1975-08-05', 'A1234562', 'American'),
('Arul', 'Prabin', '1987-06-22', 'A1234561', 'American'),
('Akash', 'Starwin', '1888-10-15', 'A1234568', 'American');

select * from passengers;

-- 5. Insert a Booking for a Passenger


INSERT INTO bookings (passenger_id, flight_id, status)
VALUES (1, 1, 'Booked'),
(2, 1, 'Booked'),
(3, 4, 'Booked'),
(4, 2, 'Booked'),
(5, 3, 'Booked');

select * from bookings



   