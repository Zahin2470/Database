drop table MANAGER cascade constraints;
drop table HOTEL cascade constraints;
drop table SERVER cascade constraints;
drop table CHEF cascade constraints;
drop table SERVICE_JOB cascade constraints;
drop table EMPLOYEE cascade constraints;
drop table FLOOR cascade constraints;
drop table ROOM_STATUS cascade constraints;
drop table ROOM_CLASS cascade constraints;
drop table ROOM cascade constraints;
drop table GUEST cascade constraints;
drop table PAYMENT_STATUS cascade constraints;
drop table RESERVATION cascade constraints;
drop table ADD_ON cascade constraints;
drop table RESERVATION_ADDON cascade constraints;
drop table FEATURES cascade constraints;
drop table ROOM_CLASS_FEATURES cascade constraints;
drop table BEDTYPE cascade constraints;
drop table ROOM_CLASS_BEDTYPE cascade constraints;

CREATE TABLE MANAGER (
    manager_id VARCHAR(10) PRIMARY KEY,
    employee_id VARCHAR(10) UNIQUE,
    manager_name VARCHAR(25),
    gender VARCHAR(10),
    phone_number VARCHAR(20)
);

CREATE TABLE HOTEL (
    hotel_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    address VARCHAR(25),
    city VARCHAR(20),
    FOREIGN KEY (manager_id) REFERENCES MANAGER(manager_id)
);

CREATE TABLE SERVER (
    server_id VARCHAR(10) PRIMARY KEY,
    server_type VARCHAR(15)
);

CREATE TABLE CHEF (
    chef_id VARCHAR(10) PRIMARY KEY,
    food_item VARCHAR(30)
);

CREATE TABLE SERVICE_JOB (
    service_id VARCHAR(10) PRIMARY KEY,
    server_id VARCHAR(10),
    chef_id VARCHAR(10),
    FOREIGN KEY (server_id) REFERENCES SERVER(server_id),
    FOREIGN KEY (chef_id) REFERENCES CHEF(chef_id)
);

CREATE TABLE EMPLOYEE (
    employee_id VARCHAR(10) PRIMARY KEY,
    hotel_id VARCHAR(10),
    service_id VARCHAR(10),
    employee_name VARCHAR(25),
    gender VARCHAR(10),
    phone_number VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES HOTEL(hotel_id),
    FOREIGN KEY (service_id) REFERENCES SERVICE_JOB(service_id)
);

CREATE TABLE FLOOR (
    floor_id VARCHAR(10) PRIMARY KEY,
    floor_number INT,
    floor_side VARCHAR(50)
);

CREATE TABLE ROOM_STATUS (
    room_status_id VARCHAR(10) PRIMARY KEY,
    status_name VARCHAR(50)
);

CREATE TABLE ROOM_CLASS (
    room_class_id VARCHAR(10) PRIMARY KEY,
    class_name VARCHAR(30),
    start_price DECIMAL(10, 2)
);

CREATE TABLE ROOM (
    room_id VARCHAR(10) PRIMARY KEY,
    hotel_id VARCHAR(10),
    floor_id VARCHAR(10),
    room_class_id VARCHAR(10),
    room_status_id VARCHAR(10),
    room_number VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES HOTEL(hotel_id),
    FOREIGN KEY (floor_id) REFERENCES FLOOR(floor_id),
    FOREIGN KEY (room_class_id) REFERENCES ROOM_CLASS(room_class_id),
    FOREIGN KEY (room_status_id) REFERENCES ROOM_STATUS(room_status_id)
);

CREATE TABLE GUEST (
    guest_id VARCHAR(10) PRIMARY KEY,
    guest_name VARCHAR(25),
    phone_number VARCHAR(20),
    email VARCHAR(30)
);

CREATE TABLE PAYMENT_STATUS (
    payment_status_id VARCHAR(10) PRIMARY KEY,
    payment_status_name VARCHAR(50)
);

CREATE TABLE RESERVATION (
    reservation_id VARCHAR(10) PRIMARY KEY,
    guest_id VARCHAR(10),
    room_id VARCHAR(10),
    payment_status_id VARCHAR(10),
    check_in_date DATE,
    check_out_date DATE,
    num_of_people INT,
    num_of_children INT,
    reservation_amount DECIMAL(10, 2),
    FOREIGN KEY (guest_id) REFERENCES GUEST(guest_id),
    FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
    FOREIGN KEY (payment_status_id) REFERENCES PAYMENT_STATUS(payment_status_id)
);

CREATE TABLE ADD_ON (
    addon_id VARCHAR(10) PRIMARY KEY,
    addon_name VARCHAR(25),
    price DECIMAL(10, 2)
);

CREATE TABLE RESERVATION_ADDON (
    reservation_id VARCHAR(10),
    addon_id VARCHAR(10),
    PRIMARY KEY (reservation_id, addon_id),
    FOREIGN KEY (reservation_id) REFERENCES RESERVATION(reservation_id),
    FOREIGN KEY (addon_id) REFERENCES ADD_ON(addon_id)
);

CREATE TABLE FEATURES (
    feature_id VARCHAR(10) PRIMARY KEY,
    feature_name VARCHAR(25)
);

CREATE TABLE ROOM_CLASS_FEATURES (
    room_class_id VARCHAR(10),
    feature_id VARCHAR(10),
    PRIMARY KEY (room_class_id, feature_id),
    FOREIGN KEY (room_class_id) REFERENCES ROOM_CLASS(room_class_id),
    FOREIGN KEY (feature_id) REFERENCES FEATURES(feature_id)
);

CREATE TABLE BEDTYPE (
    bed_type_id VARCHAR(10) PRIMARY KEY,
    bed_type_name VARCHAR(10)
);

CREATE TABLE ROOM_CLASS_BEDTYPE (
    room_class_id VARCHAR(10),
    bed_type_id VARCHAR(10),
    num_of_beds INT,
    PRIMARY KEY (room_class_id, bed_type_id),
    FOREIGN KEY (room_class_id) REFERENCES ROOM_CLASS(room_class_id),
    FOREIGN KEY (bed_type_id) REFERENCES BEDTYPE(bed_type_id)
);


INSERT INTO MANAGER (manager_id, employee_id, manager_name, gender, phone_number)
VALUES
    ('m01', 'e01', 'Ibrahim Manager', 'Male', '013456-78901');


INSERT INTO HOTEL (hotel_id, manager_id, address, city)
VALUES
    ('h01', 'm01', '123 Gulsan', 'Dhaka');


INSERT INTO SERVER VALUES ('sv03', 'Breakfast');
INSERT INTO SERVER VALUES ('sv04', 'Lunch');
INSERT INTO SERVER VALUES ('sv05', 'Dinner'); 
INSERT INTO SERVER VALUES ('sv06', 'Breakfast');
INSERT INTO SERVER VALUES ('sv07', 'Lunch');
INSERT INTO SERVER VALUES ('sv08', 'Dinner');
INSERT INTO SERVER VALUES ('sv09', 'Breakfast');
INSERT INTO SERVER VALUES ('sv10', 'Lunch');
INSERT INTO SERVER VALUES ('sv01', 'Dinner');
INSERT INTO SERVER VALUES ('sv02', 'Breakfast');


INSERT INTO CHEF VALUES ('cf03', 'Eggs Benedict');
INSERT INTO CHEF VALUES ('cf04', 'Grilled Chicken Salad');
INSERT INTO CHEF VALUES ('cf05', 'Steak and Potatoes');
INSERT INTO CHEF VALUES ('cf06', 'Pancakes');
INSERT INTO CHEF VALUES ('cf07', 'Sandwiches');
INSERT INTO CHEF VALUES ('cf08', 'Pasta');
INSERT INTO CHEF VALUES ('cf09', 'French Toast');
INSERT INTO CHEF VALUES ('cf10', 'Burgers');
INSERT INTO CHEF VALUES ('cf01', 'Seafood Platter');
INSERT INTO CHEF VALUES ('cf02', 'Waffles');


INSERT INTO SERVICE_JOB VALUES ('s01', 'sv01', 'cf02');
INSERT INTO SERVICE_JOB VALUES ('s02', 'sv02', 'cf01');
INSERT INTO SERVICE_JOB VALUES ('s03', 'sv03', 'cf04');
INSERT INTO SERVICE_JOB VALUES ('s04', 'sv04', 'cf03');
INSERT INTO SERVICE_JOB VALUES ('s05', 'sv05', 'cf06');
INSERT INTO SERVICE_JOB VALUES ('s06', 'sv06', 'cf05');
INSERT INTO SERVICE_JOB VALUES ('s07', 'sv07', 'cf08');
INSERT INTO SERVICE_JOB VALUES ('s08', 'sv08', 'cf07');
INSERT INTO SERVICE_JOB VALUES ('s09', 'sv09', 'cf10');
INSERT INTO SERVICE_JOB VALUES ('s10', 'sv10', 'cf09');


INSERT INTO EMPLOYEE VALUES ('e01', 'h01', 's01', 'Abrar Zahin', 'Male', '01711-111111');
INSERT INTO EMPLOYEE VALUES ('e02', 'h01', 's02', 'Amlan', 'Male', '01812-222222');
INSERT INTO EMPLOYEE VALUES ('e03', 'h01', 's03', 'Akiba', 'Female', '01913-333333');
INSERT INTO EMPLOYEE VALUES ('e04', 'h01', 's04', 'Sumaiya', 'Female', '01414-444444');
INSERT INTO EMPLOYEE VALUES ('e05', 'h01', 's05', 'Rafid', 'Male', '01515-555555');
INSERT INTO EMPLOYEE VALUES ('e06', 'h01', 's06', 'Nafisa', 'Female', '01316-666666');
INSERT INTO EMPLOYEE VALUES ('e07', 'h01', 's07', 'Sajib', 'Male', '01817-777777');
INSERT INTO EMPLOYEE VALUES ('e08', 'h01', 's08', 'Jebin', 'Female', '01618-888888');
INSERT INTO EMPLOYEE VALUES ('e09', 'h01', 's09', 'Midul', 'Male', '01719-999999');
INSERT INTO EMPLOYEE VALUES ('e10', 'h01', 's10', 'Ahamed', 'Male', '01320-000000');


INSERT INTO FLOOR VALUES ('fl03', 2, 'East');
INSERT INTO FLOOR VALUES ('fl04', 2, 'West');
INSERT INTO FLOOR VALUES ('fl05', 3, 'East');
INSERT INTO FLOOR VALUES ('fl06', 3, 'North');
INSERT INTO FLOOR VALUES ('fl07', 4, 'East');
INSERT INTO FLOOR VALUES ('fl08', 4, 'South');
INSERT INTO FLOOR VALUES ('fl09', 5, 'North');
INSERT INTO FLOOR VALUES ('fl10', 5, 'West');
INSERT INTO FLOOR VALUES ('fl01', 6, 'East');
INSERT INTO FLOOR VALUES ('fl02', 6, 'South');


INSERT INTO ROOM_STATUS VALUES ('rs01', 'Available');
INSERT INTO ROOM_STATUS VALUES ('rs02', 'Occupied');
INSERT INTO ROOM_STATUS VALUES ('rs03', 'Maintenance');
INSERT INTO ROOM_STATUS VALUES ('rs04', 'Cleaning');
INSERT INTO ROOM_STATUS VALUES ('rs05', 'Out of Order');
INSERT INTO ROOM_STATUS VALUES ('rs06', 'Reserved');
INSERT INTO ROOM_STATUS VALUES ('rs07', 'Under Renovation');
INSERT INTO ROOM_STATUS VALUES ('rs08', 'Vacant');
INSERT INTO ROOM_STATUS VALUES ('rs09', 'Ready for Check-in');
INSERT INTO ROOM_STATUS VALUES ('rs10', 'Ready for Check-out');


INSERT INTO ROOM_CLASS VALUES ('rc03', 'Standard', 100.00);
INSERT INTO ROOM_CLASS VALUES ('rc04', 'Deluxe', 150.00);
INSERT INTO ROOM_CLASS VALUES ('rc05', 'Suite', 200.00);
INSERT INTO ROOM_CLASS VALUES ('rc06', 'Penthouse', 300.00);
INSERT INTO ROOM_CLASS VALUES ('rc07', 'Studio', 120.00);
INSERT INTO ROOM_CLASS VALUES ('rc08', 'Loft', 180.00);
INSERT INTO ROOM_CLASS VALUES ('rc09', 'Chalet', 250.00);
INSERT INTO ROOM_CLASS VALUES ('rc10', 'Bungalow', 220.00);
INSERT INTO ROOM_CLASS VALUES ('rc01', 'Cabin', 170.00);
INSERT INTO ROOM_CLASS VALUES ('rc02', 'Villa', 350.00);


INSERT INTO ROOM VALUES ('rm03', 'h01', 'fl03', 'rc03', 'rs01', '103C');
INSERT INTO ROOM VALUES ('rm04', 'h01', 'fl04', 'rc04', 'rs01', '104D');
INSERT INTO ROOM VALUES ('rm05', 'h01', 'fl05', 'rc05', 'rs01', '105E');
INSERT INTO ROOM VALUES ('rm06', 'h01', 'fl06', 'rc06', 'rs01', '106F');
INSERT INTO ROOM VALUES ('rm07', 'h01', 'fl07', 'rc07', 'rs01', '107G');
INSERT INTO ROOM VALUES ('rm08', 'h01', 'fl08', 'rc08', 'rs01', '108H');
INSERT INTO ROOM VALUES ('rm09', 'h01', 'fl09', 'rc09', 'rs01', '109I');
INSERT INTO ROOM VALUES ('rm10', 'h01', 'fl10', 'rc10', 'rs01', '110J');
INSERT INTO ROOM VALUES ('rm01', 'h01', 'fl01', 'rc01', 'rs01', '111K');
INSERT INTO ROOM VALUES ('rm02', 'h01', 'fl02', 'rc02', 'rs01', '112L');

INSERT INTO GUEST VALUES ('g03', 'Amina Rahman', '01711-111111', 'amina.rahman@example.com');
INSERT INTO GUEST VALUES ('g04', 'Bashir Uddin', '01712-222222', 'bashir.uddin@example.com');
INSERT INTO GUEST VALUES ('g05', 'Farhana Islam', '01713-333333', 'farhana.islam@example.com');
INSERT INTO GUEST VALUES ('g06', 'Mahmud Hasan', '01714-444444', 'mahmud.hasan@example.com');
INSERT INTO GUEST VALUES ('g07', 'Shabnam Akter', '01715-555555', 'shabnam.akter@example.com');
INSERT INTO GUEST VALUES ('g08', 'Jamal Ahmed', '01716-666666', 'jamal.ahmed@example.com');
INSERT INTO GUEST VALUES ('g09', 'Olivia Chowdhury', '01717-777777', 'olivia.chowdhury@example.com');
INSERT INTO GUEST VALUES ('g10', 'Dulal Hossain', '01718-888888', 'dulal.hossain@example.com');
INSERT INTO GUEST VALUES ('g01', 'Israt Jahan', '01719-999999', 'israt.jahan@example.com');
INSERT INTO GUEST VALUES ('g02', 'Wahid Ali', '01710-000000', 'wahid.ali@example.com');

INSERT INTO PAYMENT_STATUS VALUES ('p03', 'Cancelled');
INSERT INTO PAYMENT_STATUS VALUES ('p04', 'Refunded');
INSERT INTO PAYMENT_STATUS VALUES ('p05', 'Partially Paid');
INSERT INTO PAYMENT_STATUS VALUES ('p06', 'Overdue');
INSERT INTO PAYMENT_STATUS VALUES ('p07', 'Completed');
INSERT INTO PAYMENT_STATUS VALUES ('p08', 'Processing');
INSERT INTO PAYMENT_STATUS VALUES ('p09', 'Failed');
INSERT INTO PAYMENT_STATUS VALUES ('p10', 'Authorized');
INSERT INTO PAYMENT_STATUS VALUES ('p01', 'Voided');
INSERT INTO PAYMENT_STATUS VALUES ('p02', 'Pending Approval');

INSERT INTO RESERVATION VALUES ('r01', 'g01', 'rm01', 'p01', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), 2, 1, 170.00);
INSERT INTO RESERVATION VALUES ('r02', 'g02', 'rm02', 'p02', TO_DATE('2024-05-03', 'YYYY-MM-DD'), TO_DATE('2024-05-07', 'YYYY-MM-DD'), 3, 2, 350.00);
INSERT INTO RESERVATION VALUES ('r03', 'g03', 'rm03', 'p03', TO_DATE('2024-05-05', 'YYYY-MM-DD'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 2, 0, 100.00);
INSERT INTO RESERVATION VALUES ('r04', 'g04', 'rm04', 'p04', TO_DATE('2024-05-07', 'YYYY-MM-DD'), TO_DATE('2024-05-12', 'YYYY-MM-DD'), 1, 1, 150.00);
INSERT INTO RESERVATION VALUES ('r05', 'g05', 'rm05', 'p05', TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-05-14', 'YYYY-MM-DD'), 2, 2, 200.00);
INSERT INTO RESERVATION VALUES ('r06', 'g06', 'rm06', 'p06', TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-16', 'YYYY-MM-DD'), 1, 0, 300.00);
INSERT INTO RESERVATION VALUES ('r07', 'g07', 'rm07', 'p07', TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2024-05-18', 'YYYY-MM-DD'), 2, 1, 120.00);
INSERT INTO RESERVATION VALUES ('r08', 'g08', 'rm08', 'p08', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), 3, 3, 180.00);
INSERT INTO RESERVATION VALUES ('r09', 'g09', 'rm09', 'p09', TO_DATE('2024-05-17', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 2, 2, 250.00);
INSERT INTO RESERVATION VALUES ('r10', 'g10', 'rm10', 'p10', TO_DATE('2024-05-19', 'YYYY-MM-DD'), TO_DATE('2024-05-24', 'YYYY-MM-DD'), 1, 0, 220.00);


INSERT INTO ADD_ON VALUES ('a04', 'City Tour', 30.00);
INSERT INTO ADD_ON VALUES ('a05', 'Airport Shuttle', 25.00);
INSERT INTO ADD_ON VALUES ('a06', 'Room Service', 20.00);
INSERT INTO ADD_ON VALUES ('a07', 'Laundry Service', 15.00);
INSERT INTO ADD_ON VALUES ('a08', 'Bike Rental', 10.00);
INSERT INTO ADD_ON VALUES ('a09', 'Gym Access', 5.00);
INSERT INTO ADD_ON VALUES ('a10', 'Welcome Basket', 40.00);
INSERT INTO ADD_ON VALUES ('a01', 'Champagne', 50.00);
INSERT INTO ADD_ON VALUES ('a02', 'Concierge Service', 35.00);
INSERT INTO ADD_ON VALUES ('a03', 'Late Checkout', 30.00);


INSERT INTO RESERVATION_ADDON VALUES ('r03', 'a04');
INSERT INTO RESERVATION_ADDON VALUES ('r04', 'a05');
INSERT INTO RESERVATION_ADDON VALUES ('r04', 'a06');
INSERT INTO RESERVATION_ADDON VALUES ('r06', 'a07');
INSERT INTO RESERVATION_ADDON VALUES ('r07', 'a08');
INSERT INTO RESERVATION_ADDON VALUES ('r08', 'a09');
INSERT INTO RESERVATION_ADDON VALUES ('r09', 'a10');
INSERT INTO RESERVATION_ADDON VALUES ('r10', 'a01');
INSERT INTO RESERVATION_ADDON VALUES ('r01', 'a02');
INSERT INTO RESERVATION_ADDON VALUES ('r02', 'a03');

INSERT INTO FEATURES VALUES ('f03', 'Balcony');
INSERT INTO FEATURES VALUES ('f04', 'Ocean View');
INSERT INTO FEATURES VALUES ('f05', 'Fireplace');
INSERT INTO FEATURES VALUES ('f06', 'Private Pool');
INSERT INTO FEATURES VALUES ('f07', 'Kitchenette');
INSERT INTO FEATURES VALUES ('f08', 'Garden View');
INSERT INTO FEATURES VALUES ('f09', 'Hot Tub');
INSERT INTO FEATURES VALUES ('f10', 'Mountain View');
INSERT INTO FEATURES VALUES ('f01', 'In-Room Bar');
INSERT INTO FEATURES VALUES ('f02', 'Terrace');


INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc03', 'f03');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc04', 'f04');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc05', 'f05');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc06', 'f06');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc07', 'f07');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc08', 'f08');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc09', 'f09');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc10', 'f10');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc01', 'f01');
INSERT INTO ROOM_CLASS_FEATURES VALUES ('rc02', 'f02');


INSERT INTO BEDTYPE VALUES ('bt03', 'Double');
INSERT INTO BEDTYPE VALUES ('bt04', 'King');
INSERT INTO BEDTYPE VALUES ('bt05', 'California');
INSERT INTO BEDTYPE VALUES ('bt06', 'Queen');
INSERT INTO BEDTYPE VALUES ('bt07', 'Twin');
INSERT INTO BEDTYPE VALUES ('bt08', 'Full');
INSERT INTO BEDTYPE VALUES ('bt09', 'Single');
INSERT INTO BEDTYPE VALUES ('bt10', 'Murphy');
INSERT INTO BEDTYPE VALUES ('bt01', 'Daybed');
INSERT INTO BEDTYPE VALUES ('bt02', 'Sofa Bed');


INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc03', 'bt03', 2);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc04', 'bt04', 1);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc05', 'bt05', 1);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc06', 'bt06', 2);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc07', 'bt07', 1);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc08', 'bt08', 3);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc09', 'bt09', 1);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc10', 'bt10', 1);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc01', 'bt01', 3);
INSERT INTO ROOM_CLASS_BEDTYPE VALUES ('rc02', 'bt02', 1);

Select * from MANAGER;
Select * from HOTEL;
Select * from SERVER;
Select * from CHEF;
Select * from SERVICE_JOB;
Select * from EMPLOYEE;
Select * from FLOOR;
Select * from ROOM_STATUS;
Select * from ROOM_CLASS;
Select * from ROOM;
Select * from GUEST;
Select * from PAYMENT_STATUS;
Select * from RESERVATION;
Select * from ADD_ON;
Select * from RESERVATION_ADDON;
Select * from FEATURES;
Select * from ROOM_CLASS_FEATURES;
Select * from BEDTYPE;
Select * from ROOM_CLASS_BEDTYPE;