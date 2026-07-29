#Queries 

USE fittrack360;

SELECT * FROM users;

SELECT full_name, email, gender FROM users;

SELECT * FROM users WHERE gender = 'Female';

SELECT full_name, email FROM users WHERE is_active = TRUE;

SELECT DISTINCT gender FROM users;

SELECT full_name, dob FROM users ORDER BY dob ASC;

SELECT plan_name, price FROM subscription_plans ORDER BY price DESC;

SELECT * FROM users LIMIT 3;

SELECT full_name, email FROM users WHERE full_name LIKE 'R%';

SELECT plan_name, price FROM subscription_plans WHERE price BETWEEN 400 AND 1500;

SELECT plan_name, plan_type, price FROM subscription_plans WHERE plan_type IN ('FREE', 'PAID');

SELECT full_name, email FROM users WHERE gender NOT IN ('Female');

SELECT full_name, guardian_user_id FROM users WHERE guardian_user_id IS NULL;

SELECT full_name, guardian_user_id FROM users WHERE guardian_user_id IS NOT NULL;

#medium 

SELECT COUNT(*) AS total_users FROM users;

SELECT COUNT(*) AS active_users FROM users WHERE is_active = TRUE;

SELECT
    MIN(price) AS cheapest_plan,
    MAX(price) AS costliest_plan,
    AVG(price) AS average_price
FROM subscription_plans;

SELECT gender, COUNT(*) AS total_users FROM users GROUP BY gender;

SELECT plan_type, COUNT(*) AS total_plans FROM subscription_plans GROUP BY plan_type;

SELECT plan_type, SUM(price) AS total_plan_price FROM subscription_plans GROUP BY plan_type;

SELECT plan_type, COUNT(*) AS total_plans FROM subscription_plans GROUP BY plan_type HAVING total_plans > 1;

#high

SELECT plan_name, price FROM subscription_plans WHERE price > (SELECT AVG(price) FROM subscription_plans);

#Subquery: users older than average age
SELECT
    full_name,
    dob,
    TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM users
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) > (
    SELECT AVG(TIMESTAMPDIFF(YEAR, dob, CURDATE()))
    FROM users
);

#Find duplicate values
SELECT email, COUNT(*) AS total_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

SELECT exercise_name, difficulty, duration_minutes FROM exercises WHERE is_premium = FALSE;

#exercises that burn more than average calories 
SELECT exercise_name, calories_burned FROM exercises WHERE calories_burned > ( SELECT AVG(calories_burned) FROM exercises );

#rank exercises by calories 
SELECT exercise_name, calories_burned, RANK() OVER (ORDER BY calories_burned DESC) AS calorie_rank FROM exercises;

#Latest body measurements
SELECT *
FROM body_measurements
ORDER BY recorded_date DESC;

#Average weight
SELECT AVG(weight_kg) AS average_weight
FROM body_measurements;

#Water intake per user per day
SELECT
    user_id,
    log_date,
    SUM(intake_ml) AS total_water_ml
FROM water_logs
GROUP BY user_id, log_date;

#Users who drank more than 1500 ml
SELECT
    user_id,
    log_date,
    SUM(intake_ml) AS total_water_ml
FROM water_logs
GROUP BY user_id, log_date
HAVING total_water_ml > 1500;

#Users with their roles
SELECT
    u.user_id,
    u.full_name,
    u.email,
    r.role_name
FROM users u
INNER JOIN roles r
ON u.role_id = r.role_id;