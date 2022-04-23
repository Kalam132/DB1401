DROP TABLE 	IF EXISTS branch_order_ingredient		CASCADE;
DROP TABLE 	IF EXISTS customer_order_food			CASCADE;
DROP TABLE 	IF EXISTS customer_order 				CASCADE;
DROP TABLE 	IF EXISTS branch_order	 				CASCADE;
DROP TABLE 	IF EXISTS branch	 					CASCADE;
DROP TABLE  IF EXISTS monthly_expense              	CASCADE;
DROP TABLE  IF EXISTS transfer_request              CASCADE;
DROP TABLE  IF EXISTS employee        		   		CASCADE;
DROP TABLE  IF EXISTS administrative_employee		CASCADE;
DROP TABLE  IF EXISTS non_administrative_employee	CASCADE;
DROP TABLE  IF EXISTS inspection_report				CASCADE;
DROP TABLE  IF EXISTS inspection_report_grade		CASCADE;

DROP TABLE 	IF EXISTS food_ingredient_relationship 	CASCADE;
DROP TABLE 	IF EXISTS food_tag_relationship			CASCADE;
DROP TABLE 	IF EXISTS food_tag						CASCADE;
DROP TABLE 	IF EXISTS food 							CASCADE;
DROP TABLE 	IF EXISTS ingredient 					CASCADE;


CREATE TABLE food (
	PRIMARY KEY (food_id),
    food_id						SERIAL			NOT NULL,
    food_price					INT				NOT NULL,
    food_name					VARCHAR(32)		NOT NULL,
    food_category				VARCHAR(32)
);

CREATE TABLE food_tag (
	PRIMARY KEY (food_tag_id),
	food_tag_id					SERIAL			NOT NULL,
	food_tag_name				VARCHAR(32)		NOT NULL
);

CREATE TABLE food_tag_relationship (
	FOREIGN KEY (food_id)		REFERENCES food			ON DELETE CASCADE,
	FOREIGN KEY (food_tag_id)	REFERENCES food_tag		ON DELETE CASCADE,
	food_id						INT				NOT NULL,
	food_tag_id					INT				NOT NULL
);

CREATE TABLE ingredient (
	PRIMARY KEY (ingredient_id),
    ingredient_id 				SERIAL			NOT NULL,
    ingredient_name 			VARCHAR(32)		NOT NULL
);

CREATE TABLE food_ingredient_relationship (
    FOREIGN KEY (food_id) 		REFERENCES food 		ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredient	ON DELETE RESTRICT,
    food_id 					INT				NOT NULL,
    ingredient_id 				INT				NOT NULL,
    food_ingredient_amount 		INT				NOT NULL
);


CREATE TABLE branch (
	PRIMARY KEY (branch_number),
	branch_number				INT				NOT NULL,
	branch_name					VARCHAR(32)		NOT NULL,
	branch_address				VARCHAR(256),
	branch_location				POINT,
	branch_capacity				INT
);

CREATE TABLE customer_order (
	PRIMARY KEY (customer_order_id),
	FOREIGN KEY (branch_number) 	REFERENCES branch	ON DELETE CASCADE,
	customer_order_id			SERIAL			NOT NULL,
	branch_number				INT				NOT NULL,
	customer_order_total_price	INT,
	customer_order_grade		INT,
	customer_order_status		VARCHAR(8)		NOT NULL,
	CHECK (customer_order_grade BETWEEN 0 AND 10),
	CHECK (customer_order_status IN ('Paid', 'Unpaid'))
);

CREATE TABLE customer_order_food (
	FOREIGN KEY (food_id)		 	REFERENCES food				ON DELETE SET NULL,
	FOREIGN KEY	(customer_order_id)	REFERENCES customer_order	ON DELETE CASCADE,
	food_id						INT,
	customer_order_id			INT,
	customer_order_food_price	INT
);

CREATE TABLE branch_order (
	PRIMARY KEY (branch_order_id),
	FOREIGN KEY (branch_number) 	REFERENCES branch,
	branch_order_id				SERIAL			NOT NULL,
	branch_number				INT				NOT NULL,
	branch_order_status			VARCHAR(16)		NOT NULL,
	branch_order_request_date	DATE			NOT NULL,
	branch_order_delivery_date	DATE,
	CHECK (branch_order_status IN ('Delivered', 'Sent', 'Requested'))
);

CREATE TABLE branch_order_ingredient (
	FOREIGN KEY (branch_order_id)	REFERENCES branch_order		ON DELETE CASCADE,
	FOREIGN KEY	(ingredient_id)		REFERENCES ingredient		ON DELETE SET NULL,
	branch_order_id					INT		NOT NULL,
	ingredient_id					INT		NOT NULL,
	branch_order_ingredient_amount	INT		NOT NULL
);

CREATE TABLE monthly_expense (
	PRIMARY KEY (expense_id),
	FOREIGN KEY (branch_number)		REFERENCES branch		ON DELETE CASCADE,
	expense_id						INT		NOT NULL,
	branch_number					INT		NOT NULL,
	expense_cost					DOUBLE PRECISION	NOT NULL,
	expense_type					VARCHAR(32),
	expense_date					DATE,
	payment_status					VARCHAR(32)
);

CREATE TABLE employee (
	PRIMARY KEY (employee_id),
	employee_id						INT		NOT NULL,
	employee_name					VARCHAR(32),
	employee_post					VARCHAR(32)
);

CREATE TABLE administrative_employee (
	PRIMARY KEY (employee_id),
	FOREIGN KEY (employee_id)		REFERENCES employee ON DELETE CASCADE,
	employee_id						INT		NOT NULL
);

CREATE TABLE non_administrative_employee (
	PRIMARY KEY (employee_id),
	FOREIGN KEY (employee_id) 		REFERENCES employee ON DELETE CASCADE,
	FOREIGN KEY (branch_number)		REFERENCES branch ON DELETE SET NULL,
	employee_id						INT		NOT NULL,
	branch_number 					INT
);

CREATE TABLE transfer_request (
	PRIMARY KEY (transfer_request_id),
	FOREIGN KEY (current_branch_number)		REFERENCES branch		ON DELETE SET NULL,
	FOREIGN KEY (destination_branch_number)	REFERENCES branch		ON DELETE CASCADE,
	FOREIGN KEY (employee_id)				REFERENCES non_administrative_employee ON DELETE CASCADE,
	transfer_request_id						INT		NOT NULL,
	current_branch_number					INT,
	destination_branch_number				INT		NOT NULL,
	employee_id								INT		NOT NULL,
	transfer_status							VARCHAR(32)
);

CREATE TABLE inspection_report (
	PRIMARY KEY (inspection_report_id),
	FOREIGN KEY (branch_number) 			REFERENCES branch ON DELETE CASCADE,
	FOREIGN KEY (inspector_id)				REFERENCES administrative_employee ON DELETE SET NULL,
	inspection_report_id					INT		NOT NULL,
	inspection_report_date					DATE,
	branch_number 							INT		NOT NULL,
	inspector_id 							INT
);

CREATE TABLE inspection_report_grade (
	FOREIGN KEY (inspection_report_id) 		REFERENCES inspection_report ON DELETE CASCADE,
	inspection_report_id					INT NOT NULL,
	title									VARCHAR(32),
	grade		 							VARCHAR(32)
);
