ALTER TABLE `appointment` CHANGE `amount` `amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `doctor` CHANGE `commission_amount` `commission_amount` DECIMAL(11,2) NULL DEFAULT NULL;
ALTER TABLE `doctor_subscription` CHANGE `amount` `amount` DECIMAL(11,2) NULL DEFAULT NULL;
ALTER TABLE `lab_settle` CHANGE `admin_amount` `admin_amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `lab_settle` CHANGE `lab_amount` `lab_amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `pharamacy_settle` CHANGE `admin_amount` `admin_amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `pharamacy_settle` CHANGE `pharamacy_amount` `pharamacy_amount` DECIMAL(11,2) NULL DEFAULT NULL;
ALTER TABLE `pharmacy_settle` CHANGE `admin_amount` `admin_amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `pharmacy_settle` CHANGE `pharmacy_amount` `pharmacy_amount` DECIMAL(11,2) NULL DEFAULT NULL;
ALTER TABLE `purchase_medicine` CHANGE `amount` `amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `report` CHANGE `amount` `amount` DECIMAL(20,2) NOT NULL;
ALTER TABLE `settle` CHANGE `doctor_amount` `doctor_amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `settle` CHANGE `admin_amount` `admin_amount` DECIMAL(11,2) NOT NULL;
ALTER TABLE `pharmacy` CHANGE `commission_amount` `commission_amount` DECIMAL(11,2) NOT NULL;
