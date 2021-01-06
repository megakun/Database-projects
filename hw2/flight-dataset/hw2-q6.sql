/*
Haokun Cai
hw2
1832787
*/

--3 rows of result
SELECT C.name AS carrier, MAX(F.price) AS max_price
FROM Flights AS F, Carriers as C
WHERE F.carrier_id = C.cid
AND ((F.origin_city = "Seattle WA" AND F.dest_city = "New York NY")
OR (F.origin_city = "New York NY" AND F.dest_city = "Seattle WA"))
GROUP BY C.name;