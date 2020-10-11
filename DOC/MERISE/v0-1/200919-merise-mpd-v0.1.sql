CREATE DATABASE chezaurel CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE chezaurel;

CREATE TABLE `t_street_types` (
	`street_type` VARCHAR(10) PRIMARY KEY
)engine=InnoDB;

CREATE TABLE `t_cities`(
	`city_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `city_name` VARCHAR(50) NOT NULL,
    `city_zipcode` VARCHAR(50) NOT NULL 
)engine=InnoDB; 

CREATE TABLE `t_roles`(
	`role_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role_name` VARCHAR(20) NOT NULL,
    `role_is_employee` BOOL DEFAULT(0) NOT NULL
)engine=InnoDB;

CREATE TABLE `t_feature`(
	`feature_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `feature_name` VARCHAR(30) NOT NULL,
    `feature_desc` VARCHAR(200)
)engine=InnoDB;

CREATE TABLE `t_addresses`(
	`addr_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `addr_flat_number` VARCHAR(20),
    `addr_door_code` VARCHAR(10),
	`addr_special_note` VARCHAR(100),
    `addr_street_number` SMALLINT,
    `addr_street_name` VARCHAR(50) NOT NULL,
    `addr_building_name` VARCHAR(20),
    `street_type` VARCHAR(10),
    `city_id` INT
)engine=InnoDB;


CREATE TABLE `t_users`(
	`user_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_lastname` VARCHAR(50) NOT NULL,
    `user_firstname` VARCHAR(50) NOT NULL,
    `user_phone` CHAR(10) NOT NULL,
    `user_email` VARCHAR(50) NOT NULL,
    `user_birth` DATE NOT NULL,
    `user_password` CHAR(60) NOT NULL,
    `user_register_date` DATE NOT NULL,
    `user_unregister_date` DATE
)engine=InnoDB;

CREATE TABLE `t_use` (
	`role_id` int,
    `fearuer_id` int
)engine=InnoDB;

ALTER TABLE `t_addresses`
ADD CONSTRAINT `fk_street` FOREIGN KEY (`street_type`) REFERENCES `t_street_types`(`street_type`),
ADD CONSTRAINT `fk_city`  FOREIGN KEY (`city_id`) REFERENCES `t_cities`(`city_id`); 

