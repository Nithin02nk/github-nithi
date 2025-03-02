-- 1. Insert a New Airline

INSERT INTO airlines (airline_name, airline_code) 
VALUES ('Airline A', 'AA001');

-- 2. Insert a New Airport

INSERT INTO airports (airport_name, airport_code, location)
VALUES ('JFK International Airport', 'JFK', 'New York, USA');
       
INSERT INTO airports (airport_name, airport_code, location)
VALUES ('Nit International Airport', 'Nit', 'London, UK');

-- 3. Insert a New Flight

INSERT INTO flights (airline_id, flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, status)
VALUES (1, 'AA123', 1, 1, '2025-03-01 10:00:00', '2025-03-01 12:30:00', 'Scheduled');

update flights set arrival_airport_id = 2 where airline_id =1;

-- 4. Insert a New Passenger

INSERT INTO passengers (first_name, last_name, date_of_birth, passport_number, nationality)
VALUES ('John', 'Doe', '1985-06-15', 'A1234567', 'American');


-- 5. Insert a Booking for a Passenger


INSERT INTO bookings (passenger_id, flight_id, status)
VALUES (1, 4, 'Booked');


-- 6. Insert a Check-in


INSERT INTO checkins (booking_id, seat_number, baggage_count)
VALUES (2, '12A', 2);


-- 7. Insert Baggage Information

INSERT INTO baggage (checkin_id, baggage_weight, baggage_type)
VALUES (2, 23.5, 'Checked');


-- 8. Get All Flights for a Specific Airline

SELECT f.flight_number, a.airline_name, f.departure_time, f.arrival_time
FROM flights f
JOIN airlines a ON f.airline_id = a.airline_id
WHERE a.airline_code = 'AA001';


-- 9. Get All Bookings for a Specific Passenger

SELECT b.booking_id, f.flight_number, f.departure_time, f.arrival_time, b.status
FROM bookings b
JOIN flights f ON b.flight_id = f.flight_id
WHERE b.passenger_id = 1;


-- 10. Get All Passengers on a Specific Flight

SELECT p.first_name, p.last_name, p.date_of_birth, p.passport_number
FROM passengers p
JOIN bookings b ON p.passenger_id = b.passenger_id
WHERE b.flight_id = 1;


-- 11. Get Check-in Details for a Specific Booking


SELECT c.checkin_time, c.seat_number, c.baggage_count
FROM checkins c
JOIN bookings b ON c.booking_id = b.booking_id
WHERE b.booking_id = 1;
-- Additional Features and Enhancements
-- Real-time Flight Status Updates:


