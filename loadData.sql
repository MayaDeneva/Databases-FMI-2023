SET SCHEMA FN2MI0700013;

-- necessary alterations
alter table ORDER
    alter column ORDER_DATE set data type TIMESTAMP;
alter table ADDEXTRATOPIZZA
    alter column ORDER set data type TIMESTAMP;
alter table ADDDRINKTOORDER
    alter column ORDER set data type TIMESTAMP;
alter table ADDPIZZATOORDER
    alter column ORDER set data type TIMESTAMP;

call sysproc.admin_cmd('reorg table ORDER');
-- ALTER TABLE ADDEXTRATOPIZZA
--     DROP CONSTRAINT PK_EXTRA;
ALTER TABLE ADDEXTRATOPIZZA
    ADD CONSTRAINT FK_CLIENT_PHONE_NUM FOREIGN KEY (CLIENT_PHONE_NUM) REFERENCES CLIENT (PHONE_NUMBER);
-- ALTER TABLE ADDPIZZATOORDER
--     DROP CONSTRAINT PK_ADD_PIZZA;

ALTER TABLE ADDPIZZATOORDER
    ADD CONSTRAINT FK_CLIENT_PHONE_NUMBER FOREIGN KEY (CLIENT_PHONE_NUM) REFERENCES CLIENT (PHONE_NUMBER);

-- ALTER TABLE ADDDRINKTOORDER
--     DROP CONSTRAINT PK_ADD_DRINK;
ALTER TABLE ADDDRINKTOORDER
    ADD CONSTRAINT FK_CLIENT_PHONE_NUMBER FOREIGN KEY (CLIENT_PHONE_NUM) REFERENCES CLIENT (PHONE_NUMBER);
-- ALTER TABLE ORDER
--     DROP CONSTRAINT UC_ORDER;

--insertion

INSERT INTO PIZZA (PIZZA_ID, NAME, PRICE, WEIGHT)
VALUES ('08f68', 'Margherita', 10.99, 350),
       ('14bce', 'Pepperoni', 12.99, 400),
       ('d1b10', 'Vegetarian', 11.99, 380),
       ('7f53e', 'Hawaiian', 13.99, 420),
       ('9acfa', 'Meat Lovers', 14.99, 450),
       ('4e801', 'Carbonarra', 12.90, 450),
       ('68b4f', 'Bourbon Pizza', 13.90, 450),
       ('82de7', 'Quatro Formaggi', 15.90, 550),
       ('0d85d', 'Master Burger', 17.90, 550),
       ('5c48a', 'Extravaganza', 17.90, 550);


INSERT INTO DRINKS (DRINK_ID, NAME, PRICE, QUANTITY)
VALUES ('f42ab', 'Coca-Cola', 2.60, 0.5),
       ('6c5d3', 'Coca-Cola Zero', 2.60, 0.5),
       ('2a8e9', 'Sprite', 2.60, 0.5),
       ('b19f6', 'Fanta', 2.60, 0.5),
       ('d58c2', 'Fuzetea', 2.50, 0.5),
       ('7e0d9', 'Water', 1.30, 0.5),
       ('3b6f8', 'Cappy Pulpy', 2.40, 0.33),
       ('1f5e6', 'Ayran', 2.60, 0.5),
       ('9d4c0', 'Redbull', 3.70, 0.25),
       ('a5f2b', 'Beer', 2.40, 0.5);

INSERT INTO CLIENT (NAME, ADDRESS, PHONE_NUMBER)
VALUES ('Ivan Petrov', '23 Tsar Boris III Blvd., Sofia', '359888920865'),
       ('Maria Georgieva', '10 Stefan Stambolov Str., Plovdiv', '359899123456'),
       ('Dimitar Ivanov', '7 Varna Blvd., Varnа', '359899998765'),
       ('Anna Petrova', '45 Shipchenski Prohod Blvd., Sofia', '359888332233'),
       ('Georgi Dimitrov', '29 Hristo Botev Str., Burgas', '359898776655'),
       ('Elena Nikolova', '12 St. Cyril and Methodius Str., Rousse', '359876554433'),
       ('Stefan Popov', '51 Vitosha Blvd., Sofia', '359888775544'),
       ('Tanya Ivanova', '6 Ivan Asen II Str., Veliko Tarnovo', '359874333222'),
       ('Petar Georgiev', '18 Patriarch Evtimii Blvd., Sofia', '359889993321'),
       ('Milena Dimitrova', '3A Tsar Simeon St., Varna', '359894443323');

INSERT INTO PRODUCTS(NAME, PRICE, WEIGHT)
VALUES ('Burger Sauce', 2.0, 50),
       ('Tomato Sauce', 2.50, 200),
       ('Mozzarella', 2.50, 100),
       ('Pepperoni', 3.50, 100),
       ('Ham', 3.50, 100),
       ('Olives', 2.0, 150),
       ('Onion', 0.5, 100),
       ('Peppers', 1.20, 200),
       ('Tomatoes', 2.40, 300),
       ('Mushrooms', 3.0, 150),
       ('Pineapple', 4.0, 150),
       ('Chicken', 3.50, 100),
       ('Chorizo', 4.0, 100),
       ('Bacon', 3.50, 150),
       ('Sour Cream', 2.50, 100),
       ('Parmigiano', 2.40, 100),
       ('Barbecue Sauce', 1.50, 50),
       ('Bourbon Sauce', 1.70, 50),
       ('Cheddar', 3.60, 100),
       ('Cow Cheese', 2.40, 100);

INSERT INTO PIZZACONTENTS(PIZZAID, PRODUCT_NAME)
VALUES ('08f68', 'Tomato Sauce'),
       ('08f68', 'Mozzarella'),
       ('14bce', 'Pepperoni'),
       ('14bce', 'Tomato Sauce'),
       ('14bce', 'Mozzarella'),
       ('d1b10', 'Olives'),
       ('d1b10', 'Peppers'),
       ('d1b10', 'Onion'),
       ('d1b10', 'Tomatoes'),
       ('d1b10', 'Mushrooms'),
       ('7f53e', 'Tomato Sauce'),
       ('7f53e', 'Mozzarella'),
       ('7f53e', 'Pineapple'),
       ('7f53e', 'Ham'),
       ('9acfa', 'Bacon'),
       ('9acfa', 'Tomato Sauce'),
       ('9acfa', 'Mozzarella'),
       ('9acfa', 'Chorizo'),
       ('9acfa', 'Chicken'),
       ('4e801', 'Mozzarella'),
       ('4e801', 'Bacon'),
       ('4e801', 'Mushrooms'),
       ('4e801', 'Sour Cream'),
       ('68b4f', 'Tomato Sauce'),
       ('68b4f', 'Mozzarella'),
       ('68b4f', 'Chicken'),
       ('68b4f', 'Bacon'),
       ('68b4f', 'Onion'),
       ('68b4f', 'Bourbon Sauce'),
       ('82de7', 'Tomato Sauce'),
       ('82de7', 'Mozzarella'),
       ('82de7', 'Cheddar'),
       ('82de7', 'Cow Cheese'),
       ('82de7', 'Parmigiano'),
       ('0d85d', 'Mozzarella'),
       ('0d85d', 'Onion'),
       ('0d85d', 'Barbecue Sauce'),
       ('0d85d', 'Chicken'),
       ('0d85d', 'Tomatoes'),
       ('0d85d', 'Burger Sauce'),
       ('5c48a', 'Mozzarella'),
       ('5c48a', 'Tomato Sauce'),
       ('5c48a', 'Ham'),
       ('5c48a', 'Pepperoni'),
       ('5c48a', 'Onion'),
       ('5c48a', 'Peppers'),
       ('5c48a', 'Olives'),
       ('5c48a', 'Mushrooms');

INSERT INTO ORDER(CLIENT_PHONE_NUMBER, ORDER_DATE)
VALUES ('35988892086', '2023-08-10 10:45:23'),
       ('35988892086', '2023-08-10 12:11:50'),
       ('359899123456', '2023-02-18 14:20:35'),
       ('359899998765', '2023-06-07 21:30:59'),
       ('359888332233', '2022-10-05 16:50:11'),
       ('359888332233', '2022-10-05 16:55:54'),
       ('359898776655', '2022-11-15 17:25:19'),
       ('359898776655', '2023-01-29 11:40:53'),
       ('359898776655', '2023-07-22 22:05:14'),
       ('359898776655', '2023-11-04 18:25:16'),
       ('359876554433', '2023-06-21 15:55:48'),
       ('359876554433', '2023-03-07 20:10:59'),
       ('359888775544', '2022-10-29 12:30:05'),
       ('359888775544', '2022-11-26 17:00:21'),
       ('359874333222', '2023-02-09 11:15:37'),
       ('359889993321', '2023-08-01 21:35:43'),
       ('359894443323', '2022-09-22 10:50:59');

INSERT INTO ADDPIZZATOORDER(PIZZA_ID, PIZZA_QUANTITY, ORDER, CLIENT_PHONE_NUM)
VALUES ('08f68', 1, '2023-08-10 10:45:23', '35988892086'),
       ('d1b10', 1, '2023-08-10 12:11:50', '35988892086'),
       ('14bce', 2, '2023-08-10 12:11:50', '35988892086'),
       ('7f53e', 2, '2023-02-18 14:20:35', '359899123456'),
       ('9acfa', 3, '2023-02-18 14:20:35', '359899123456'),
       ('4e801', 4, '2023-06-07 21:30:59', '359899998765'),
       ('68b4f', 2, '2022-10-05 16:50:11', '359888332233'),
       ('82de7', 3, '2022-10-05 16:55:54', '359888332233'),
       ('0d85d', 1, '2022-10-05 16:55:54', '359888332233'),
       ('5c48a', 2, '2022-11-15 17:25:19', '359898776655'),
       ('08f68', 3, '2023-01-29 11:40:53', '359898776655'),
       ('14bce', 4, '2023-07-22 22:05:14', '359898776655'),
       ('d1b10', 3, '2023-11-04 18:25:16', '359898776655'),
       ('7f53e', 2, '2023-06-21 15:55:48', '359876554433'),
       ('9acfa', 3, '2023-03-07 20:10:59', '359876554433'),
       ('4e801', 4, '2022-10-29 12:30:05', '359888775544'),
       ('68b4f', 5, '2022-11-26 17:00:21', '359888775544'),
       ('82de7', 3, '2023-02-09 11:15:37', '359874333222'),
       ('0d85d', 5, '2023-08-01 21:35:43', '359889993321'),
       ('5c48a', 5, '2022-09-22 10:50:59', '359894443323');

INSERT INTO ADDDRINKTOORDER(DRINK_ID, DRINK_QUANTITY, ORDER, CLIENT_PHONE_NUM)
VALUES ('a5f2b', 5, '2023-08-10 10:45:23', '35988892086'),
       ('6c5d3', 3, '2023-08-10 12:11:50', '35988892086'),
       ('6c5d3', 2, '2023-08-10 12:11:50', '35988892086'),
       ('d58c2', 4, '2023-02-18 14:20:35', '359899123456'),
       ('f42ab', 6, '2023-02-18 14:20:35', '359899123456'),
       ('3b6f8', 3, '2023-06-07 21:30:59', '359899998765'),
       ('3b6f8', 2, '2022-10-05 16:50:11', '359888332233'),
       ('1f5e6', 1, '2022-10-05 16:55:54', '359888332233'),
       ('9d4c0', 3, '2022-10-05 16:55:54', '359888332233'),
       ('a5f2b', 4, '2022-11-15 17:25:19', '359898776655'),
       ('f42ab', 1, '2023-01-29 11:40:53', '359898776655'),
       ('6c5d3', 6, '2023-07-22 22:05:14', '359898776655'),
       ('2a8e9', 7, '2023-11-04 18:25:16', '359898776655'),
       ('b19f6', 4, '2023-06-21 15:55:48', '359876554433'),
       ('2a8e9', 5, '2023-03-07 20:10:59', '359876554433'),
       ('7e0d9', 5, '2022-10-29 12:30:05', '359888775544'),
       ('d58c2', 2, '2022-11-26 17:00:21', '359888775544'),
       ('1f5e6', 2, '2023-02-09 11:15:37', '359874333222'),
       ('9d4c0', 5, '2023-08-01 21:35:43', '359889993321'),
       ('a5f2b', 6, '2022-09-22 10:50:59', '359894443323');

INSERT INTO ADDEXTRATOPIZZA(PIZZA_ID, EXTRAS_NAME, ORDER, CLIENT_PHONE_NUM, EXTRA_QUANTITY)
VALUES ('08f68', 'Mozzarella', '2023-08-10 10:45:23', '35988892086', 3),
       ('d1b10', 'Onion', '2023-08-10 12:11:50', '35988892086', 2),
       ('14bce', 'Pepperoni', '2023-08-10 12:11:50', '35988892086', 6),
       ('7f53e', 'Ham', '2023-02-18 14:20:35', '359899123456', 4),
       ('9acfa', 'Chicken', '2023-02-18 14:20:35', '359899123456', 3),
       ('4e801', 'Sour Cream', '2023-06-07 21:30:59', '359899998765', 5),
       ('68b4f', 'Bourbon Sauce', '2022-10-05 16:50:11', '359888332233', 7),
       ('82de7', 'Cheddar', '2022-10-05 16:55:54', '359888332233', 5),
       ('0d85d', 'Barbecue Sauce', '2022-10-05 16:55:54', '359888332233', 3),
       ('5c48a', 'Peppers', '2022-11-15 17:25:19', '359898776655', 10),
       ('08f68', 'Tomato Sauce', '2023-01-29 11:40:53', '359898776655', 2),
       ('14bce', 'Chorizo', '2023-07-22 22:05:14', '359898776655', 3),
       ('d1b10', 'Olives', '2023-11-04 18:25:16', '359898776655', 6),
       ('7f53e', 'Pineapple', '2023-06-21 15:55:48', '359876554433', 4),
       ('9acfa', 'Mozzarella', '2023-03-07 20:10:59', '359876554433', 5),
       ('4e801', 'Mushrooms', '2022-10-29 12:30:05', '359888775544', 10),
       ('68b4f', 'Bacon', '2022-11-26 17:00:21', '359888775544', 6),
       ('82de7', 'Parmigiano', '2023-02-09 11:15:37', '359874333222', 4),
       ('0d85d', 'Burger Sauce', '2023-08-01 21:35:43', '359889993321', 5),
       ('5c48a', 'Onion', '2022-09-22 10:50:59', '359894443323', 6);


call sysproc.admin_cmd('reorg table FN2MI0700013.ORDER');