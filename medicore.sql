



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'users'
-- 
-- ---

DROP TABLE IF EXISTS `users`;
		
CREATE TABLE `users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `role_id` BIGINT(20) NOT NULL,
  `address_id` BIGINT(20) NOT NULL,
  `organization_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'trials'
-- 
-- ---

DROP TABLE IF EXISTS `trials`;
		
CREATE TABLE `trials` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT(2048) NOT NULL,
  `summary` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'addresses'
-- 
-- ---

DROP TABLE IF EXISTS `addresses`;
		
CREATE TABLE `addresses` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'roles'
-- 
-- ---

DROP TABLE IF EXISTS `roles`;
		
CREATE TABLE `roles` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'organizations'
-- 
-- ---

DROP TABLE IF EXISTS `organizations`;
		
CREATE TABLE `organizations` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `address_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'trials_users'
-- 
-- ---

DROP TABLE IF EXISTS `trials_users`;
		
CREATE TABLE `trials_users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) NOT NULL,
  `trial_id` BIGINT(20) NOT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'questions'
-- 
-- ---

DROP TABLE IF EXISTS `questions`;
		
CREATE TABLE `questions` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `question_type_id` BIGINT(20) NOT NULL,
  `question` VARCHAR(255) NOT NULL COMMENT 'Platzhalter erlauben %daytime%',
  `interval` BIGINT NOT NULL COMMENT 'Intervall in Stunden',
  `scale_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'trials_questions'
-- 
-- ---

DROP TABLE IF EXISTS `trials_questions`;
		
CREATE TABLE `trials_questions` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `question_id` BIGINT(20) NOT NULL,
  `trial_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'answers'
-- 
-- ---

DROP TABLE IF EXISTS `answers`;
		
CREATE TABLE `answers` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `question_id` BIGINT(20) NOT NULL,
  `user_id` BIGINT(20) NOT NULL,
  `due_date` DATE NOT NULL,
  `answered_at` DATE NOT NULL,
  `value` SMALLINT NULL DEFAULT NULL,
  `value_text` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'question_types'
-- 
-- ---

DROP TABLE IF EXISTS `question_types`;
		
CREATE TABLE `question_types` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL COMMENT 'Freitext/LikertScale/MultipleChoice',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'scales'
-- 
-- ---

DROP TABLE IF EXISTS `scales`;
		
CREATE TABLE `scales` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `scale_start` SMALLINT NOT NULL DEFAULT 1,
  `scale_end` SMALLINT NULL DEFAULT NULL,
  `value_no_answer` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'scalevalues'
-- 
-- ---

DROP TABLE IF EXISTS `scalevalues`;
		
CREATE TABLE `scalevalues` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `value` SMALLINT NOT NULL,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'scales_scalevalues'
-- 
-- ---

DROP TABLE IF EXISTS `scales_scalevalues`;
		
CREATE TABLE `scales_scalevalues` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `scalevalues_id` BIGINT(20) NOT NULL,
  `scale_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `users` ADD FOREIGN KEY (role_id) REFERENCES `roles` (`id`);
ALTER TABLE `users` ADD FOREIGN KEY (address_id) REFERENCES `addresses` (`id`);
ALTER TABLE `users` ADD FOREIGN KEY (organization_id) REFERENCES `organizations` (`id`);
ALTER TABLE `organizations` ADD FOREIGN KEY (address_id) REFERENCES `addresses` (`id`);
ALTER TABLE `trials_users` ADD FOREIGN KEY (user_id) REFERENCES `users` (`id`);
ALTER TABLE `trials_users` ADD FOREIGN KEY (trial_id) REFERENCES `trials` (`id`);
ALTER TABLE `questions` ADD FOREIGN KEY (question_type_id) REFERENCES `question_types` (`id`);
ALTER TABLE `questions` ADD FOREIGN KEY (scale_id) REFERENCES `scales` (`id`);
ALTER TABLE `trials_questions` ADD FOREIGN KEY (question_id) REFERENCES `questions` (`id`);
ALTER TABLE `trials_questions` ADD FOREIGN KEY (trial_id) REFERENCES `trials` (`id`);
ALTER TABLE `answers` ADD FOREIGN KEY (question_id) REFERENCES `questions` (`id`);
ALTER TABLE `answers` ADD FOREIGN KEY (user_id) REFERENCES `users` (`id`);
ALTER TABLE `scales_scalevalues` ADD FOREIGN KEY (scalevalues_id) REFERENCES `scalevalues` (`id`);
ALTER TABLE `scales_scalevalues` ADD FOREIGN KEY (scale_id) REFERENCES `scales` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `trials` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `addresses` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `roles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `organizations` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `trials_users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `trials_questions` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `answers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `question_types` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scales` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scalevalues` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `scales_scalevalues` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `users` (`id`,`first_name`,`last_name`,`role_id`,`address_id`,`organization_id`) VALUES
-- ('','','','','','');
-- INSERT INTO `trials` (`id`,`name`,`description`,`summary`) VALUES
-- ('','','','');
-- INSERT INTO `addresses` (`id`) VALUES
-- ('');
-- INSERT INTO `roles` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `organizations` (`id`,`address_id`) VALUES
-- ('','');
-- INSERT INTO `trials_users` (`id`,`user_id`,`trial_id`,`start_date`,`end_date`) VALUES
-- ('','','','','');
-- INSERT INTO `questions` (`id`,`question_type_id`,`question`,`interval`,`scale_id`) VALUES
-- ('','','','','');
-- INSERT INTO `trials_questions` (`id`,`question_id`,`trial_id`) VALUES
-- ('','','');
-- INSERT INTO `answers` (`id`,`question_id`,`user_id`,`due_date`,`answered_at`,`value`,`value_text`) VALUES
-- ('','','','','','','');
-- INSERT INTO `question_types` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `scales` (`id`,`scale_start`,`scale_end`,`value_no_answer`) VALUES
-- ('','','','');
-- INSERT INTO `scalevalues` (`id`,`value`,`description`) VALUES
-- ('','','');
-- INSERT INTO `scales_scalevalues` (`id`,`scalevalues_id`,`scale_id`) VALUES
-- ('','','');


