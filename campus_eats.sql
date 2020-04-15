create database if not exists `Campus_Eats`;
use `Campus_Eats`;

#
# TABLE STRUCTURE FOR: person
#

DROP TABLE IF EXISTS `person`;

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(300) DEFAULT NULL,
  `person_email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (1, 'Rahsaan Collins', 'rcollins@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (2, 'Ansel Welch', 'awelch@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (3, 'Axel Bins PhD', 'abins@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (26, 'Frank Leffler', 'fleffler@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (27, 'Eden Schowalter', 'eschowalter@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (28, 'Eldridge Von', 'evon@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (39, 'Dagmar Kassulke', 'dkassulke@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (46, 'Haylee Hickle', 'hayleehickle@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (47, 'Mallory Rolfson', 'mrolfson@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (48, 'Lelia Tromp', 'ltromp@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (50, 'Amos Robinson', 'robinsonamos@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (59, 'Christian Jenkins', 'christianjenkins@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (64, 'Aubrey Hughes', 'ahughes@uncc.edu');
INSERT INTO `person` (`person_id`, `person_name`, `person_email`) VALUES (68, 'Clark Morgan', 'clarkmorgan@uncc.edu');


#
# TABLE STRUCTURE FOR: faculty
#
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `title` varchar(75) DEFAULT NULL,
  `degree_college` varchar(75) DEFAULT NULL,
  `highest_degree` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  CONSTRAINT `fk_F_person_id` FOREIGN KEY (`faculty_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
INSERT INTO `faculty` (`faculty_id`, `title`, `degree_college`, `highest_degree`) VALUES (1, 'Assistant Professor', 'UF', 'PhD');
INSERT INTO `faculty` (`faculty_id`, `title`, `degree_college`, `highest_degree`) VALUES (2, 'Professor', 'SJSU', 'Master');
INSERT INTO `faculty` (`faculty_id`, `title`, `degree_college`, `highest_degree`) VALUES (3, 'Adjunct Professor', 'UNCC', 'Master');

#
# TABLE STRUCTURE FOR: staff
#
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `position` varchar(75) DEFAULT NULL,
  `is_admin` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `fk_Staff_person_id` FOREIGN KEY (`staff_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `check_is_admin_y_n` CHECK (`is_admin` in ('Y','N'))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (26, 'VP Acad Affairs', 'Y');
INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (27, 'Lab Assistant', 'N');
INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (28, 'Dean Engineering', 'Y');
INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (50, 'Lab Assistant', 'Y');
INSERT INTO `staff` (`staff_id`, `position`, `is_admin`) VALUES (64, 'Library Maintenance Assistant', 'Y');
#
# TABLE STRUCTURE FOR: student
#
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `graduation_year` int(4) DEFAULT NULL,
  `major` varchar(75) DEFAULT NULL,
  `type` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  CONSTRAINT `fk_Student_person_id` FOREIGN KEY (`student_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (39, 1987, 'Philosophy', 'Undergraduate');
INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (47, 1986, 'Accounting', 'Undergraduate');
INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (48, 1978, 'Electronics', 'Graduate');
INSERT INTO `student` (`student_id`, `graduation_year`, `major`, `type`) VALUES (27, 2008, 'Computer Science', 'Graduate');
#
# TABLE STRUCTURE FOR: driver
#
DROP TABLE IF EXISTS `driver`;

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `license_number` varchar(75) DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  CONSTRAINT `fk_D_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
INSERT INTO `driver` (`driver_id`, `student_id`, `license_number`, `date_hired`, `rating`) VALUES (101, 47, 'fi3980', '2019-06-29', '4');
INSERT INTO `driver` (`driver_id`, `student_id`, `license_number`, `date_hired`, `rating`) VALUES (201, 27, 'js4003', '2020-02-15', '5');

#
# TABLE STRUCTURE FOR: order
#
DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `driver_Name` varchar(75) DEFAULT NULL,
  `delivery_Time` varchar(75) DEFAULT NULL,
  `delivery_Fee` varchar(75) DEFAULT NULL,
  `total_Price` varchar(75) DEFAULT NULL
  #PRIMARY KEY (`order_id`),
  #CONSTRAINT `fk_O_order_id` FOREIGN KEY (`order_id`) REFERENCES `person` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
INSERT INTO `order` (`order_id`, `driver_Name`, `delivery_Time`, `delivery_Fee`, `total_Price`) VALUES (200, 'Clark Morgan', '3:00', '$2.89', '$8.25');
INSERT INTO `order` (`order_id`, `driver_Name`, `delivery_Time`, `delivery_Fee`, `total_Price`) VALUES (201, 'Mallory Rolfson', '12:45', '$3.14', '$7.30');

#
# TABLE STRUCTURE FOR: restaurant
#
DROP TABLE IF EXISTS `restaurant`;


CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL,
  `location` varchar(128) NOT NULL,
  `schedule` varchar(128) NOT NULL,
  `link` varchar(75) DEFAULT NULL
  # PRIMARY KEY (`restaurant_id`),
  # CONSTRAINT `fk_R_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
INSERT INTO `restaurant` (`restaurant_id`, `location`, `schedule`,  `link`) VALUES (300, 'Albert St', 'M-F', 'www.TastyWings.com');
INSERT INTO `restaurant` (`restaurant_id`, `location`, `schedule`,  `link`) VALUES (303, 'Stanley Dr', 'Sat-Monday', 'www.EatMoreBeef.com');

#
# TABLE STRUCTURE FOR: locations
#
DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(75) NOT NULL,
  `location_address` varchar(75) NOT NULL,
  `latitude` varchar(75) NOT NULL,
  `longitude` varchar(75) NOT NULL
  # PRIMARY KEY (`location_id`),
  # CONSTRAINT `fk_L_location_id` FOREIGN KEY (`location_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
INSERT INTO `locations` (`location_id`, `location_name`, `location_address`, `latitude`, `longitude`) VALUES (400, 'Outback', '209 Worth Street', 12, 12);
INSERT INTO `locations` (`location_id`, `location_name`, `location_address`, `latitude`, `longitude`) VALUES (401, 'McDonalds', '187 Palace Way', 13, 13);
INSERT INTO `locations` (`location_id`, `location_name`, `location_address`, `latitude`, `longitude`) VALUES (402, 'Red Lobster', '110 Foxton Road', 14, 14);
