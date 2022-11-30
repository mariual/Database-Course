/* MARYAM ALIPOUR 9612037 */

/* QUERY 1 */

CREATE TRIGGER insert_order_details
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET
        products.quantity_in_stock = products.quantity_in_stock - NEW.quantity_ordered
    WHERE products.id = NEW.product_id;
END;


CREATE TRIGGER delete_order_details
AFTER DELETE ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET
        products.quantity_in_stock = products.quantity_in_stock + OLD.quantity_ordered
    WHERE products.id = OLD.product_id;
END;


CREATE TRIGGER update_order_details
AFTER UPDATE ON order_details
FOR EACH ROW
BEGIN
        IF NEW.quantity_ordered > OLD.quantity_ordered THEN
            UPDATE products
                SET
                    products.quantity_in_stock = products.quantity_in_stock - (NEW.quantity_ordered - OLD.quantity_ordered)
            WHERE products.id = OLD.product_id;
        ELSEIF NEW.quantity_ordered < OLD.quantity_ordered THEN
            UPDATE products
                SET
                    products.quantity_in_stock = products.quantity_in_stock + (OLD.quantity_ordered - New.quantity_ordered)
            WHERE products.id = OLD.product_id;
        END IF;
END;


/* QUERY 2 */

CREATE VIEW view1 As
    SELECT T1.id, products.name, T1.quantity, T1.total_sell
    FROM  products,
         (SELECT P.id, SUM(quantity_ordered) quantity, SUM(quantity_ordered) * (P.sell_price - P.buy_price) total_sell
         FROM products P JOIN
             order_details OD on P.id = OD.product_id
         GROUP BY P.id) AS T1
    WHERE T1.id = products.id;


/* QUERY 3 */

SELECT *
FROM orders O LEFT JOIN payments P ON O.id = P.order_id
WHERE DATEDIFF(CURDATE(),DATE(order_date)) > 10
      AND P.id IS NULL;


/* QUERY 4 */

CREATE TRIGGER insert_payment
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    IF NEW.payment_type = 'cash' THEN
        UPDATE orders
            SET orders.shipped_date = NEW.payment_date
        WHERE orders.id = NEW.order_id AND orders.shipped_date IS NULL;
    END IF;
END;



/* QUERY 5 */

CREATE TRIGGER check_products
BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.quantity_in_stock = 1 THEN
        UPDATE products
            SET NEW.sell_price = ((0.8) * OLD.sell_price)
        WHERE products.id = OLD.id AND NEW.sell_price > OLD.buy_price;
    END IF;
end;


/* QUERY 6 */

SELECT C.id, MONTH(O.order_date) month, COUNT(*) order_num, c.name, c.phone, OD.product_id
FROM customers C, orders O, order_details OD
WHERE C.id = O.customer_id AND O.id = OD.order_id
GROUP BY C.id, MONTH(O.order_date), OD.product_id
HAVING order_num > 1


/* QUERY 7 */

SELECT p.category, SUM(OD.quantity_ordered) AS sold_num
FROM products P JOIN order_details OD on P.id = OD.product_id
     JOIN orders O ON OD.order_id = O.id
WHERE MONTH(CURDATE()) = MONTH(O.order_date)
GROUP BY category;

