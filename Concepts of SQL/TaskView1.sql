--cusotmer name, customer ID, book ID, DOP and shopping card ID.

CREATE VIEW [customer's history of purchasing books] AS
SELECT Customer_Name, cu.customer_Id, Book_ID, Date_Of_Purchase, Shopping_Cart_ID
from CUSTOMER cu,BOOKS,ORDER_DETAILS