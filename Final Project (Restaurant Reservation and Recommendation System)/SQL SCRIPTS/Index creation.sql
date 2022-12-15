CREATE INDEX index_restaurant_id ON restaurant(restaurant_id);

CREATE INDEX index_name ON user(user_first_name, user_last_name);

CREATE UNIQUE INDEX index_restaurant_review ON restaurant_review(review_id);

CREATE UNIQUE INDEX index_restaurant_reservation ON restaurant_reservation(reservation_id);

CREATE UNIQUE INDEX index_restaurant_cancellation ON restaurant_cancellation(cancellation_id);