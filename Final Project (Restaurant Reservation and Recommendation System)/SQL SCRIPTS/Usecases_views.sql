-- CREATE VIEW Early_restaurant AS
-- SELECT distinct(restaurant_name), r.opening_hrs
-- FROM restaurant r INNER JOIN  restaurant_review re
-- ON r.restaurant_id=re.restaurant_id 
-- WHERE r.opening_hrs = '08:00:00' AND re.user_rating >= 4; 

-- CREATE VIEW Resto_highest_rating AS
-- SELECT r. restaurant_name, max(re.user_rating) as highest_rating
-- FROM restaurant r INNER JOIN restaurant_review re
-- ON r.restaurant_id=re.restaurant_id
-- group by r.restaurant_name;

-- CREATE VIEW Burger_restaurants AS
-- SELECT distinct(r.restaurant_name), d.dish_name
-- FROM restaurant r INNER JOIN restaurant_dishes d
-- ON r.restaurant_id=d.restaurant_id
-- WHERE r.zipcode = '2115' AND d.category_id in (select category_id from dish_categories
-- 							where category_name like '%Burger%');

-- CREATE VIEW Early_juice_resto AS 
-- SELECT r.restaurant_name,r.opening_hrs,d.drink_name
-- FROM  restaurant r INNER JOIN drinks d
-- ON  r.restaurant_id = d.restaurant_id
-- where r.opening_hrs='11:00:00' and drink_name='Organic Apple Juice Regular (6.75 oz.) ';

-- CREATE VIEW Ham_resto AS
-- SELECT r.restaurant_id, r.restaurant_name
-- FROM restaurant r INNER JOIN restaurant_dishes rd
-- ON  r.restaurant_id= rd.restaurant_id
-- WHERE rd.dish_name = 'Hamburger ';

-- CREATE VIEW Salad_resto AS
-- SELECT distinct(r.restaurant_name), d.dish_name
-- FROM restaurant r INNER JOIN restaurant_dishes d
-- ON r.restaurant_id=d.restaurant_id
-- WHERE d.category_id in (select category_id from dish_categories
-- 							where category_name like '%Salad%');


-- CREATE VIEW alcohol_resto AS
-- SELECT distinct d.drink_type, r.restaurant_name
-- FROM restaurant r INNER JOIN drinks d
-- ON r.restaurant_id = d.restaurant_id
-- where d.drink_type in ('Beer', 'Wine');

-- CREATE VIEW Pizza_resto AS
-- SELECT distinct(r.restaurant_name), d.dish_name, d.dish_price
-- FROM restaurant r INNER JOIN restaurant_dishes d
-- ON r.restaurant_id=d.restaurant_id
-- WHERE d.category_id in (select category_id from dish_categories
-- 							where category_name like '%Pizza%') and r.budget_for_2<=20;

-- CREATE VIEW Latenight_burger AS
-- SELECT r.restaurant_name,rd.dish_name, r.closing_hrs
-- FROM  restaurant_dishes rd INNER JOIN restaurant r
-- ON  rd.restaurant_id = r.restaurant_id 
-- WHERE  rd.dish_name like '%Cheeseburger%' and r.closing_hrs<='22:00:00' 

-- CREATE VIEW coffee_and_fries AS
-- SELECT distinct r.restaurant_id, r.restaurant_name, r.restaurant_rating
-- FROM restaurant r 
-- INNER JOIN drinks d ON r.restaurant_id = d.restaurant_id 
-- INNER JOIN restaurant_dishes rd ON r.restaurant_id = rd.restaurant_id 
-- WHERE d.drink_name like '%Coffee%' AND rd.dish_name like '%Fries%';

-- CREATE VIEW Cancellation_details AS
-- SELECT r.restaurant_id, r.restaurant_name, c.cancellation_reason
-- FROM restaurant r 
-- inner join restaurant_cancellation c
-- on r.restaurant_id = c.restaurant_id;

-- CREATE VIEW Reservation_details AS
-- SELECT r.restaurant_name, concat(u.user_first_name," ",u.user_last_name) as user_name, rs.reservation_date,rs.reservation_time
-- FROM restaurant r 
-- INNER JOIN restaurant_reservation rs ON r.restaurant_id = rs.restaurant_id 
-- INNER JOIN user u ON rs.user_id = u.user_id; 

-- CREATE VIEW review_count AS
-- SELECT r.restaurant_name,COUNT(re.review_comment)
-- FROM restaurant_review re INNER JOIN restaurant r 
-- ON r.restaurant_id = re.restaurant_id 
-- group by r.restaurant_name;

-- CREATE VIEW drink_price AS
-- SELECT r.restaurant_name,d.drink_name,d.drink_price
-- FROM restaurant r INNER JOIN drinks d
-- ON r.restaurant_id = d.restaurant_id
-- WHERE d.drink_price < 3;

-- CREATE VIEW nearby_CoffeeShop AS
-- SELECT r.restaurant_name,d.drink_name,d.drink_price,r.opening_hrs,r.closing_hrs
-- FROM restaurant r INNER JOIN drinks d
-- ON r.restaurant_id = d.restaurant_id
-- WHERE d.drink_name like '%Coffee%' AND r.zipcode ='2115';

-- CREATE VIEW Kids_menu_resturant AS
-- SELECT distinct(r.restaurant_name),r.no_of_tables
-- FROM restaurant r INNER JOIN restaurant_dishes d
-- ON r.restaurant_id=d.restaurant_id
-- WHERE d.category_id in (select category_id from dish_categories
-- 				Where category_name like "%kid%");

-- CREATE VIEW fast_food_resto AS
-- SELECT r.restaurant_name, rt.restaurant_type
-- FROM restaurant r INNER JOIN restaurant_type_mapping rtm inner join restaurant_type rt
-- on r.restaurant_id=rtm.restaurant_id
-- where restaurant_type='Fast food restaurant';

-- CREATE VIEW Prices_Popeyes AS
-- SELECT dt.dish_id,dt.dish_name, dt.dish_price
-- FROM restaurant_dishes dt INNER JOIN restaurant r
-- ON  dt.restaurant_id = r.restaurant_id 
-- WHERE  r.restaurant_name='Popeyes';

-- CREATE VIEW Opening_and_Closing_hrs AS
-- SELECT distinct r.restaurant_name, r.opening_hrs, r.closing_hrs, max(rv.user_rating) as highest_user_rating
-- FROM   restaurant r INNER JOIN restaurant_review rv
-- ON  r.restaurant_id = rv.restaurant_id 
-- WHERE  rv.user_rating > 4
-- group by r.restaurant_name;

-- CREATE VIEW Cancellation_details AS
-- SELECT r.restaurant_id, r.restaurant_name, count(c.cancellation_id)
-- FROM restaurant r 
-- inner join restaurant_cancellation c
-- on r.restaurant_id = c.restaurant_id
-- group by c.restaurant_id;








