# 3160 Project
Nathan Adams\
James Cao\
Sebastian Palacios\
Irada Talyshkhanova\
Jontai Xaysombath
## Outline:
#### Introduction ###
The goal of this collaborative group project is to create a test database for a campus-operated food delivery service, based on the already existing Crave On Campus company. The database will catalog people, locations, drivers, deliveries, food providers, and other entities, and will also factor in the relationships between entities. The result of this project will be a fully normalized database, which is created with consideration to business rules, entity relationship diagrams, normalization and schema design. This database will be presented through a narrated PowerPoint presentation that explains the database and its features, along with an SQL dump of the database. This README.md provides a table of contents for the project and is split into categories based on topic.

---
#### Use Case
![alt text](https://github.com/jimmyiimmv/3160collaboration/blob/master/UseCaseDiagram.PNG "UseCaseDiagram")

A customer can place an order at a restaurant and make a payment. A staff member creates the order and notifies the delivery person once it is ready. The driver picks up the food and delivers it to the customer. The customer can rate the driver and give any feedback they would like once the food is delivered. A new staff member can be added to the delivery service by the manager. The manager can also update staff information. 

---
#### Business Rules
1.	One person can be a student, facility, or staff.
2.	Student can be a driver, and a driver can be a student. Faculty or Staff cannot be a driver. 
3.	One Person can request many different orders, but an order can only have one Person. 
4.	A restaurant can have many locations, but a location can only have one restaurant. 
5.	A restaurant can have many order’s, but an order can only have one restaurant.
6.	A driver can have many orders, but an order can only have one driver. 
7.	A driver can only have one data hired, but date hired can have multiple drivers.
8.	A driver can have many ratings, but each rating is only associated with one driver. 
---
#### EERD
![alt text](https://github.com/jimmyiimmv/3160collaboration/blob/master/EERDModel.png "EERD")

---
#### MySQL Queries
SELECT DISTINCT\
  driver.driver_id as "Driver ID",\
  person.person_id as ID,\
  person.person_name as "Name",\
  person.person_email as Email,\
  driver.license_number as "License Number",\
  driver.date_hired as "Date Hired",\
  driver.rating as Rating\
FROM campus_eats.person as person, campus_eats.driver as driver\
WHERE person.person_id IN (SELECT student_id FROM driver)\
  AND person.person_id = driver.student_id\
ORDER BY driver.driver_id\
\
SELECT\
  person.person_id as ID,\
  person.person_name as "Name",\
  person.person_email as Email,\
  staff.position as Position,\
  staff.is_admin as "Admin? (Y/N)"\
FROM campus_eats.person as person\
INNER JOIN campus_eats.staff as staff on staff.staff_id = person.person_id\
ORDER BY person.person_name ASC\

---
#### MySQL dump


---
