USE fittrack360;

/*
exercise_categories — Purpose
This table stores the main types of exercises available in the application.

Example:
Yoga, Cardio, Strength, Meditation, Balance
This table groups exercises into categories.
Example: Surya Namaskar belongs to Yoga, Walking Cardio belongs to Cardio.
*/


CREATE TABLE exercise_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO exercise_categories (category_name)
VALUES
('Yoga'),
('Cardio'),
('Strength'),
('Meditation'),
('Balance');

/*
exercises — Purpose
This table stores the actual exercises available in the fitness app.

Example:
Surya Namaskar, Chair Yoga, Walking Cardio, Bodyweight Squats

This table stores exercise details.
It connects with exercise_categories and age_groups.
Example: Chair Yoga is an EASY Yoga exercise suitable for Seniors.
*/


CREATE TABLE exercises (
    exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    exercise_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    difficulty ENUM('EASY', 'MEDIUM', 'HARD') NOT NULL,
    suitable_for_age_group_id INT NOT NULL,
    duration_minutes INT NOT NULL,
    calories_burned INT,
    is_premium BOOLEAN DEFAULT FALSE,
    instructions TEXT,

    FOREIGN KEY (category_id) REFERENCES exercise_categories(category_id),
    FOREIGN KEY (suitable_for_age_group_id) REFERENCES age_groups(age_group_id)
);

INSERT INTO exercises
(exercise_name, category_id, difficulty, suitable_for_age_group_id, duration_minutes, calories_burned, is_premium, instructions)
VALUES
(
    'Basic Yoga Stretch',
    (SELECT category_id FROM exercise_categories WHERE category_name = 'Yoga'),
    'EASY',
    (SELECT age_group_id FROM age_groups WHERE group_name = 'CHILD'),
    15,
    50,
    FALSE,
    'Simple stretching yoga for children.'
),
(
    'Surya Namaskar',
    (SELECT category_id FROM exercise_categories WHERE category_name = 'Yoga'),
    'MEDIUM',
    (SELECT age_group_id FROM age_groups WHERE group_name = 'YOUNGSTER'),
    20,
    120,
    TRUE,
    'Perform 12 yoga poses in sequence.'
),
(
    'Chair Yoga',
    (SELECT category_id FROM exercise_categories WHERE category_name = 'Yoga'),
    'EASY',
    (SELECT age_group_id FROM age_groups WHERE group_name = 'SENIOR'),
    15,
    40,
    FALSE,
    'Low impact yoga using chair support.'
),
(
    'Walking Cardio',
    (SELECT category_id FROM exercise_categories WHERE category_name = 'Cardio'),
    'EASY',
    (SELECT age_group_id FROM age_groups WHERE group_name = 'SENIOR'),
    20,
    80,
    FALSE,
    'Light walking cardio for seniors.'
),
(
    'Bodyweight Squats',
    (SELECT category_id FROM exercise_categories WHERE category_name = 'Strength'),
    'MEDIUM',
    (SELECT age_group_id FROM age_groups WHERE group_name = 'YOUNGSTER'),
    15,
    100,
    TRUE,
    'Squats without weights.'
),
(
    'Breathing Meditation',
    (SELECT category_id FROM exercise_categories WHERE category_name = 'Meditation'),
    'EASY',
    (SELECT age_group_id FROM age_groups WHERE group_name = 'SENIOR'),
    10,
    20,
    FALSE,
    'Simple breathing and relaxation exercise.'
);

/*
workout_plans — Purpose
This table stores fitness plans created by trainers.

Example:
Kids Morning Fitness
Youngster Fat Loss Plan
Senior Mobility Plan

Free users can access free plans, and paid users can access premium plans also.
*/


CREATE TABLE workout_plans (
    workout_plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    trainer_id INT NOT NULL,
    age_group_id INT NOT NULL,
    difficulty ENUM('EASY', 'MEDIUM', 'HARD') NOT NULL,
    is_premium BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (trainer_id) REFERENCES users(user_id),
    FOREIGN KEY (age_group_id) REFERENCES age_groups(age_group_id)
);

INSERT INTO workout_plans
(plan_name, trainer_id, age_group_id, difficulty, is_premium)
VALUES
(
    'Kids Morning Fitness',
    (SELECT user_id FROM users WHERE email = 'rahul.trainer@fittrack.com'),
    (SELECT age_group_id FROM age_groups WHERE group_name = 'CHILD'),
    'EASY',
    FALSE
),
(
    'Youngster Fat Loss Plan',
    (SELECT user_id FROM users WHERE email = 'rahul.trainer@fittrack.com'),
    (SELECT age_group_id FROM age_groups WHERE group_name = 'YOUNGSTER'),
    'MEDIUM',
    TRUE
),
(
    'Senior Mobility Plan',
    (SELECT user_id FROM users WHERE email = 'rahul.trainer@fittrack.com'),
    (SELECT age_group_id FROM age_groups WHERE group_name = 'SENIOR'),
    'EASY',
    FALSE
);


/*
plan_exercises — Purpose
This table stores which exercises are added inside a workout plan.

It is a junction table because:

One workout plan can have many exercises.
One exercise can be used in many workout plans.

This table decides the exercise order inside a workout plan.
Example:
1. Warm-up
2. Surya Namaskar
3. Bodyweight Squats
4. Cool down

*/


CREATE TABLE plan_exercises (
    plan_exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    workout_plan_id INT NOT NULL,
    exercise_id INT NOT NULL,
    sequence_no INT NOT NULL,

    FOREIGN KEY (workout_plan_id) REFERENCES workout_plans(workout_plan_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);

#sequence no - order in which the exercises are to be executed 

INSERT INTO plan_exercises
(workout_plan_id, exercise_id, sequence_no)
VALUES
(
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Kids Morning Fitness'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Basic Yoga Stretch'),
    1
),
(
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Youngster Fat Loss Plan'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Surya Namaskar'),
    1
),
(
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Youngster Fat Loss Plan'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Bodyweight Squats'),
    2
),
(
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Senior Mobility Plan'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Chair Yoga'),
    1
),
(
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Senior Mobility Plan'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Walking Cardio'),
    2
),
(
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Senior Mobility Plan'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Breathing Meditation'),
    3
);

/*
user_plan_enrollments — Purpose
This table stores which user enrolled in which workout plan.

Example:

Riya enrolled in Youngster Fat Loss Plan.
Mohan enrolled in Senior Mobility Plan.
*/

CREATE TABLE user_plan_enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    workout_plan_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    status ENUM('ACTIVE', 'COMPLETED', 'DROPPED') DEFAULT 'ACTIVE',

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (workout_plan_id) REFERENCES workout_plans(workout_plan_id)
);

INSERT INTO user_plan_enrollments
(user_id, workout_plan_id, status)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'aarav.kid@fittrack.com'),
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Kids Morning Fitness'),
    'ACTIVE'
),
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Youngster Fat Loss Plan'),
    'ACTIVE'
),
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    (SELECT workout_plan_id FROM workout_plans WHERE plan_name = 'Senior Mobility Plan'),
    'ACTIVE'
);

/*
workout_sessions — Purpose
This table stores completed workout/exercise logs of users.

Example:
Riya completed Surya Namaskar on 2026-07-05 for 20 minutes.

This table tracks actual completed workouts.
Workout plans show what the user should do.
Workout sessions show what the user actually completed.

*/


CREATE TABLE workout_sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    exercise_id INT NOT NULL,
    session_date DATE NOT NULL,
    duration_minutes INT NOT NULL,
    calories_burned INT,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id)
);

INSERT INTO workout_sessions
(user_id, exercise_id, session_date, duration_minutes, calories_burned)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Surya Namaskar'),
    '2026-07-05',
    20,
    120
),
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Bodyweight Squats'),
    '2026-07-05',
    15,
    100
),
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Chair Yoga'),
    '2026-07-05',
    15,
    40
),
(
    (SELECT user_id FROM users WHERE email = 'aarav.kid@fittrack.com'),
    (SELECT exercise_id FROM exercises WHERE exercise_name = 'Basic Yoga Stretch'),
    '2026-07-05',
    15,
    50
);


