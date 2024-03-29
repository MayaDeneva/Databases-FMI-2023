SET SCHEMA FN2MI0700013;

--After a product changes it's price, all pizzas containing this product change their price accordingly.
ALTER MODULE PROJ PUBLISH PROCEDURE P_PIZZAS_WITH_PRODUCT_NEW_PRICE(IN V_PRODUCT VARCHAR(30), IN NEW_PRICE DECIMAL(9,2));
ALTER MODULE PROJ ADD PROCEDURE P_PIZZAS_WITH_PRODUCT_NEW_PRICE(IN V_PRODUCT VARCHAR(30), IN NEW_PRICE DECIMAL(9,2))
BEGIN

    DECLARE AT_END INTEGER DEFAULT 0;
    DECLARE R_ERROR int default 0;
    DECLARE SQLCODE INT DEFAULT 0;
    DECLARE V_CURR_PIZZA CHAR(5);
    DECLARE NOT_FOUND CONDITION FOR SQLSTATE '02000';
    DECLARE C CURSOR FOR SELECT PIZZAID FROM PIZZACONTENTS WHERE PRODUCT_NAME = V_PRODUCT;

    DECLARE CONTINUE HANDLER FOR NOT_FOUND
        SET AT_END = 1;

    DECLARE CONTINUE HANDLER FOR SQLWARNING, SQLEXCEPTION, NOT FOUND
        BEGIN
            SET R_ERROR = SQLCODE;
            CALL DBMS_OUTPUT.PUT_LINE('ERROR OCCURS: ' || R_ERROR);
        END;

    OPEN C;
     L1:
    LOOP
        FETCH C INTO V_CURR_PIZZA;
        IF AT_END = 1 THEN
            LEAVE L1;
        END IF;
        IF AT_END = 0 THEN

            UPDATE PIZZA
                SET PRICE = PRICE + NEW_PRICE
                WHERE PIZZA_ID = V_CURR_PIZZA;

        END IF;
    END LOOP L1;
    CLOSE C;
end;


--Trigger 1 which after updated price of product updates the price of all pizzas containing it
-- accordingly
CREATE OR REPLACE TRIGGER TRIG_AFTER_UPD_PROD
AFTER UPDATE ON PRODUCTS
REFERENCING OLD AS O NEW AS N
FOR EACH ROW
BEGIN
    CALL FN2MI0700013.PROJ.P_PIZZAS_WITH_PRODUCT_NEW_PRICE(O.NAME, N.PRICE-O.PRICE);
END;

--Pizzas with ham
SELECT NAME, PRICE FROM PIZZA, PIZZACONTENTS
WHERE PIZZAID = PIZZA.PIZZA_ID
AND PRODUCT_NAME = 'Ham';

SELECT * FROM PRODUCTS WHERE NAME = 'Ham';
UPDATE PRODUCTS
SET PRICE = PRICE + 0.5
WHERE NAME = 'Ham';

--Pizzas changes price
SELECT NAME, PRICE FROM PIZZA, PIZZACONTENTS
WHERE PIZZAID = PIZZA.PIZZA_ID
AND PRODUCT_NAME = 'Ham';
--Ham has new price
SELECT * FROM PRODUCTS WHERE NAME = 'Ham';


--Trigger 2, after deletion of drink, saves it to a table for deleted drinks with date of deletion
CREATE TABLE DRINKS_DEL
AS (SELECT DRINK_ID, NAME, PRICE, QUANTITY, CURRENT_TIMESTAMP AS DELDATE FROM DRINKS)
DEFINITION ONLY;
CREATE OR REPLACE TRIGGER TRIG_AFTER_DEL_DRINK
    AFTER DELETE ON DRINKS
    REFERENCING OLD AS O
    FOR EACH ROW
    BEGIN
        -- Delete from dependent table
    DELETE FROM ADDDRINKTOORDER WHERE ADDDRINKTOORDER.DRINK_ID = O.DRINK_ID;
    INSERT INTO DRINKS_DEL (DRINK_ID, NAME, PRICE, QUANTITY, DELDATE)
    VALUES (O.DRINK_ID, O.NAME, O.PRICE, O.QUANTITY, CURRENT_TIMESTAMP );
    end;

--Testing
SELECT * FROM DRINKS;

DELETE FROM DRINKS
    WHERE DRINK_ID = '9d4c0';

SELECT * FROM DRINKS_DEL;

--Return deleted
INSERT INTO DRINKS SELECT DISTINCT DRINK_ID,NAME,PRICE,QUANTITY FROM DRINKS_DEL;

