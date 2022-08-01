INSERT INTO AUTHOR (Author_ID, Author_Name) VALUES ('1', 'Jhonty Dodecha');
INSERT INTO AUTHOR (Author_ID, Author_Name) VALUES ('2', 'Yash Savaliya');

INSERT INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('1', 'Yash Savaliya');
INSERT INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES ('2', 'Jhonty Dodecha');

INSERT INTO BOOKS (Book_ID, Book_Name, Author_ID, price, Publisher_ID) VALUES (1, 'Concept Of SQL', '2' , 100, 1);
INSERT INTO BOOKS (Book_ID, Book_Name, Author_ID, price, Publisher_ID) VALUES (2, 'SQL Introduction', '2', 200, 1);

INSERT INTO CREDIT_CARD_DETAILS (Credit_Card_Numbar, Credit_Card_Type) VALUES ('1111 1111 1111 1111', 'Visa');
INSERT INTO CREDIT_CARD_DETAILS (Credit_Card_Numbar, Credit_Card_Type) VALUES ('2222 2222 2222 2222', 'Visa');

INSERT INTO CUSTOMER (customer_Id, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Numbar) VALUES ('1', 'Himanshu Ladva', 'Shaper','Rajkot', 5555555555, '1111 1111 1111 1111');
INSERT INTO CUSTOMER (customer_Id, Customer_Name, Street_Address, City, Phone_Number, Credit_Card_Numbar) VALUES ('2', 'Rutul Sorathiya', 'Navnit hall','Rajkot', 4444444444, '2222 2222 2222 2222');

INSERT INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Date, Quantity) VALUES (1, '2', 200, '2008-11-11', 2);
INSERT INTO SHOPPING_CART (Shopping_Cart_ID, Book_ID, Price, Date, Quantity) VALUES (2, '1', 100, '2008-11-11', 1);

INSERT INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('FULL TRUCKLOAD', 50);
INSERT INTO SHIPPING_TYPE (Shipping_Type, Shipping_Price) VALUES ('RAIL SERVICE SHIPPING', 30);

INSERT INTO ORDER_DETAILS (Order_ID, customer_Id, Shipping_Type, Date_Of_Purchase, Shopping_Cart_ID) VALUES (1, '1', 'FULL TRUCKLOAD', '2008-11-11', 1);
INSERT INTO ORDER_DETAILS (Order_ID, customer_Id, Shipping_Type, Date_Of_Purchase, Shopping_Cart_ID) VALUES (2, '2', 'RAIL SERVICE SHIPPING', '2008-11-11', 2);

INSERT INTO PURCHASE_HISTORY (customer_Id, Order_ID) VALUES ('1', 1);
INSERT INTO PURCHASE_HISTORY (customer_Id, Order_ID) VALUES ('2', 2);