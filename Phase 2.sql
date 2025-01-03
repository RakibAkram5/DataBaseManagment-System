use Online_Store_Management_system;
-- Adding a new column to the Product table
ALTER TABLE Product ADD COLUMN discount_percentage DECIMAL(5, 2) DEFAULT 0.00;
-- Updating the address of customer with customer_id 1
UPDATE Customer 
SET address = '789 New Street, Lahore, Pakistan' 
WHERE customer_id = 1;
-- Product Table
UPDATE Product 
SET price = 40000.00 
WHERE product_id = 1;
-- Category
UPDATE Category 
SET name = 'Electronics & Appliances' 
WHERE category_id = 1;
-- Supplier
UPDATE Supplier 
SET contact_info = '03034456789' 
WHERE supplier_id = 1;
-- Order
UPDATE `Order` 
SET status = 'Shipped', total_amount = 50000.00 
WHERE order_id = 1;
-- Order Item
UPDATE Order_Item 
SET quantity = 3 
WHERE order_item_id = 1;
-- Payment
UPDATE Payment 
SET payment_status = 'Completed', amount = 50000.00 
WHERE payment_id = 1;
-- Inventory
UPDATE Inventory 
SET quantity = 120 
WHERE product_id = 1;
-- Shipment
UPDATE Shipment 
SET status = 'Delivered' 
WHERE shipment_id = 1;
-- Review 
UPDATE Review 
SET rating = 4, review_text = 'Good product, but could be improved' 
WHERE review_id = 1;
-- User 
UPDATE User 
SET role = 'Staff' 
WHERE user_id = 1;
-- 									Delete Records. 
DELETE FROM Customer 
WHERE customer_id = 1;
DELETE FROM Product 
WHERE product_id = 1;
DELETE FROM Category 
WHERE category_id = 1;
DELETE FROM Supplier 
WHERE supplier_id = 1;
DELETE FROM Supplier 
WHERE supplier_id = 1;
DELETE FROM `Order` 
WHERE order_id = 1;
DELETE FROM Order_Item 
WHERE order_item_id = 1;
DELETE FROM Payment 
WHERE payment_id = 1;
DELETE FROM Inventory 
WHERE product_id = 1;
DELETE FROM Shipment 
WHERE shipment_id = 1;
DELETE FROM Review 
WHERE review_id = 1;
DELETE FROM Review 
WHERE review_id = 1;
DELETE FROM User 
WHERE user_id = 1;
--                     Drop Table 
-- Dropping all tables in the database
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Shipment;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Order_Item;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS User;

