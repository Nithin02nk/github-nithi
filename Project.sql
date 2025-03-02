-- 1. Airlines Table

CREATE TABLE airlines (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_name VARCHAR(255),
    airline_code VARCHAR(10) UNIQUE
);


-- 2. Airports Table

CREATE TABLE airports (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    airport_name VARCHAR(255),
    airport_code VARCHAR(10) UNIQUE,
    location VARCHAR(255)
);



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

select * from flights;

-- 4. Passengers Table

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    passport_number VARCHAR(50) UNIQUE,
    nationality VARCHAR(50)
);



-- 5. Bookings Table

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Booked', 'Checked-in', 'Cancelled'),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);



-- 6. Check-ins Table

CREATE TABLE checkins (
    checkin_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    checkin_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    seat_number VARCHAR(10),
    baggage_count INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);



-- 7. Baggage Table


CREATE TABLE baggage (
    baggage_id INT PRIMARY KEY AUTO_INCREMENT,
    checkin_id INT,
    baggage_weight DECIMAL(5, 2),
    baggage_type ENUM('Cabin', 'Checked'),
    FOREIGN KEY (checkin_id) REFERENCES checkins(checkin_id)
);




-- 8. Flight Schedules Table

CREATE TABLE flight_schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT,
    gate_number VARCHAR(10),
    terminal_number VARCHAR(10),
    schedule_time DATETIME,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);







