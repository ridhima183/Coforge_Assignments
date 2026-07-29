USE fittrack360;

/*
subscription_plans — Purpose
This table stores the available subscription plans in the fitness app.

Example:
Free Plan
Monthly Premium
Quarterly Premium
Yearly Premium

This table stores the plans users can choose.
Example: Free users get basic access, while paid users get premium workouts and features.

*/

CREATE TABLE subscription_plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration_days INT NOT NULL,
    plan_type ENUM('FREE', 'PAID') NOT NULL,
    description TEXT
);

/*

user_subscriptions — Purpose
This table stores which user subscribed to which plan.

It tracks:
User
Subscription plan
Start date
End date
Status

This table tracks user subscription history.
A user can have many subscription records over time.
Example: Riya can first use Free Plan, then upgrade to Monthly Premium.

*/

CREATE TABLE user_subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('ACTIVE', 'EXPIRED', 'CANCELLED') DEFAULT 'ACTIVE',

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);


INSERT INTO subscription_plans
(plan_name, price, duration_days, plan_type, description)
VALUES
('Free Plan', 0.00, 30, 'FREE', 'Basic workouts and health tracking'),
('Monthly Premium', 499.00, 30, 'PAID', 'Access to premium yoga and workout plans'),
('Quarterly Premium', 1299.00, 90, 'PAID', 'Premium access for 3 months'),
('Yearly Premium', 3999.00, 365, 'PAID', 'Full premium access for one year');

INSERT INTO user_subscriptions
(user_id, plan_id, start_date, end_date, status)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'riya.sharma@fittrack.com'),
    (SELECT plan_id FROM subscription_plans WHERE plan_name = 'Monthly Premium'),
    '2026-07-01',
    '2026-07-30',
    'ACTIVE'
);

INSERT INTO user_subscriptions
(user_id, plan_id, start_date, end_date, status)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'mohan.rao@fittrack.com'),
    (SELECT plan_id FROM subscription_plans WHERE plan_name = 'Free Plan'),
    '2026-07-01',
    '2026-07-30',
    'ACTIVE'
);

INSERT INTO user_subscriptions
(user_id, plan_id, start_date, end_date, status)
VALUES
(
    (SELECT user_id FROM users WHERE email = 'aarav.kid@fittrack.com'),
    (SELECT plan_id FROM subscription_plans WHERE plan_name = 'Free Plan'),
    '2026-07-01',
    '2026-07-30',
    'ACTIVE'
);

SHOW TABLES;

DESC subscription_plans;

DESC user_subscriptions;

SELECT * FROM user_subscriptions;

SELECT * FROM subscription_plans;

SELECT plan_name,price FROM subscription_plans ;

SELECT plan_name,price FROM subscription_plans WHERE plan_type='PAID';