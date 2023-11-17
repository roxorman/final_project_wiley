use final_project;

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(255),
    customer_state VARCHAR(255)
    );
    -- FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ALTER TABLE customers
ADD CONSTRAINT fk_customer_geolocation
FOREIGN KEY (customer_zip_code_prefix)
REFERENCES geolocation(zip_code_prefix);
    

SHOW VARIABLES LIKE 'local_infile';
GRANT FILE ON *.* TO 'root'@'localhost';


CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(255),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
    );
    -- FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ALTER TABLE orders
ADD FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

LOAD DATA LOCAL INFILE "C:/Users/marno/Wiley Edge/Final_Project/Code/data/orders.csv"
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS;

CREATE TABLE order_reviews (
    review_id VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title VARCHAR(255),
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
    );
  -- FOREIGN KEY (order_id) REFERENCES orders(order_id)
ALTER TABLE order_reviews
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id);

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(255),
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
-- Make foreign key product_category_name VARCHAR(255), 
ALTER TABLE products
ADD FOREIGN KEY (product_category_name)
REFERENCES product_category_translation(product_category_name);


CREATE TABLE order_payments (
    order_id VARCHAR(50) PRIMARY KEY,
    payment_sequential INT,
    payment_type VARCHAR(255),
    payment_installments INT,
    payment_value DECIMAL(10, 2)
);
	-- FOREIGN KEY (order_id) REFERENCES orders(order_id)
ALTER TABLE order_payments
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id);


CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    PRIMARY KEY (order_id, order_item_id)
    );
    -- FOREIGN KEY (order_id) REFERENCES orders(order_id),
    -- FOREIGN KEY (product_id) REFERENCES products(product_id)
ALTER TABLE order_items
ADD FOREIGN KEY (order_id)
REFERENCES orders(order_id),
ADD FOREIGN KEY (product_id)
REFERENCES products(product_id),
ADD FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);


CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(255),
    seller_state VARCHAR(255)
);
	-- seller_zip_code_prefix INT
ALTER TABLE sellers
ADD FOREIGN KEY (seller_zip_code_prefix)
REFERENCES geolocation(zip_code_prefix);

CREATE TABLE geolocation (
    zip_code_prefix INT PRIMARY KEY,
    lat DECIMAL(9, 6),
    lng DECIMAL(9, 6),
    city VARCHAR(255),
    state VARCHAR(255)
    );
    
CREATE TABLE product_category_translation (
    product_category_name VARCHAR(255) PRIMARY KEY,
    english_category_name VARCHAR(255)
);
ALTER TABLE product_category_translation
ADD FOREIGN KEY (product_category_name)
REFERENCES products(product_category_name);



