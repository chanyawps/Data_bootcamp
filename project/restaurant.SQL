.open restaurant.db
.mode column
.header on
 
---------------------------------------- Table 1
DROP TABLE menus;
CREATE TABLE IF NOT EXISTS menus (
  menu_id INT,
  menu_name TEXT,
  menu_price INT,
  core_ingredient TEXT
);

INSERT INTO menus VALUES
 (1, 'Kimchi', 250, 'vegetable'),
 (2, 'Bibimbap', 160, 'vegetable'),
 (3, 'teokbokki', 200, 'rice cake'),
 (4, 'Bulgogi', 300, 'meat'),
 (5, 'jjigae', 200, 'meat'),
 (6, 'Jajangmyeon', 180, 'wheat noodles'),
 (7, 'Samgyeopsal', 400, 'meat'),
 (8, 'Korean fried chicken', 280, 'meat'),
 (9, 'bibim nengmyun', 150, 'sweet potatoes'),
 (10, 'samgyetang', 350, 'meat');
 
select * from menus;

---------------------------------------- Table 2
DROP TABLE customers;
CREATE TABLE IF NOT EXISTS customers (
  customer_ID INT,
  menu_ID INT,
  customer_name TEXT,
  menu_name TEXT 
);

insert into customers values
 (01, 1, 'Rosie', 'Kimchi'),
 (02, 4, 'Thomas', 'Bulgogi'),
 (03, 7, 'David', 'Samgyeopsal'),
 (04, 3, 'Mark', 'teokbokki'),
 (05, 9, 'Kevin', 'bibim nengmyun'),
 (06, 10 , 'Gary', 'Jajangmyeon'),
 (07, 5, 'Eric', 'jjigae');
 
select * from customers;

---------------------------------------- Table 3
DROP TABLE orders;
CREATE TABLE IF NOT EXISTS orders (
  order_ID INT,
  customer_ID INT,
  customer_name TEXT,
  order_price REAL  
);

insert into orders values
 (1, 01, 'Rosie', 450),
 (2, 02, 'Thomas', 550),
 (3, 03, 'David', 680),
 (4, 04, 'Mark', 360),
 (5, 05, 'Kevin', 430),
 (6, 06, 'Gary', 350),
 (7, 07, 'Eric', 480);
 
select * from orders;

---------------------------------------- Table 4
DROP TABLE dessert;
CREATE TABLE IF NOT EXISTS dessert (
  dessert_ID INT,
  order_ID INT,
  dessert_name TEXT
);

insert into dessert values
 (1, 3, 'SONGPYEON'),
 (2, 4, 'BUKKUMI'),
 (3, 6, 'DASIK'),
 (4, 8, 'BUNGEOPPANG'),
 (5, 9, 'HOTTEOK');
 
 select * from dessert;

---------------------------------------- Table 5
DROP TABLE recommend;
CREATE TABLE IF NOT EXISTS recommend (
  recommend_ID INT,
  menu_ID INT,
  menu_name TEXT,
  rating NUMERIC,
  rating_date DATE
);

insert into recommend values
 (1, 1, 'Kimchi', 7.5, '2022-10-22'),
 (2, 2, 'Bibimbap', 8.0, '2022-10-28'),
 (3, 3, 'teokbokki', 9.5, '2022-11-05'),
 (4, 4, 'Bulgogi',7.2, '2022-11-20'),
 (5, 5, 'jjigae', 8.4, '2022-11-30'),
 (6, 6, 'Jajangmyeon', 7.0, '2022-12-25'),
 (7, 7, 'Samgyeopsal', 10.0, '2023-01-02'),
 (8, 8, 'Korean fried chicken', 9.2, '2023-01-09'),
 (9, 9, 'bibim nengmyun', 6.8, '2023-01-15'),
 (10, 10, 'samgyetang', 8.7, '2023-02-24');
 
 select * from recommend;

----------------------------------------
SELECT
   M.menu_id         AS ID,
   M.menu_name       AS MENU,
   M.menu_price      AS menuPRICE,
   M.core_ingredient AS INGREDIENT,
   C.customer_id     AS cusID,
   C.menu_ID         AS menuID,
   C.customer_name   AS NAME,
   C.menu_name       AS Cus_order,
   O.order_price     AS PRICE,
   D.order_ID        AS orderID,
   D.dessert_name    AS DessertName,
   R.rating          AS Rate,
   R.rating_date     AS Date
   
FROM menus AS M
LEFT JOIN customers AS C ON M.menu_id = C.menu_ID
LEFT JOIN orders    AS O ON C.customer_ID = O.customer_ID
LEFT JOIN dessert   AS D ON O.order_id = D.order_ID
LEFT JOIN recommend AS R ON M.menu_id = R.menu_ID
  
---------------------------------------- 
SELECT
  rating,
  ROUND(AVG(rating),1) AS avg_rating, 
  ROUND(SUM(rating),1) AS sum_rating,
  MIN(rating) AS min_rating,
  MAX(rating) AS max_rating
FROM recommend;

---------------------------------------- 
SELECT
  rating_date,
  CAST(STRFTIME("%Y", rating_date) AS INT) AS year,
  CAST(STRFTIME("%m", rating_date) AS INT) AS month,
  CAST(STRFTIME("%d", rating_date) AS INT) AS day,
  STRFTIME("%Y-%m", rating_date) AS monthID
FROM recommend
WHERE monthID = "2023-01"; -- or year = 2023 AND month =1

----------------------------------------  
SELECT
  M.menu_id    AS ID,
  M.menu_price AS PRICE,
  M.core_ingredient AS Ingredient,
  R.rating     AS RATE
FROM menus AS M
JOIN recommend AS R ON M.menu_id = R.menu_ID
WHERE Ingredient = 'meat'
ORDER BY rating DESC

----------------------------------------
WITH restaurant AS (
SELECT
  C.customer_name   AS Name,
  M.menu_name       AS menuName,
  M.menu_id         AS ID,
  M.menu_price      AS PRICE,
  M.core_ingredient AS Ingredient,
  R.rating          AS RATE
FROM menus AS M
JOIN recommend AS R ON M.menu_id = R.menu_ID
JOIN customers AS C ON M.menu_id = C.menu_id
)

SELECT Name, menuName, Ingredient, RATE, PRICE 
FROM restaurant
WHERE RATE >= '7.5'
ORDER BY RATE DESC
