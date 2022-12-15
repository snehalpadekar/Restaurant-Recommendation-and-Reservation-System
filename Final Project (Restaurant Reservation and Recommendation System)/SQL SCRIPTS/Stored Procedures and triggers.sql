#STORED PROCEDURES

/*-----------------------------------------------------------------------------------------------
Review Restaurant 
-----------------------------------------------------------------------------------------------*/
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_restaurant_review`(rev_comment VARCHAR(1000),
likedornot INT,
userrating FLOAT,
res_name VARCHAR(100),
user_fname VARCHAR(100))
BEGIN
DECLARE resid INT;
DECLARE userid INT;
DECLARE reviewid INT;
set @resname = res_name;
select restaurant_id INTO resid from restaurant where restaurant_name like CONCAT('%',@resname,'%');
set @uname = user_fname;
select user_id INTO userid from user where user_first_name = @uname;
select max(review_id)+1 into  reviewid from restaurant_review;
INSERT INTO restaurant_review values (reviewid, rev_comment, likedornot, userrating, CURDATE(), resid, userid);
END
//


/*-----------------------------------------------------------------------------------------------
Restaurant Reservation
-----------------------------------------------------------------------------------------------*/

DELIMITER //
CREATE PROCEDURE `restaurant_reservation` (no_of_people int, reservation_time time, reservation_date date,IN  res_name varchar(100), IN user_firstname varchar(100))
BEGIN
DECLARE resid INT;
DECLARE userid INT;
DECLARE reservid INT;
set @resname = res_name;
select restaurant_id INTO resid from restaurant where restaurant_name like CONCAT('%',@resname,'%');
set @uname = user_firstname;
select user_id INTO userid from user where user_first_name = @uname;
select max(reservation_id)+1 into  reservid from restaurant_reservation;
INSERT INTO restaurant_reservation values (reservid,no_of_people, reservation_time, reservation_date, resid, userid);
END;
//


/*-----------------------------------------------------------------------------------------------
Trigger
-----------------------------------------------------------------------------------------------*/
#trigger 
#trigger 
DELIMITER //
CREATE TRIGGER updatenooftables
AFTER INSERT  
ON restaurant_reservation
FOR EACH ROW
UPDATE restaurant set no_of_tables = no_of_tables - 1 where restaurant_id = new.restaurant_id;
//


/*-----------------------------------------------------------------------------------------------
Restaurant Cancellation
-----------------------------------------------------------------------------------------------*/
DELIMITER //
CREATE PROCEDURE `restaurant_cancellation` (IN cancelreason varchar(100), IN  reserv_id INT)
BEGIN
DECLARE userid INT;
DECLARE cancelid INT;
DECLARE restaurantid INT;
	IF  (select reservation_id from restaurant_reservation where reservation_id = reserv_id) THEN 
		BEGIN
		select user_id INTO userid from restaurant_reservation where reservation_id = reserv_id;
		select restaurant_id INTO restaurantid from restaurant_reservation where reservation_id = reserv_id;
		select max(cancellation_id)+1 into  cancelid from restaurant_cancellation;
		INSERT INTO restaurant_cancellation values (cancelid, cancelreason, restaurantid, userid);
		UPDATE restaurant set no_of_tables = no_of_tables + 1 where restaurant_id = restaurantid;
		DELETE from restaurant_reservation where reservation_id = reserv_id;
		END;
	else
		BEGIN
	    select 'Reservation ID does not exist';
	END;
    END IF;
END;
//


/*-----------------------------------------------------------------------------------------------
Trigger
-----------------------------------------------------------------------------------------------*/
#trigger 
DELIMITER //
CREATE TRIGGER updatenooftables1
AFTER INSERT  
ON restaurant_cancellation
FOR EACH ROW
UPDATE restaurant set no_of_tables = no_of_tables + 1 where restaurant_id = new.restaurant_id;
//


/*-----------------------------------------------------------------------------------------------
Search restaurant by budget
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_budget`(IN budget int)
BEGIN
SELECT restaurant_name,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM restaurant where budget_for_2 <= budget ;
END;

/*-----------------------------------------------------------------------------------------------
Search restaurant by zipcode
-----------------------------------------------------------------------------------------------*/
CREATE PROCEDURE `searchby_zip`(in zip int)
BEGIN
SELECT restaurant_name,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM restaurant where zipcode = zip ;
END;

/*-----------------------------------------------------------------------------------------------
Search restaurant by category
-----------------------------------------------------------------------------------------------*/
CREATE  PROCEDURE `searchby_category`(IN category varchar(100))
BEGIN
set @categoryname = category;
SELECT distinct restaurant_name,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM restaurant r INNER JOIN restaurant_dishes d
ON r.restaurant_id=d.restaurant_id
WHERE d.category_id in (
	select category_id from dish_categories 
    where category_name like CONCAT('%',@categoryname,'%'));
END;

/*-----------------------------------------------------------------------------------------------
Search restaurant by Dish Name
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_dishname`(IN dishname varchar(100))
BEGIN
SET @dish_name = dishname;
 SELECT restaurant_name,dish_name,dish_price,restaurant_rating,budget_for_2, restaurant_address, zipcode, city, state
 FROM dishprice
  WHERE dish_name like  CONCAT('%',@dish_name,'%');
END;

/*-----------------------------------------------------------------------------------------------
Search restaurant by Dish Price
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_dishprice`(IN price int)
BEGIN
 SELECT restaurant_name,dish_name,dish_price,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
 FROM dishprice
  WHERE dish_price <= price;
END

/*-----------------------------------------------------------------------------------------------
Search restaurant by Drink Price
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_drinkprice`(IN price int)
BEGIN
 SELECT restaurant_name,drink_name,drink_type,drink_price,budget_for_2, restaurant_address, zipcode
 FROM drinktable
  WHERE drink_price <= price;
END

/*-----------------------------------------------------------------------------------------------
Search restaurant by Drink Type
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_drinktype1`(IN drinktype varchar(100))
BEGIN
SET @drink_type = drinktype;
SELECT restaurant_name,drink_type,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
 FROM drinktable
WHERE drink_type like CONCAT('%',@drink_type,'%');
END

/*-----------------------------------------------------------------------------------------------
Search restaurant by Rating
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_rating`(IN rating float)
BEGIN
SELECT restaurant_name,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM restaurant where restaurant_rating >= rating ;
END

/*-----------------------------------------------------------------------------------------------
Search restaurant by Restaurant Name
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_restaurant_name`(IN resname varchar(100))
BEGIN
SELECT restaurant_name,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM restaurant where restaurant_name = resname ;
END

/*-----------------------------------------------------------------------------------------------
Search restaurant by Restaurant Type
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_restaurant_name`(IN resname varchar(100))
BEGIN
SELECT restaurant_name,restaurant_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM restaurant where restaurant_name = resname ;
END

/*-----------------------------------------------------------------------------------------------
Search restaurant by User rating
-----------------------------------------------------------------------------------------------*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchby_userrating`(IN rate float)
BEGIN
SELECT restaurant_name,restaurant_rating,user_rating, opening_hrs, closing_hrs,budget_for_2, restaurant_address, zipcode, city, state
FROM userrating
WHERE user_rating >= rate;
END
