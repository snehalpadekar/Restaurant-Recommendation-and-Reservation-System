use r3_db_system;

CREATE TABLE restaurant (
restaurant_id INT,
restaurant_name VARCHAR(100),
restaurant_rating FLOAT,
restaurant_contact_no VARCHAR(100),
opening_hrs time,
closing_hrs time,
budget_for_2 INT,
restaurant_address VARCHAR(100),
city VARCHAR(30),
state VARCHAR(20),
zipcode INT,
no_of_tables Int,
PRIMARY KEY (restaurant_id)
);

CREATE TABLE restaurant_type(
restaurant_type_id INT,
restaurant_type VARCHAR(100),
PRIMARY KEY (restaurant_type_id)
);

CREATE TABLE restaurant_type_mapping(
restaurant_type_id INT,
restaurant_id INT,
FOREIGN KEY (restaurant_type_id) REFERENCES restaurant_type(restaurant_type_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE user(
user_id INT,
user_first_name VARCHAR(100),
user_last_name VARCHAR(100),
user_address VARCHAR(500),
city VARCHAR(30),
county VARCHAR(20),
state VARCHAR(20),
zipcode INT,
user_contact_no VARCHAR(20),
PRIMARY KEY (user_id)
);

CREATE TABLE account (
account_id INT,
user_name VARCHAR(100),
password VARCHAR(100),
user_id INT,
PRIMARY KEY (account_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE menu(
menu_id INT,
menu_name VARCHAR(100),
PRIMARY KEY (menu_id)
);

CREATE TABLE menu_restaurant_mapping(
menu_id INT,
restaurant_id INT,
FOREIGN KEY (menu_id) REFERENCES menu(menu_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE drinks(
drink_id INT,
drink_name VARCHAR(100),
drink_type VARCHAR(100),
drink_price float,
menu_id INT,
restaurant_id INT,
PRIMARY KEY (drink_id),
FOREIGN KEY (menu_id) REFERENCES  menu(menu_id),
FOREIGN KEY (restaurant_id) REFERENCES  restaurant(restaurant_id)
);

CREATE TABLE dish_categories(
category_id INT,
category_name VARCHAR(100),
PRIMARY KEY (category_id)
);

CREATE TABLE dish_category_mapping(
category_id INT,
menu_id INT,
restaurant_id INT,
FOREIGN KEY (category_id) REFERENCES dish_categories(category_id),
FOREIGN KEY (menu_id) REFERENCES  menu(menu_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE restaurant_dishes(
dish_id INT,
dish_name VARCHAR(500),
dish_price FLOAT,
-- cuisines_id INT,
category_id INT,
menu_id INT,
restaurant_id INT,
PRIMARY KEY (dish_id),
FOREIGN KEY (category_id) REFERENCES dish_categories(category_id),
FOREIGN KEY (menu_id) REFERENCES  menu(menu_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE restaurant_reservation(
reservation_id INT,
no_of_people INT,
reservation_time time,
reservation_date date,
restaurant_id int,
user_id INT,
PRIMARY KEY (reservation_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE restaurant_review(
review_id INT,
review_comment VARCHAR(1000),
liked_or_not INT,
user_rating FLOAT,
date_posted date,
restaurant_id INT,
user_id INT,
PRIMARY KEY (review_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE restaurant_cancellation(
cancellation_id INT,
cancellation_reason Varchar(500),
restaurant_id INT,
user_id INT,
PRIMARY KEY (cancellation_id),
FOREIGN KEY (restaurant_id) REFERENCES restaurant (restaurant_id),
FOREIGN KEY (user_id) REFERENCES user(user_id)
);
