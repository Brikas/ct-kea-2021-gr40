-- Define the tables for the database.
-- Goes first.

-- FIx indexes
-- make comments

SET FOREIGN_KEY_CHECKS = 0;
drop table if exists User;
drop table if exists Category;
drop table if exists Payment;
drop table if exists Curriculum;
drop table if exists Course;
drop table if exists Curriculum_Course;
drop table if exists Enrollment;
drop table if exists Quiz;
drop table if exists Question;
drop table if exists Answer;

drop table if exists User_answer;
drop table if exists Reason;
SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE `User` (
  `User_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`User_ID`));

CREATE TABLE `Reason` (
  `Reason_ID` INT NOT NULL AUTO_INCREMENT,
  `Reason` VARCHAR(1000) NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`Reason_ID`),
  INDEX `reason_user_idx` (`User_ID` ASC),
  CONSTRAINT `reason_user`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`User_ID`));
    
CREATE TABLE `Category` (
  `Category_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Category_ID`));

CREATE TABLE `Payment` (
  `Payment_ID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `Amount` DECIMAL(5,2) NOT NULL,
  `User_ID` INT NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  INDEX `payment_user_idx` (`User_ID` ASC),
  CONSTRAINT `payment_user`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`User_ID`));
    
CREATE TABLE `Curriculum` (
  `Curriculum_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Curriculum_ID`));
  
  CREATE TABLE `Course` (
  `Course_ID` INT NOT NULL,
  `Length` TIME NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Difficulty` INT NOT NULL,
  `Category_ID` INT NOT NULL,
  PRIMARY KEY (`Course_ID`),
  INDEX `course_category_idx` (`Category_ID` ASC),
  CONSTRAINT `course_category`
    FOREIGN KEY (`Category_ID`)
    REFERENCES `Category` (`Category_ID`));

CREATE TABLE `Curriculum_Course` (
  `Curriculum_ID` INT NOT NULL,
  `Course_ID` INT NOT NULL,
  PRIMARY KEY (`Curriculum_ID`, `Course_ID`),
  INDEX `course_id_idx` (`Course_ID` ASC),
  CONSTRAINT `curriculum`
    FOREIGN KEY (`Curriculum_ID`)
    REFERENCES `Curriculum` (`Curriculum_ID`),
  CONSTRAINT `curriculum_course`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `Course` (`Course_ID`));

CREATE TABLE `Enrollment` (
  `Course_ID` INT NOT NULL,
  `User_ID` INT NOT NULL,
  `Progress` INT NOT NULL,
  PRIMARY KEY (`Course_ID`, `User_ID`),
  INDEX `user_id_idx` (`User_ID` ASC),
  CONSTRAINT `enrollment_user`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`User_ID`),
  CONSTRAINT `enrollment_course`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `Course` (`Course_ID`));

CREATE TABLE `Quiz` (
  `Quiz_ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Introduction` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Quiz_ID`));

CREATE TABLE `Question` (
  `Question_ID` INT NOT NULL,
  `Text` VARCHAR(255) NOT NULL,
  `Quiz_ID` INT NOT NULL,
  PRIMARY KEY (`Question_ID`),
  INDEX `question_quiz_idx` (`Quiz_ID` ASC),
  CONSTRAINT `question_quiz`
    FOREIGN KEY (`Quiz_ID`)
    REFERENCES `Quiz` (`Quiz_ID`));

CREATE TABLE `Answer` (
  `Answer_ID` INT NOT NULL,
  `Text` VARCHAR(255) NOT NULL,
  `Points` VARCHAR(45) NOT NULL,
  `Category_ID` INT NOT NULL,
  `Question_ID` INT NOT NULL,
  PRIMARY KEY (`Answer_ID`),
  INDEX `answer_category_idx` (`Category_ID` ASC),
  INDEX `answer_question_idx` (`Question_ID` ASC),
  CONSTRAINT `answer_question`
    FOREIGN KEY (`Question_ID`)
    REFERENCES `Question` (`Question_ID`),
  CONSTRAINT `answer_category`
    FOREIGN KEY (`Category_ID`)
    REFERENCES `Category` (`Category_ID`));
    
CREATE TABLE `User_answer` (
  `User_ID` INT NOT NULL,
  `Answer_ID` INT NOT NULL,
  PRIMARY KEY (`User_ID`),
  INDEX `user_answer_Answer_idx` (`Answer_ID` ASC),
  CONSTRAINT `user_answer_User`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`User_ID`),
  CONSTRAINT `user_answer_Answer`
    FOREIGN KEY (`Answer_ID`)
    REFERENCES `Answer` (`Answer_ID`));

ALTER DATABASE sql4396600 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE sql4396600.Answer CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE sql4396600.Reason CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
