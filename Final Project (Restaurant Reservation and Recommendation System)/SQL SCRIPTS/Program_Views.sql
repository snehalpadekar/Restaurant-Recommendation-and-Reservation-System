CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `userrating` AS
    SELECT 
        `r`.`restaurant_name` AS `restaurant_name`,
        `r`.`restaurant_rating` AS `restaurant_rating`,
        max(`re`.`user_rating`) AS `user_rating`,
        `r`.`opening_hrs` AS `opening_hrs`,
        `r`.`closing_hrs` AS `closing_hrs`,
        `r`.`budget_for_2` AS `budget_for_2`,
        `r`.`restaurant_address` AS `restaurant_address`,
        `r`.`zipcode` AS `zipcode`,
        `r`.`city` AS `city`,
        `r`.`state` AS `state`
    FROM
        (`restaurant` `r`
        JOIN `restaurant_review` `re` ON ((`r`.`restaurant_id` = `re`.`restaurant_id`)));
    
    
    
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `restype` AS
    SELECT DISTINCT
        `r`.`restaurant_name` AS `restaurant_name`,
        `r`.`restaurant_rating` AS `restaurant_rating`,
        `r`.`opening_hrs` AS `opening_hrs`,
        `r`.`closing_hrs` AS `closing_hrs`,
        `r`.`budget_for_2` AS `budget_for_2`,
        `r`.`restaurant_address` AS `restaurant_address`,
        `r`.`zipcode` AS `zipcode`,
        `r`.`city` AS `city`,
        `r`.`state` AS `state`,
        `t`.`restaurant_type` AS `restaurant_type`
    FROM
        ((`restaurant` `r`
        JOIN `restaurant_type_mapping` `tm` ON ((`r`.`restaurant_id` = `tm`.`restaurant_id`)))
        JOIN `restaurant_type` `t` ON ((`t`.`restaurant_type_id` = `tm`.`restaurant_type_id`)));
        
        
        
	CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `rescategory` AS
    SELECT 
        `r`.`restaurant_name` AS `restaurant_name`,
        `r`.`restaurant_rating` AS `restaurant_rating`,
        `r`.`opening_hrs` AS `opening_hrs`,
        `r`.`closing_hrs` AS `closing_hrs`,
        `r`.`budget_for_2` AS `budget_for_2`,
        `r`.`restaurant_address` AS `restaurant_address`,
        `r`.`zipcode` AS `zipcode`,
        `r`.`city` AS `city`,
        `r`.`state` AS `state`
    FROM
        (`restaurant` `r`
        JOIN `restaurant_dishes` `d` ON ((`r`.`restaurant_id` = `d`.`restaurant_id`)))
    GROUP BY `r`.`restaurant_name`;
    
    
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `drinktable` AS
    SELECT 
        `r`.`restaurant_name` AS `restaurant_name`,
        `d`.`drink_name` AS `drink_name`,
        `d`.`drink_type` AS `drink_type`,
        `d`.`drink_price` AS `drink_price`,
        `r`.`restaurant_rating` AS `restaurant_rating`,
        `r`.`opening_hrs` AS `opening_hrs`,
        `r`.`closing_hrs` AS `closing_hrs`,
        `r`.`budget_for_2` AS `budget_for_2`,
        `r`.`restaurant_address` AS `restaurant_address`,
        `r`.`zipcode` AS `zipcode`,
        `r`.`city` AS `city`,
        `r`.`state` AS `state`
    FROM
        (`restaurant` `r`
        JOIN `drinks` `d` ON ((`r`.`restaurant_id` = `d`.`restaurant_id`)))
    -- GROUP BY `r`.`restaurant_name`
    
    
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `dishprice` AS
    SELECT 
        `r`.`restaurant_name` AS `restaurant_name`,
        `d`.`dish_name` AS `dish_name`,
        `d`.`dish_price` AS `dish_price`,
        `r`.`restaurant_rating` AS `restaurant_rating`,
        `r`.`opening_hrs` AS `opening_hrs`,
        `r`.`closing_hrs` AS `closing_hrs`,
        `r`.`budget_for_2` AS `budget_for_2`,
        `r`.`restaurant_address` AS `restaurant_address`,
        `r`.`zipcode` AS `zipcode`,
        `r`.`city` AS `city`,
        `r`.`state` AS `state`
    FROM
        (`restaurant` `r`
        JOIN `restaurant_dishes` `d` ON ((`r`.`restaurant_id` = `d`.`restaurant_id`)))