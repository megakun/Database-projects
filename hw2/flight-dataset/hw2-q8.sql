/*
Haokun Cai
hw2
1832787
*/

--22 rows of result
SELECT C.name AS name, SUM(F.departure_delay) AS delay
FROM Flights AS F, Carriers AS C
WHERE F.carrier_id = C.cid 
GROUP BY C.name;