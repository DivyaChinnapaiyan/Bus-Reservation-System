-- database creation
create database Bus_Booking;
-- use database
use Bus_Booking;

-- passenger table creation
create table Passenger(
passenger_id int primary key,
passenger_name varchar(50) not null,
age int,
gender varchar(50),
contact bigint);

-- payments table creation
create table Payments(
payment_id int primary key,
payment_date date,
passenger_id int,
-- adding foreign key constraint to the payments table
constraint fk_payments_passenger_id foreign key(passenger_id)references Passenger(passenger_id)
on delete set null);

-- bus table creation
create table Bus(
bus_id int primary key,
bus_number int not null,
bus_seats int);

-- driver table creation
create table Driver(
driver_id int primary key,
driver_name varchar(50) not null,
contact bigint,
age int,
gender varchar(50),
bus_id int);
-- adding foreign key constraint to the driver table
alter table driver add constraint fk_driver_bus_id foreign key(bus_id)references Bus(bus_id)
on delete set null;
-- bus_route table creation
create table Bus_Route(
route_id int primary key,
start_place varchar(50),
end_place varchar(50),
bus_id int,
-- adding foreign key constraint to the bus_route table
constraint fk_route_bus_id foreign key(bus_id)references Bus(bus_id)
on delete set null);
 
-- reservation table creation 
create table Reservation(
reservation_id int primary key not null,
reservation_date date,
passenger_id int,
-- adding foreign key constraint to the reservation table
constraint fk_reservation_passenger_id foreign key(passenger_id)references Passenger(passenger_id)
on delete set null,
route_id int,
-- adding foreign key constraint to the reservation table
constraint fk_reservation_route_id foreign key(route_id)references Bus_Route(route_id)
on delete set null,
bus_id int,
-- adding foreign key constraint to the reservation table
constraint fk_reservation_bus_id foreign key(bus_id)references Bus(bus_id)
on delete set null);

-- transaction_reports table creation
create table Transaction_reports(
report_id int primary key not null,
transaction_date date,
transaction_time time,
passenger_id int,
-- adding foreign key constraint to the transaction_reports table
constraint fk_transaction_passenger_id foreign key(passenger_id)references Passenger(passenger_id)
on delete set null,
reservation_id int,
-- adding foreign key constraint to the transaction_reports table
constraint fk_transaction_reservation_id foreign key(reservation_id)references Reservation(reservation_id)
on delete set null,
payment_id int,
-- adding foreign key constraint to the transaction_reports table
constraint fk_transaction_payment_id foreign key(payment_id)references Payments(payment_id)
on delete set null);

-- insert values into passenger table
insert into Passenger(passenger_id,passenger_name,age,gender,contact)values
(701,'kavin',30,'male',8954763210),
(702,'arun',40,'male',8741256398),
(703,'prakash',50,'male',9864123014),
(704,'uma',40,'female',9745210356),
(705,'rithika',25,'female',6547893201),
(706,'santhosh',30,'male',7412035846),
(707,'kavi',52,'female',9425103475),
(708,'karthick',40,'male',6587410258),
(709,'manoj',32,'male',8542367154),
(710,'yuva',35,'female',9854120365),
(711,'sri',36,'female',8469521307),
(712,'ramya',42,'female',9875421036),
(713,'selvi',25,'female',8210354796),
(714,'gowtham',29,'male',6521034784),
(715,'kumar',30,'male',7458963210),
(716,'kavi',24,'female',6987452103),
(717,'hari',28,'male',8321054789),
(718,'muthu',27,'female',8213540671),
(719,'ram',50,'male',6528989741),
(720,'priya',47,'female',9874879652);

-- insert values into payments table
insert into Payments(payment_id,payment_date,passenger_id)values
(901,'2025-01-05',701),
(902,'2025-02-04',705),
(903,'2025-03-04',705),
(904,'2025-01-06',703),
(905,'2025-01-04',718),
(906,'2025-02-07',718),
(907,'2025-03-15',720),
(908,'2025-02-21',710),
(909,'2025-01-06',715),
(910,'2025-02-22',702),
(911,'2025-02-06',708),
(912,'2025-02-08',703),
(913,'2025-01-09',704),
(914,'2025-01-26',707),
(915,'2025-01-25',706),
(916,'2025-03-18',708),
(917,'2025-03-27',714),
(918,'2025-03-24',715),
(919,'2025-02-15',718),
(920,'2025-03-02',720);

-- insert values into bus table
insert into Bus(bus_id,bus_number,bus_seats)values
(1,8521,60),
(2,4568,60),
(3,7412,50),
(4,9658,55),
(5,3210,55),
(6,4587,60),
(7,2561,58),
(8,2049,60),
(9,8530,60),
(10,2493,55),
(11,4015,60),
(12,5549,50),
(13,1025,50),
(14,7548,54),
(15,3541,55),
(16,2596,60),
(17,3854,58),
(18,6584,60),
(19,1567,50),
(20,9543,60);

-- insert values into driver table
insert into Driver(driver_id,driver_name,contact,age,gender,bus_id)values
(201,'muthu',8457123690,30,'male',20),
(202,'mithun',6587412350,45,'male',16),
(203,'raja',9854120314,55,'male',15),
(204,'giri',7415874520,42,'male',3),
(205,'hari',8541276547,38,'male',6),
(206,'ramesh',6254189745,32,'male',5),
(207,'suresh',8540321458,28,'male',4),
(208,'ravi',9874102568,52,'male',7),
(209,'kavin',6320021475,48,'male',7),
(210,'kumar',9874587587,45,'male',7),
(211,'rahul',7474895412,36,'male',8),
(212,'sanjay',6587898421,38,'male',9),
(213,'gowtham',8454562103,28,'male',8),
(214,'kavin',7842361023,29,'male',9),
(215,'karthick',6100254789,55,'male',4),
(216,'naren',7852698541,50,'male',4),
(217,'senthil',9888541023,35,'male',12),
(218,'rahul',7458915478,42,'male',12),
(219,'mani',8854112200,37,'male',15),
(220,'prakash',7458961235,29,'male',20);

-- insert values into bus_route table
insert into Bus_route(route_id,start_place,end_place,bus_id)values
(81,'chennai','banglore',19),
(82,'erode','chennai',12),
(83,'trichy','coimbatore',20),
(84,'coimbatore','chennai',10),
(85,'theni','madurai',6),
(86,'banglore','madurai',7),
(87,'tirupur','chennai',6),
(88,'salem','coimbatore',5),
(89,'salem','madurai',13),
(90,'karur','salem',19),
(91,'dharmapuri','coimbatore',14),
(92,'krishnagiri','chennai',17),
(93,'vellore','coimbatore',12),
(94,'tirupur','theni',10),
(95,'erode','chennai',20),
(96,'coimbatore','salem',6),
(97,'chennai','coimbatore',8),
(98,'tirupur','chennai',2),
(99,'karur','salem',1),
(100,'erode','coimbatore',4);

-- insert values into reservation table
insert into reservation(reservation_id,reservation_date,passenger_id,bus_id,route_id)values
(301,'2025-06-02',710,20,83),
(302,'2025-02-14',718,15,84),
(303,'2025-06-03',708,19,87),
(304,'2025-08-16',704,18,82),
(305,'2025-10-12',706,15,83),
(306,'2025-12-10',709,14,99),
(307,'2025-08-04',720,12,98),
(308,'2025-02-06',719,10,95),
(309,'2025-07-19',713,12,98),
(310,'2025-03-25',704,13,91),
(311,'2025-06-29',701,14,100),
(312,'2025-09-21',703,15,100),
(313,'2025-09-20',708,17,85),
(314,'2025-04-18',705,08,86),
(315,'2025-05-17',712,09,82),
(316,'2025-07-26',714,04,96),
(317,'2025-02-13',716,05,95),
(318,'2025-03-12',719,17,92),
(319,'2025-02-19',720,18,91),
(320,'2025-10-05',715,20,93);

-- insert values into transaction_reports table
insert into Transaction_Reports(report_id,transaction_date,transaction_time,passenger_id,reservation_id,payment_id)values
(601,'2025-01-02','02:52:30',712,301,901),
(602,'2025-02-11','05:40:20',702,312,914),
(603,'2025-01-03','08:30:40',706,314,918),
(604,'2025-03-04','04:10:02',719,318,920),
(605,'2025-01-06','05:50:10',702,305,910),
(606,'2025-02-08','11:52:20',704,308,906),
(607,'2025-01-05','06:30:50',716,307,907),
(608,'2025-03-15','08:23:14',718,304,903),
(609,'2025-02-26','12:20:40',712,309,908),
(610,'2050-01-25','10:40:25',720,308,915),
(611,'2025-02-14','09:50:19',720,308,912),
(612,'2025-03-28','05:30:40',719,312,916),
(613,'2025-03-03','12:53:36',709,315,918),
(614,'2025-03-13','09:40:20',710,316,912),
(615,'2025-02-15','02:55:23',708,314,920),
(616,'2025-01-28','07:15:28',705,317,910),
(617,'2025-02-24','12:26:34',712,320,903),
(618,'2025-02-27','11:24:10',713,320,902),
(619,'2025-02-26','06:50:30',710,314,904),
(620,'2025-02-13','02:14:03',702,317,912);


-- STORED PROCEDURE

-- 1.how many passengers have reserved a bus between january 1 2025, and march 1 2025?
delimiter //
create procedure reserved_bus(in date1 date,in date2 date)
begin
select count(distinct passenger_id)as total_passengers
from reservation
where reservation_date between date1 and date2;
end //
delimiter ;
call reserved_bus('2025-01-12','2025-03-01');

-- 2.retrieve the names of passenger who have boked a bus in the last 30 days? 
delimiter //
create procedure booked_bus(in days1 int)
begin 
select passenger_name,reservation_date
from passenger p join reservation r
on p.passenger_id=r.passenger_id
where r.reservation_date >= curdate()-interval days1 day;
end //
delimiter ;
call booked_bus(30);

-- 3.find all buses that have been idle(no bookings)in the past month?
delimiter //
create procedure unreserved_bus(in month1 int)
begin
select bus_id from bus
where bus_id not in(
select distinct bus_id from reservation
where reservation_date >= curdate() - interval month1 month);
end //
delimiter ;
call unreserved_bus(1);

-- 4.find the top 5 most frequently used buses based on total trips?
delimiter //
create procedure top_buses_by_trips(in top_bus int)
begin
SELECT bus_id, COUNT(reservation_id) AS total_trips
FROM Reservation
GROUP BY bus_id
ORDER BY total_trips DESC
LIMIT top_bus;
end //
delimiter ;
call top_buses_by_trips(5);

-- 5.find the total number of buses operating on a specific route?
delimiter //
create procedure route_id_bus(in route_id1 int)
begin
SELECT route_id, COUNT(bus_id) AS total_buses 
FROM Bus_Route
WHERE route_id = route_id1
GROUP BY route_id;
end //
delimiter ;
call route_id_bus(97);

-- 6.list all buses that are assigned to more than one route?
delimiter //
create procedure bus_route_total(in total_route1 int)
begin
select bus_id,count(route_id)as total_routes
from bus_route
group by bus_id
having total_routes > total_route1;
end //
delimiter ;
call bus_route_total(2);

-- 7.retrieve all reservation made for a specific bus on a given date?
delimiter //
create procedure reservation_details(in bus_id1 int,in reservation_date1 date)
begin
select * from reservation
where bus_id=bus_id1 and reservation_date=reservation_date1;
end //
delimiter ;
call reservation_details(12,'2025-08-04');

-- 8.list all passengers who have never made a reservation? 
delimiter //
create procedure unreserved_passenger()
begin
select passenger_name from passenger
where passenger_id not in(select distinct passenger_id from reservation);
end //
delimiter ;
call unreserved_passenger();

-- 9.list the transaction id for all reservation?
delimiter //
create procedure transaction_reservation2(in reservation_id2 int)
begin
select report_id from transaction_reports
where reservation_id=reservation_id2;
end //
delimiter ;
call transaction_reservation2(320);

-- 10.retrieve driver name for a specific bus id?
delimiter //
create procedure driver_by_bus_id(in bus_id int)
begin
SELECT driver_name  
FROM Driver d  
JOIN Bus b ON d.bus_id = b.bus_id  
WHERE b.bus_id = bus_id;
end //
delimiter ;
call driver_by_bus_id(12);

