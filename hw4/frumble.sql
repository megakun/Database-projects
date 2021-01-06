--part 4
--4,1
CREATE TABLE Sales (
name varchar(256),
discount int,
month varchar(10),
price int
);

--4.2
--name -> price
SELECT * FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name AND S1.price != S2.price;
--stand

--name -> discount
SELECT * FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name AND S1.discount != S2.discount;
--does not stand

--month -> discount 
SELECT * FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month AND S1.discount != S2.discount;
-- stand

--hence 
--name, month -> price, discount

--name, price -> discount, month
SELECT * FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name AND S1.price = S2.price
AND S1.month != S2.month AND S1.discount != S2.discount;
--does not stand

-- name, discount -> price, month
SELECT * FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name AND S1.discount = S2.discount
AND S1.month != S2.month AND S1.price != S2.price;
--stand

-- month, price -> name, discount
SELECT * FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month AND S1.price = S2.price
AND S1.discount != S2.discount AND S1.name != S2.name;
--stand

-- FDs:
-- name -> price
-- month -> discount
-- name, month -> price, discount
-- name, discount -> price, month
-- month, price -> discount, name

--4.3
-- BCNF is S1{name,price}, S21{month,discount} and S22 {month, name}

CREATE TABLE namePrice (
    name varchar(128) PRIMARY KEY,
    price int
);

CREATE TABLE monthDiscount (
    month varchar(10)  PRIMARY KEY,
    discount int
);

CREATE TABLE monthName (
    name varchar(128) REFERENCES namePrice,
    month varchar(10) REFERENCES monthDiscount
);


--4.4
INSERT INTO namePrice
SELECT DISTINCT name, price FROM Sales;
--37 rows

INSERT INTO monthDiscount
SELECT DISTINCT month, discount FROM Sales;
--13 rows

INSERT INTO monthName
SELECT DISTINCT name, month FROM Sales;
--427 rows same as sales 