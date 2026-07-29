CREATE DATABASE fittrack360;


USE fittrack360;

/*
roles — Purpose
This table stores the type of user in the application.

Example:
Admin, Trainer, Member, Guardian

This table is used for authorization.
Example: Admin can manage the system, Trainer can create workout plans, Member can use fitness features.
*/

CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

/*
age_groups — Purpose
This table stores the age category of users.

Example:
Child, Youngster, Senior

This table helps recommend suitable exercises and workout plans based on age.
Example: Chair Yoga can be recommended for Senior users.

*/

CREATE TABLE age_groups (
    age_group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) UNIQUE NOT NULL,
    min_age INT NOT NULL,
    max_age INT NOT NULL
);

/*
users — Purpose
This table stores the main account details of users.

It connects users with:
roles
age_groups
optional guardian user

This is the main user table.
It stores login details, role information, age group information, and guardian-child relationship.
Example: Aarav Kid can be linked to Priya Guardian using guardian_user_id.

*/

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(20),
    role_id INT NOT NULL,
    age_group_id INT NOT NULL,
    guardian_user_id INT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (age_group_id) REFERENCES age_groups(age_group_id),
    FOREIGN KEY (guardian_user_id) REFERENCES users(user_id)
);

INSERT INTO roles (role_name)
VALUES
('ADMIN'),
('TRAINER'),
('MEMBER'),
('GUARDIAN');

INSERT INTO age_groups (group_name, min_age, max_age)
VALUES
('CHILD', 5, 17),
('YOUNGSTER', 18, 59),
('SENIOR', 60, 120);

INSERT INTO users 
(full_name, email, password_hash, dob, gender, role_id, age_group_id)
VALUES
('Admin User', 'admin@fittrack.com', 'hashed_admin123', '1990-01-01', 'Male', 1, 2),
('Rahul Trainer', 'rahul.trainer@fittrack.com', 'hashed_trainer123', '1988-04-10', 'Male', 2, 2),
('Priya Guardian', 'priya.guardian@fittrack.com', 'hashed_guardian123', '1985-09-18', 'Female', 4, 2),
('Riya Sharma', 'riya.sharma@fittrack.com', 'hashed_member123', '2001-03-20', 'Female', 3, 2),
('Mohan Rao', 'mohan.rao@fittrack.com', 'hashed_senior123', '1955-08-12', 'Male', 3, 3);

INSERT INTO users
(full_name, email, password_hash, dob, gender, role_id, age_group_id, guardian_user_id)
VALUES
('Aarav Kid', 'aarav.kid@fittrack.com', 'hashed_child123', '2014-06-15', 'Male', 3, 1, 3);

SHOW TABLES;

SELECT * FROM users;

DESC users;