/*
==========================================================
Project     : CareerCompass
Version     : 1.0
Developer   : Sahil

Description:
CareerCompass is a cloud-based student placement
analytics platform that helps students monitor,
analyze, and improve placement readiness.

Tech Stack:
- MySQL
- AWS RDS
- Power BI
- GitHub

==========================================================
*/

/*=========================================================
SECTION 1 : DATABASE CREATION
=========================================================*/

DROP DATABASE IF EXISTS career_compass;

CREATE DATABASE career_compass;

USE career_compass;

/*=========================================================
SECTION 2 : TABLE CREATION
=========================================================*/

CREATE TABLE students (
Student_id INT AUTO_INCREMENT PRIMARY KEY,
Student_name VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE,
Branch VARCHAR(50) NOT NULL,
CGPA DECIMAL(4,2) NOT NULL,
CHECK(CGPA BETWEEN 0 AND 10),
Graduation_Year YEAR NOT NULL,
Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE leetcode_progress(
progress_id INT AUTO_INCREMENT PRIMARY KEY,
Student_id INT NOT NULL UNIQUE,
FOREIGN KEY (Student_id) 
REFERENCES students(Student_id),
Easy_solved INT DEFAULT 0,
Medium_solved INT DEFAULT 0,
Hard_solved INT DEFAULT 0,
Contest_rating INT DEFAULT 0,
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE sql_progress(
Progress_id INT AUTO_INCREMENT PRIMARY KEY ,
Student_id INT NOT NULL UNIQUE,
FOREIGN KEY (Student_id)	
REFERENCES students(Student_id),
Topics_completed INT DEFAULT 0,
Practice_questions INT DEFAULT 0,
Assessment_score INT DEFAULT 0,
CHECK(Assessment_score BETWEEN 0 AND 100),
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE projects(
Project_id INT AUTO_INCREMENT PRIMARY KEY,
Student_id INT NOT NULL,
FOREIGN KEY (Student_id)
REFERENCES students(Student_id),
Project_name VARCHAR(500) NOT NULL,
Technology VARCHAR(200) NOT NULL,
Status VARCHAR(50) NOT NULL,
Github_project_link VARCHAR(500) UNIQUE,
Completion_percentage INT DEFAULT 0,
CHECK (Completion_percentage BETWEEN 0 AND 100),
Project_Score DECIMAL(5,2) DEFAULT 0,
CHECK (Project_Score BETWEEN 0 AND 100),
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE github_activity(
Activity_id INT AUTO_INCREMENT PRIMARY KEY,
Student_id INT NOT NULL,
FOREIGN KEY (Student_id)
REFERENCES students(Student_id),
Repository_name VARCHAR(500) NOT NULL,
Primary_language VARCHAR(50) NOT NULL,
Total_commits INT DEFAULT 0,
CHECK (Total_commits >= 0),
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE mock_tests(
Mock_id INT AUTO_INCREMENT PRIMARY KEY,
Student_id INT NOT NULL,
FOREIGN KEY (Student_id)
REFERENCES students(Student_id),
Test_name VARCHAR(200) NOT NULL,
Test_date DATE,
Score INT DEFAULT 0,
CHECK (Score BETWEEN 0 AND 100),
Difficulty VARCHAR(50) NOT NULL,
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE company_applications(
Application_id INT AUTO_INCREMENT PRIMARY KEY,
Student_id INT NOT NULL,
FOREIGN KEY (Student_id)
REFERENCES students(Student_id),
Company_name VARCHAR(100) NOT NULL,
Application_date DATE,
Role VARCHAR(150) NOT NULL,
Application_status VARCHAR(50) NOT NULL,
Package_lpa DECIMAL(5,2),
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE placement_readiness(
Readiness_id INT AUTO_INCREMENT PRIMARY KEY,
Student_id INT NOT NULL UNIQUE,
FOREIGN KEY (Student_id)
REFERENCES students(Student_id),
Leetcode_score INT DEFAULT 0,
SQL_score INT DEFAULT 0,
Project_score INT DEFAULT 0,
Github_score INT DEFAULT 0,
Mock_test_score INT DEFAULT 0,
Overall_score INT DEFAULT 0,
CHECK (Leetcode_score BETWEEN 0 AND 100),
CHECK (SQL_score BETWEEN 0 AND 100),
CHECK (Project_score BETWEEN 0 AND 100),
CHECK (Github_score BETWEEN 0 AND 100),
CHECK (Mock_test_score BETWEEN 0 AND 100),
CHECK (Overall_score BETWEEN 0 AND 100),
Placement_status VARCHAR(100) NOT NULL,
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP);







