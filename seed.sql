USE food_app;

START TRANSACTION;
set foreign_key_checks = 0;

-- 1. 10 Users (7 Customers, 3 Agents)
INSERT INTO users (first_name, last_name, email, mob, address_city, user_type) VALUES
('Arjun', 'Mehta', 'arjun.m@example.com', '9876543210', 'Mumbai', 'customer'),
('Priya', 'Sharma', 'priya.s@example.com', '9876543211', 'Delhi', 'customer'),
('Rohan', 'Gupta', 'rohan.g@example.com', '9876543212', 'Bangalore', 'customer'),
('Ananya', 'Iyer', 'ananya.i@example.com', '9876543213', 'Chennai', 'customer'),
('Vikram', 'Singh', 'vikram.s@example.com', '9876543214', 'Mumbai', 'customer'),
('Sanya', 'Malhotra', 'sanya.m@example.com', '9876543215', 'Delhi', 'customer'),
('Ishaan', 'Verma', 'ishaan.v@example.com', '9876543216', 'Bangalore', 'customer'),
('Rahul', 'Delivery', 'rahul.d@speedy.com', '9999911111', 'Mumbai', 'agent'),
('Suresh', 'Express', 'suresh.e@speedy.com', '9999922222', 'Delhi', 'agent'),
('Amit', 'Fast', 'amit.f@speedy.com', '9999933333', 'Bangalore', 'agent');

-- 2. 5 Restaurants
INSERT INTO restaurants (name, address_city, status) VALUES
('The Burger Co.', 'Mumbai', 1),
('Pizza Paradise', 'Delhi', 1),
('Sushi Central', 'Bangalore', 1),
('Taco Bell India', 'Chennai', 1),
('Spice Garden', 'Mumbai', 1);

-- 3. 20 Menu Items
INSERT INTO menu_items (restaurant_id, name, price, category, availability) VALUES
(1, 'Classic Veggie Burger', 199, 'main', 1), (1, 'Double Cheese Burger', 299, 'main', 1), (1, 'Peri Peri Fries', 99, 'side', 1), (1, 'Vanilla Shake', 149, 'beverage', 1),
(2, 'Margherita Pizza', 399, 'main', 1), (2, 'Pepperoni Feast', 549, 'main', 1), (2, 'Garlic Breadsticks', 129, 'side', 1), (2, 'Chocolate Lava Cake', 179, 'dessert', 1),
(3, 'California Roll', 450, 'sushi', 1), (3, 'Salmon Nigiri', 550, 'sushi', 1), (3, 'Miso Soup', 120, 'side', 1), (3, 'Green Tea', 80, 'beverage', 1),
(4, '7 Layer Burrito', 249, 'main', 1), (4, 'Naked Chicken Taco', 189, 'main', 1), (4, 'Nachos with Salsa', 159, 'side', 1), (4, 'Cinnamon Twists', 99, 'dessert', 1),
(5, 'Butter Chicken', 350, 'main', 1), (5, 'Garlic Naan', 60, 'side', 1), (5, 'Gulab Jamun', 90, 'dessert', 1), (5, 'Mango Lassi', 110, 'beverage', 1);

-- 4. 30 Orders
INSERT INTO orders (user_id, restaurant_id, payment_method, amount, quantity) VALUES
(1, 1, 'upi', 447, 3), (2, 2, 'credit', 678, 2), (3, 3, 'debit', 570, 2), (4, 4, 'cash', 249, 1), (5, 5, 'upi', 410, 2),
(6, 2, 'credit', 549, 1), (7, 3, 'upi', 1100, 2), (1, 5, 'debit', 500, 3), (2, 1, 'cash', 298, 2), (3, 4, 'upi', 348, 2),
(4, 1, 'credit', 299, 1), (5, 2, 'debit', 1077, 3), (6, 3, 'cash', 450, 1), (7, 4, 'upi', 159, 1), (1, 5, 'credit', 200, 2),
(2, 2, 'upi', 129, 1), (3, 3, 'debit', 80, 1), (4, 4, 'cash', 99, 1), (5, 5, 'credit', 110, 1), (6, 1, 'upi', 99, 1),
(7, 2, 'debit', 399, 1), (1, 3, 'credit', 120, 1), (2, 4, 'cash', 189, 1), (3, 5, 'upi', 350, 1), (4, 1, 'debit', 149, 1),
(5, 2, 'credit', 179, 1), (6, 3, 'upi', 550, 1), (7, 4, 'cash', 249, 1), (1, 5, 'debit', 60, 1), (2, 1, 'credit', 199, 1);

-- 5. 60 Order Items
-- Deduplicated Order Items Seed Data
INSERT INTO order_items (order_id, menu_id, quantity, price) VALUES
-- Order 1 (The Burger Co.) - Deduplicated
(1, 1, 1, 199.00), (1, 2, 1, 299.00), (1, 3, 1, 99.00), (1, 4, 1, 149.00),
-- Order 2 (Pizza Paradise) - Deduplicated
(2, 5, 2, 399.00), (2, 7, 1, 129.00), (2, 8, 2, 179.00), (2, 6, 1, 549.00),
-- Order 3 (Sushi Central)
(3, 9, 1, 450.00), (3, 11, 1, 120.00), (3, 12, 1, 80.00), (3, 10, 1, 550.00),
-- Order 4 (Taco Bell India)
(4, 13, 1, 249.00), (4, 14, 1, 189.00), (4, 15, 1, 159.00), (4, 16, 1, 99.00),
-- Order 5 (Spice Garden)
(5, 17, 1, 350.00), (5, 18, 2, 60.00), (5, 19, 1, 90.00), (5, 20, 1, 110.00),
-- Order 6
(6, 6, 1, 549.00), (6, 7, 1, 129.00),
-- Order 7
(7, 10, 2, 550.00), (7, 11, 1, 120.00),
-- Order 8
(8, 17, 1, 350.00), (8, 18, 1, 60.00), (8, 19, 1, 90.00), (8, 20, 1, 110.00),
-- Order 9
(9, 1, 1, 199.00), (9, 2, 1, 299.00), (9, 3, 1, 99.00),
-- Order 10
(10, 14, 1, 189.00), (10, 15, 1, 159.00), (10, 16, 1, 99.00), (10, 13, 1, 249.00),
-- Order 12
(12, 5, 1, 399.00), (12, 7, 2, 129.00), (12, 8, 1, 179.00), (12, 6, 1, 549.00),
-- Order 15
(15, 19, 1, 90.00), (15, 20, 1, 110.00), (15, 17, 1, 350.00), (15, 18, 1, 60.00),
-- Continuing with remaining unique mappings to reach 60 items
(11, 2, 1, 299.00), (13, 9, 1, 450.00), (14, 15, 1, 159.00), (16, 7, 1, 129.00),
(17, 12, 1, 80.00), (18, 16, 1, 99.00), (19, 20, 1, 110.00), (20, 3, 1, 99.00),
(21, 5, 1, 399.00), (22, 11, 1, 120.00), (23, 14, 1, 189.00), (24, 17, 1, 350.00),
(25, 4, 1, 149.00), (26, 8, 1, 179.00), (27, 10, 1, 550.00), (28, 13, 1, 249.00),
(29, 18, 1, 60.00), (30, 1, 1, 199.00);

-- 6. 15 Delivery Assignments
INSERT INTO order_assignments (order_id, agent_id, status, assign_at, pickup_at, drop_at, expected_drop_at) VALUES
(1, 8, 'delivered', '2023-11-01 12:05:00', '2023-11-01 12:20:00', '2023-11-01 12:45:00', '2023-11-01 12:50:00'),
(2, 9, 'delivered', '2023-11-01 13:10:00', '2023-11-01 13:30:00', '2023-11-01 14:00:00', '2023-11-01 14:10:00'),
(3, 10, 'delivered', '2023-11-01 14:15:00', '2023-11-01 14:35:00', '2023-11-01 15:00:00', '2023-11-01 15:10:00'),
(4, 9, 'delivered', '2023-11-01 18:00:00', '2023-11-01 18:15:00', '2023-11-01 18:40:00', '2023-11-01 18:45:00'),
(5, 8, 'delivered', '2023-11-01 19:30:00', '2023-11-01 19:50:00', '2023-11-01 20:20:00', '2023-11-01 20:15:00'),
(6, 9, 'delivered', '2023-11-01 20:30:00', '2023-11-01 20:50:00', '2023-11-01 21:15:00', '2023-11-01 21:20:00'),
(7, 10, 'delivered', '2023-11-01 21:00:00', '2023-11-01 21:25:00', '2023-11-01 21:55:00', '2023-11-01 21:50:00'),
(8, 8, 'delivered', '2023-11-02 12:45:00', '2023-11-02 13:05:00', '2023-11-02 13:30:00', '2023-11-02 13:25:00'),
(9, 8, 'delivered', '2023-11-02 14:10:00', '2023-11-02 14:25:00', '2023-11-02 14:55:00', '2023-11-02 14:50:00'),
(11, 8, 'delivered', '2023-11-02 20:05:00', '2023-11-02 20:20:00', '2023-11-02 20:45:00', '2023-11-02 20:50:00'),
(12, 9, 'delivered', '2023-11-03 12:15:00', '2023-11-03 12:35:00', '2023-11-03 13:00:00', '2023-11-03 13:05:00'),
(13, 10, 'delivered', '2023-11-03 13:30:00', '2023-11-03 13:50:00', '2023-11-03 14:20:00', '2023-11-03 14:30:00'),
(16, 9, 'delivered', '2023-11-03 19:00:00', '2023-11-03 19:20:00', '2023-11-03 19:50:00', '2023-11-03 20:00:00'),
(17, 10, 'pickup', '2023-11-04 12:45:00', '2023-11-04 13:10:00', NULL, '2023-11-04 13:40:00'),
(22, 10, 'assigned', '2023-11-04 14:00:00', NULL, NULL, '2023-11-04 14:45:00');

-- 7. 20 Reviews
INSERT INTO reviews (user_id, order_id, restaurant_id, agent_id, rating, comment) VALUES
(1, 1, 1, 8, 5, 'Best burger in Mumbai! Arrived hot and fresh.'),
(2, 9, 1, 8, 4, 'Classic veggie burger was good, but fries were a bit salty.'),
(4, 11, 1, 8, 5, 'The Double Cheese Burger is a must-try. Delivery was lightning fast.'),
(6, 20, 1, 9, 3, 'Burger was okay, but the milkshake was half-melted.'),
(2, 2, 2, 9, 4, 'Great pepperoni pizza. Crust was perfect.'),
(6, 6, 2, 9, 5, 'Margherita was simple and delicious. Agent was very polite.'),
(5, 12, 2, 9, 2, 'Pizza arrived cold and the toppings were messy.'),
(2, 16, 2, 9, 4, 'Decent pizza for the price. Quick delivery.'),
(3, 3, 3, 10, 5, 'Authentic California rolls! The packaging was excellent.'),
(7, 7, 3, 10, 5, 'Salmon Nigiri was super fresh. Highly recommend!'),
(6, 13, 3, 10, 4, 'Good sushi, but forgot the extra ginger I requested.'),
(1, 22, 3, 10, 5, 'Tempura was still crispy. Excellent service.'),
(4, 4, 4, 9, 3, 'Burrito was a bit dry, but the nachos were great.'),
(3, 10, 4, 9, 4, 'Chicken tacos were tasty. Good value for money.'),
(4, 14, 4, 9, 5, 'Loved the Cinnamon Twists! Delivery was on time.'),
(7, 23, 4, 10, 2, 'The taco shell was broken and the order was late.'),
(5, 5, 5, 8, 5, 'The Butter Chicken is legendary. Garlic naan was soft.'),
(1, 8, 5, 8, 4, 'Good Indian food. The Mango Lassi was very refreshing.'),
(1, 15, 5, 8, 5, 'Consistently good food and fast delivery every time.'),
(3, 24, 5, 10, 3, 'Food was too spicy for my liking, but quality was good.');

-- 8. Audit logs (Order Status Changes)
INSERT INTO order_status (order_id, status, created_at) VALUES
(1, 'placed', '2023-11-01 12:00:00'), (1, 'preparing', '2023-11-01 12:05:00'), (1, 'out_for_delivery', '2023-11-01 12:20:00'), (1, 'delivered', '2023-11-01 12:45:00'),
(2, 'placed', '2023-11-01 13:00:00'), (2, 'preparing', '2023-11-01 13:10:00'), (2, 'delivered', '2023-11-01 14:00:00'),
(3, 'placed', '2023-11-01 14:10:00'), (3, 'preparing', '2023-11-01 14:15:00'), (3, 'out_for_delivery', '2023-11-01 14:35:00'), (3, 'delivered', '2023-11-01 15:00:00'),
(4, 'placed', '2023-11-01 17:50:00'), (4, 'preparing', '2023-11-01 18:00:00'), (4, 'out_for_delivery', '2023-11-01 18:15:00'), (4, 'delivered', '2023-11-01 18:40:00'),
(5, 'placed', '2023-11-01 19:15:00'), (5, 'preparing', '2023-11-01 19:30:00'), (5, 'out_for_delivery', '2023-11-01 19:50:00'), (5, 'delivered', '2023-11-01 20:20:00'),
(6, 'placed', '2023-11-01 20:15:00'), (6, 'preparing', '2023-11-01 20:30:00'), (6, 'out_for_delivery', '2023-11-01 20:50:00'), (6, 'delivered', '2023-11-01 21:15:00'),
(7, 'placed', '2023-11-01 20:45:00'), (7, 'preparing', '2023-11-01 21:00:00'), (7, 'out_for_delivery', '2023-11-01 21:25:00'), (7, 'delivered', '2023-11-01 21:55:00'),
(17, 'placed', '2023-11-04 12:30:00'), (17, 'preparing', '2023-11-04 12:45:00'), (17, 'out_for_delivery', '2023-11-04 13:10:00'),
(22, 'placed', '2023-11-04 13:50:00'), (22, 'preparing', '2023-11-04 14:00:00'),
(8, 'delivered', '2023-11-02 13:30:00'), (9, 'delivered', '2023-11-02 14:55:00'), (10, 'delivered', '2023-11-02 16:00:00'),
(11, 'delivered', '2023-11-02 20:45:00'), (12, 'delivered', '2023-11-03 13:00:00'), (13, 'delivered', '2023-11-03 14:20:00'),
(14, 'delivered', '2023-11-03 15:30:00'), (15, 'delivered', '2023-11-03 16:45:00'), (16, 'delivered', '2023-11-03 19:50:00'),
(18, 'delivered', '2023-11-04 11:00:00'), (19, 'delivered', '2023-11-04 12:00:00'), (20, 'delivered', '2023-11-04 13:00:00'),
(21, 'delivered', '2023-11-04 14:00:00'), (23, 'delivered', '2023-11-04 15:00:00'), (24, 'delivered', '2023-11-04 16:00:00'),
(25, 'delivered', '2023-11-04 17:00:00'), (26, 'delivered', '2023-11-04 18:00:00'), (27, 'delivered', '2023-11-04 19:00:00'),
(28, 'delivered', '2023-11-04 20:00:00'), (29, 'delivered', '2023-11-04 21:00:00'), (30, 'delivered', '2023-11-04 22:00:00');

set foreign_key_checks = 1;

COMMIT;

-- updates

update orders
set created_at = created_at - interval 10 day
where id = 5;

update orders
set created_at = created_at - interval 9 day
where id = 6;

update orders
set created_at = created_at - interval 8 day
where id = 7;

update orders
set created_at = created_at - interval 7 day
where id = 8;

update orders
set created_at = created_at - interval 6 day
where id = 9;

update orders
set created_at = created_at - interval 12 day
where id = 10;


insert into restaurants (name, address_city, address_state) values ('Odia Cuisin', 'Bhubaneswar', 'Odisha');

update order_assignments set created_at = now() - interval 8 day where order_id = 1 and agent_id = 8;
