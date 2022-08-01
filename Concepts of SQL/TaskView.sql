CREATE VIEW Customer_Details AS
SELECT Cus.Customer_Name, Street_Address, Order_ID, Cus.customer_Id, ST.Shipping_Type, Date_Of_Purchase, SC.Shopping_Cart_ID
from (((CUSTOMER Cus
INNER JOIN ORDER_DETAILS OD on OD.Customer_ID = Cus.Customer_ID)
INNER JOIN SHIPPING_TYPE ST on ST.Shipping_Type = OD.Shipping_Type)
INNER JOIN SHOPPING_CART SC on SC.Shopping_Cart_ID = OD.Shopping_Cart_ID)