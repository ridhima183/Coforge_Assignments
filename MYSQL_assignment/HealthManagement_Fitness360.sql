USE fittrack360;

# body_measurements — Purpose
/*
   Table Name: body_measurements
   Purpose: Stores user height and weight history.
   One user can have many body measurement records.
   
One user can have many body measurement records.
Example: Riya can record her weight on July 1, July 5, July 10, etc.
*/

CREATE TABLE body_measurements (
    measurement_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    height_cm DECIMAL(5,2),
    weight_kg DECIMAL(5,2),
    recorded_date DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO body_measurements
(user_id, height_cm, weight_kg, recorded_date)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    165.00,
    62.00,
    '2026-07-01'
),
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    170.00,
    75.00,
    '2026-07-01'
),
(
    (SELECT user_id FROM users WHERE email = 'aarav.kid@fittrack.com'),
    145.00,
    38.50,
    '2026-07-01'
);

/*food_items — Purpose

This table stores food details and nutrition information.
It acts like a food database for calculating calories.

This table does not belong to one user.
It stores common food items like Oats, Banana, Rice, Dal, Milk, etc.
Many users can select food from this table.
*/

CREATE TABLE food_items (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(100) NOT NULL,
    calories_per_serving INT NOT NULL,
    protein_g DECIMAL(5,2),
    carbs_g DECIMAL(5,2),
    fat_g DECIMAL(5,2)
);


INSERT INTO food_items
(food_name, calories_per_serving, protein_g, carbs_g, fat_g)
VALUES
('Oats', 150, 5.00, 27.00, 3.00),
('Banana', 100, 1.00, 27.00, 0.30),
('Rice', 200, 4.00, 45.00, 1.00),
('Dal', 180, 9.00, 25.00, 4.00),
('Eggs', 140, 12.00, 1.00, 10.00),
('Milk', 120, 6.00, 12.00, 5.00);

/*meal_logs — Purpose

This table stores what food a user ate and on which date.
It helps calculate the user’s daily calorie intake.

This table connects users and food_items.
Example: Riya ate 1 serving of Oats for breakfast.
Calories can be calculated as:
calories_per_serving × servings

*/


CREATE TABLE meal_logs (
    meal_log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    food_id INT NOT NULL,
    meal_type ENUM('BREAKFAST', 'LUNCH', 'DINNER', 'SNACK') NOT NULL,
    servings DECIMAL(4,2) DEFAULT 1,
    log_date DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (food_id) REFERENCES food_items(food_id)
);


INSERT INTO meal_logs
(user_id, food_id, meal_type, servings, log_date)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT food_id FROM food_items WHERE food_name = 'Oats'),
    'BREAKFAST',
    1,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT food_id FROM food_items WHERE food_name = 'Banana'),
    'SNACK',
    1,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT food_id FROM food_items WHERE food_name = 'Rice'),
    'LUNCH',
    1.5,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'aarav.kid@fittrack.com'),
    (SELECT food_id FROM food_items WHERE food_name = 'Milk'),
    'BREAKFAST',
    1,
    '2026-07-05'
);

/*water_logs — Purpose

This table stores the user’s daily water intake records.
A user can add multiple water entries in a single day.

One user can have many water logs.
Example:
Morning: 500 ml
Afternoon: 750 ml
Evening: 500 ml
Total water = 1750 ml

*/

CREATE TABLE water_logs (
    water_log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    intake_ml INT NOT NULL,
    log_date DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO water_logs
(user_id, intake_ml, log_date)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    500,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    750,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    500,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    1000,
    '2026-07-05'
),
(
    (SELECT user_id FROM users WHERE email = 'aarav.kid@fittrack.com'),
    600,
    '2026-07-05'
);

/*medications — Purpose

This table stores the medicine details assigned to a user.
It is useful for senior citizens or users who need regular medicine reminders.

One user can have many medicines.
Example: Mohan Rao can have BP Tablet and Vitamin D assigned to him.
*/

CREATE TABLE medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    medicine_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(100),
    frequency VARCHAR(100),
    start_date DATE,
    end_date DATE,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO medications
(user_id, medicine_name, dosage, frequency, start_date, end_date)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    'Blood Pressure Tablet',
    '1 tablet',
    'Daily Morning',
    '2026-07-01',
    '2026-12-31'
),
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    'Vitamin D',
    '1 tablet',
    'Once a week',
    '2026-07-01',
    '2026-09-30'
);

/*
medication_logs — Purpose

This table stores whether a medicine was taken or missed on a particular date.
It helps track medicine history.

This table does not directly store user_id.
It connects to the medications table.
From medication_id, we can find the user.
*/


CREATE TABLE medication_logs (
    medication_log_id INT PRIMARY KEY AUTO_INCREMENT,
    medication_id INT NOT NULL,
    taken_date DATE NOT NULL,
    status ENUM('TAKEN', 'MISSED') DEFAULT 'MISSED',

    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

INSERT INTO medication_logs
(medication_id, taken_date, status)
VALUES
(
    (SELECT medication_id FROM medications 
     WHERE medicine_name = 'Blood Pressure Tablet'
     AND user_id = (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com')),
    '2026-07-05',
    'TAKEN'
),
(
    (SELECT medication_id FROM medications 
     WHERE medicine_name = 'Vitamin D'
     AND user_id = (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com')),
    '2026-07-05',
    'MISSED'
);