CREATE TABLE `modeldb`.`tbl_board` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(256) NOT NULL,
  `content` TEXT NULL,
  `writer` VARCHAR(50) NOT NULL,
  `reg_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  PRIMARY KEY (`no`));