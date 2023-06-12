/* Create database */

CREATE DATABASE dealership;

/* Created the tables */

CREATE TABLE dealerships (
	dealership_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
    );

CREATE TABLE vehicles (
	vin int NOT NULL PRIMARY KEY,
	year int NOT NULL,
	make VARCHAR(10) NOT NULL,
	model VARCHAR(15) NOT NULL,
    odometer int NOT NULL,
	color VARCHAR(10),
	vehicle_type VARCHAR(10),
	price double NOT NULL,
	sold boolean NOT NULL
);

CREATE TABLE inventory (
	dealership_id int NOT NULL,
	vin int NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

CREATE TABLE sales_contracts (
	contract_number int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contract_date date NOT NULL,
    dealership_id int NOT NULL,
    customer_name VARCHAR(15) NOT NULL,
    customer_address VARCHAR(25) NOT NULL,
    customer_city VARCHAR(25) NOT NULL,
    customer_state VARCHAR(2) NOT NULL,
    customer_postal int NOT NULL,
    custumer_phone VARCHAR(20),
    vin int NOT NULL,
    finance boolean NOT NULL,
    monthly_terms int NOT NULL,
    monthly_payment double NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

/* Populating the tables*/

INSERT INTO dealerships (name, address, phone) -- 1
	VALUES ("Plaza Auto Mall",
			"2740 Nostrand Ave. Brooklyn NY 11210",
            "(347) 554-6100"
            );
INSERT INTO dealerships (name, address, phone) -- 2
	VALUES ("Hyundai City of Bay Ridge", 
			"9013 Fourth Ave Brooklyn, NY 11209", 
            "(929) 334-4661"
            ); 

INSERT INTO vehicles
	VALUES (123456, 
			2020, 
            "Honda", 
            "CR-V", 
            23456, 
            "Blue", 
            "SUV", 
            28995.98, 
            0
            );
INSERT INTO vehicles
	VALUES (558190, 
			2021, 
            "Hyundai", 
            "Sonata", 
            9332, 
            "Gray", 
            "Sedan", 
            23384.91, 
            0
            );
INSERT INTO vehicles
	VALUES (339181, 
			2023, 
            "Kia", 
            "Carnival", 
            4, 
            "Black", 
            "Mini Van", 
            38346.8, 
            0
            );
INSERT INTO vehicles
	VALUES (110365, 
			2019, 
            "Ford", 
            "F-250", 
            35950, 
            "Gray", 
            "Pick-up", 
            32895.9, 
            0
            );

INSERT INTO inventory
	VALUES (1, 123456);
INSERT INTO inventory
	VALUES (1, 339181);
INSERT INTO inventory
	VALUES (2, 558190);
INSERT INTO inventory
	VALUES (2, 110365);
 
INSERT INTO sales_contracts(contract_date,dealership_id,customer_name,customer_address,customer_city,customer_state,customer_postal,custumer_phone,vin,finance,monthly_terms,monthly_payment)
	VALUES ('2023-02-20',
			1,
            "John Smith",
            "123 Main St."
            "Brooklyn"
            "NY",
            11256,
            "(347) 123-4567",
            123456,
            1,
            72,
            402.14
			);
UPDATE vehicles
SET sold = 1
WHERE vin = 123456;
    
INSERT INTO sales_contracts(contract_date,dealership_id,customer_name,customer_address,customer_city,customer_state,customer_postal,custumer_phone,vin,finance,monthly_terms,monthly_payment)
	VALUES ('2023-03-14',
			2,
            "Jane Doe",
            "23 3rd Ave.",
			"New York",
            "NY",
            "10001",
            "(718) 240-7721",
            110365,
            0,
            0,
            0.0
            );
UPDATE vehicles
SET sold = 1
WHERE vin = 110365;