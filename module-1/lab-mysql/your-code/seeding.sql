INSERT INTO `mydb`.`Cars` (`car_id`, `vin`, `manuf`, `model`, `year`, `color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `mydb`.`Cars` (`car_id`, `vin`, `manuf`, `model`, `year`, `color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `mydb`.`Cars` (`car_id`, `vin`, `manuf`, `model`, `year`, `color`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `mydb`.`Cars` (`car_id`, `vin`, `manuf`, `model`, `year`, `color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`Cars` (`car_id`, `vin`, `manuf`, `model`, `year`, `color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `mydb`.`Cars` (`car_id`, `vin`, `manuf`, `model`, `year`, `color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country	', '2019', 'Gray');

INSERT INTO `mydb`.`Costumers` (`c_id`, `cost_id`, `cost_name`, `phone`, `email`, `address`, `city`, `state_province`, `country`, `postal_code`) VALUES ('0', '10001 ', 'Pablo Picasso ', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14	', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `mydb`.`Costumers` (`c_id`, `cost_id`, `cost_name`, `phone`, `email`, `address`, `city`, `state_province`, `country`, `postal_code`) VALUES ('1', '20001 ', 'Abraham Lincoln ', '+1 305 907 7086 ', '-', '120 SW 8th St ', 'Miami', 'Florida', 'United States ', '33130');
INSERT INTO `mydb`.`Costumers` (`c_id`, `cost_id`, `cost_name`, `phone`, `email`, `address`, `city`, `state_province`, `country`, `postal_code`) VALUES ('2', '30001 ', 'Napoléon Bonaparte	', '+33 1 79 75 40 00	', '-', '40 Rue du Colisée	', 'Paris', 'Île-de-France	', 'France ', '75008');

INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('0', '00001', 'Petey Cruiser	', 'Madrid');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('1', '00002', 'Anna Sthesia	', 'Barcelona');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('2', '00003', 'Paul Molive	', 'Berlin');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('3', '00004', 'Gail Forcewind	', 'Paris');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('4', '00005', 'Paige Turner	', 'Miami');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('5', '00006', 'Bob Frapples	', 'Mexico City\n');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('6', '00007', 'Walter Melon	', 'Amsterdam');
INSERT INTO `mydb`.`Salespersons` (`sp_id`, `staff_id`, `sp_name`, `sp_store`) VALUES ('7', '00008', 'Shonda Leer	', 'São Paulo\n');

INSERT INTO `mydb`.`Invoices` (`invoice_id`, `invoice_number`, `date`, `c_id`, `sp_id`) VALUES ('0', '852399038', '2018-08-22', '1', '3');
INSERT INTO `mydb`.`Invoices` (`invoice_id`, `invoice_number`, `date`, `c_id`, `sp_id`) VALUES ('1', '731166526	', '2018-12-31', '0', '5');
INSERT INTO `mydb`.`Invoices` (`invoice_id`, `invoice_number`, `date`, `c_id`, `sp_id`) VALUES ('2', '271135104	', '2019-01-22', '2', '7');

UPDATE `mydb`.`Cars` SET `invoice_id`='1' WHERE `car_id`='1';
UPDATE `mydb`.`Cars` SET `invoice_id`='3' WHERE `car_id`='3';
UPDATE `mydb`.`Cars` SET `invoice_id`='2' WHERE `car_id`='4';