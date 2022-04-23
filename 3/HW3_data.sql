TRUNCATE TABLE food_ingredient_relationship	CASCADE;
TRUNCATE TABLE food_tag_relationship		CASCADE;
TRUNCATE TABLE food_tag 					RESTART IDENTITY CASCADE;
TRUNCATE TABLE ingredient					RESTART IDENTITY CASCADE;
TRUNCATE TABLE food 						RESTART IDENTITY CASCADE;

TRUNCATE TABLE transfer_request				CASCADE;
TRUNCATE TABLE inspection_report			CASCADE;
TRUNCATE TABLE employee 					CASCADE;
TRUNCATE TABLE monthly_expenses				CASCADE;
TRUNCATE TABLE branch						CASCADE;
TRUNCATE TABLE customer_order_food			CASCADE;
TRUNCATE TABLE customer_order				RESTART IDENTITY CASCADE;
TRUNCATE TABLE branch_order					RESTART IDENTITY CASCADE;
TRUNCATE TABLE branch_order_ingredient		CASCADE;


INSERT INTO food (food_price, food_name, food_category) VALUES (50000, 'Pizza', 'Fast Food');
INSERT INTO food (food_price, food_name, food_category) VALUES (40000, 'Burger', 'Fast Food');
INSERT INTO food (food_price, food_name, food_category) VALUES (60000, 'Kebab', 'Food');

INSERT INTO food_tag (food_tag_name) VALUES ('Diet');
INSERT INTO food_tag (food_tag_name) VALUES ('Vegetables');
INSERT INTO food_tag (food_tag_name) VALUES ('Spicy');
INSERT INTO food_tag (food_tag_name) VALUES ('Other');

INSERT INTO food_tag_relationship (food_id, food_tag_id) VALUES (1, 3);
INSERT INTO food_tag_relationship (food_id, food_tag_id) VALUES (1, 2);
INSERT INTO food_tag_relationship (food_id, food_tag_id) VALUES (2, 3);
INSERT INTO food_tag_relationship (food_id, food_tag_id) VALUES (3, 4);

INSERT INTO ingredient (ingredient_name) VALUES ('Meat');
INSERT INTO ingredient (ingredient_name) VALUES ('Rice');
INSERT INTO ingredient (ingredient_name) VALUES ('Bread');
INSERT INTO ingredient (ingredient_name) VALUES ('Tomato');
INSERT INTO ingredient (ingredient_name) VALUES ('Mushroom');

INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (1, 1, 1);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (1, 4, 3);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (1, 5, 2);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (2, 1, 2);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (2, 3, 2);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (2, 4, 2);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (3, 1, 3);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (3, 2, 2);
INSERT INTO food_ingredient_relationship (food_id, ingredient_id, food_ingredient_amount) VALUES (3, 4, 1);


INSERT INTO branch (branch_number, branch_name, branch_address, branch_location, branch_capacity) VALUES (1, 'Shobe 1', 'Ye jaye khoob', Point(23.12, 53.12), 30);
INSERT INTO branch (branch_number, branch_name, branch_address, branch_location, branch_capacity) VALUES (2, 'Shobe 2', 'Ye jaye bad', Point(32.12, 40.12), 50);

INSERT INTO customer_order (branch_number, customer_order_total_price, customer_order_grade, customer_order_status) VALUES (1, 60000, 8, 'Paid');
INSERT INTO customer_order (branch_number, customer_order_total_price, customer_order_status) VALUES (1, 50000, 'Unpaid');
INSERT INTO customer_order (branch_number, customer_order_total_price, customer_order_grade, customer_order_status) VALUES (2, 30000, 5, 'Unpaid');

INSERT INTO customer_order_food (food_id, customer_order_id, customer_order_food_price) VALUES (1, 1, 50000);
INSERT INTO customer_order_food (food_id, customer_order_id, customer_order_food_price) VALUES (1, 1, 40000);
INSERT INTO customer_order_food (food_id, customer_order_id, customer_order_food_price) VALUES (2, 2, 35000);

INSERT INTO branch_order (branch_number, branch_order_status, branch_order_request_date, branch_order_delivery_date) VALUES (1, 'Sent', Date('2022-04-22'), NULL);
INSERT INTO branch_order (branch_number, branch_order_status, branch_order_request_date, branch_order_delivery_date) VALUES (2, 'Delivered', Date('2022-04-19'), Date('2022-04-21'));
INSERT INTO branch_order (branch_number, branch_order_status, branch_order_request_date, branch_order_delivery_date) VALUES (2, 'Delivered', Date('2022-04-20'), Date('2022-04-21'));
INSERT INTO branch_order (branch_number, branch_order_status, branch_order_request_date, branch_order_delivery_date) VALUES (1, 'Requested', Date('2022-04-22'), NULL);

INSERT INTO branch_order_ingredient (branch_order_id, ingredient_id, branch_order_ingredient_amount) VALUES (1, 1, 4);
INSERT INTO branch_order_ingredient (branch_order_id, ingredient_id, branch_order_ingredient_amount) VALUES (1, 2, 10);
INSERT INTO branch_order_ingredient (branch_order_id, ingredient_id, branch_order_ingredient_amount) VALUES (2, 3, 8);
INSERT INTO branch_order_ingredient (branch_order_id, ingredient_id, branch_order_ingredient_amount) VALUES (3, 5, 7);
INSERT INTO branch_order_ingredient (branch_order_id, ingredient_id, branch_order_ingredient_amount) VALUES (4, 4, 5);
INSERT INTO branch_order_ingredient (branch_order_id, ingredient_id, branch_order_ingredient_amount) VALUES (4, 5, 6);

INSERT INTO monthly_expense (expense_id, branch_number, expense_cost, expense_type, expense_date, payment_status) VALUES (1, 1, 440000, 'Rent', DATE('2022-04-04'), 'Payed');
INSERT INTO monthly_expense (expense_id, branch_number, expense_cost, expense_type, expense_date, payment_status) VALUES (2, 2, 20000, 'Electrical Bill', DATE('2022-04-02'), 'Not Payed');
INSERT INTO monthly_expense (expense_id, branch_number, expense_cost, expense_type, expense_date, payment_status) VALUES (3, 1, 233000, 'Buying Ingrediants', DATE('2022-03-13'), 'Not Payed');
INSERT INTO monthly_expense (expense_id, branch_number, expense_cost, expense_type, expense_date, payment_status) VALUES (4, 2, 1230000, 'Water Bill', DATE('2022-02-17'), 'Payed');

INSERT INTO employee (employee_id, employee_name, employee_post) VALUES (1, '|:MamaD:|', 'CEO');
INSERT INTO employee (employee_id, employee_name, employee_post) VALUES (2, 'Seyed Reza', 'CTO');
INSERT INTO employee (employee_id, employee_name, employee_post) VALUES (3, 'Pasha', 'CFO');

INSERT INTO administrative_employee (employee_id) VALUES (1);

INSERT INTO non_administrative_employee (employee_id, branch_number) VALUES (2, 1);
INSERT INTO non_administrative_employee (employee_id, branch_number) VALUES (3, 2);

INSERT INTO transfer_request (transfer_request_id, current_branch_number, destination_branch_number, employee_id, transfer_status) VALUES (1, 1, 2, 2, 'in discussion');
INSERT INTO transfer_request (transfer_request_id, current_branch_number, destination_branch_number, employee_id, transfer_status) VALUES (2, 2, 1, 3, 'finalized');

INSERT INTO inspection_report (inspection_report_id, inspection_report_date, branch_number, inspector_id) VALUES (1, DATE('2022-04-04'), 1, 1);
INSERT INTO inspection_report (inspection_report_id, inspection_report_date, branch_number, inspector_id) VALUES (2, DATE('2022-03-03'), 2, 1);

INSERT INTO inspection_report_grade (inspection_report_id, title, grade) VALUES (1, 'Ghaza' , 'Khoob bood :)'); 
INSERT INTO inspection_report_grade (inspection_report_id, title, grade) VALUES (1, 'Behdasht' , 'Ah Ah:('); 
INSERT INTO inspection_report_grade (inspection_report_id, title, grade) VALUES (2, 'Ghaza' , 'An Bood :{'); 
INSERT INTO inspection_report_grade (inspection_report_id, title, grade) VALUES (2, 'Behasht' , 'Awli :D');

-- SELECT * FROM food;
-- SELECT * FROM food_tag;
-- SELECT * FROM food_tag_relationship;
-- SELECT * FROM ingredient;
-- SELECT * FROM food_ingredient_relationship;
-- SELECT * FROM monthly_expense;
-- SELECT * FROM employee;
-- SELECT * FROM non_administrative_employee;
-- SELECT * FROM transfer_request;
-- SELECT * FROM inspection_report;
-- SELECT * FROM inspection_report_grade;

-- SELECT * FROM branch;
-- SELECT * FROM customer_order;
-- SELECT * FROM customer_order_food;
-- SELECT * FROM branch_order;
-- SELECT * FROM branch_order_ingredient;
