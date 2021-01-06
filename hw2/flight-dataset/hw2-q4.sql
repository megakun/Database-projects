/*
Haokun Cai
hw2
1832787
*/

--12 rows of result
SELECT DISTINCT C.name as name
FROM Flights AS F, Carriers AS C
WHERE F.carrier_id = C.cid
GROUP BY C.name, F.day_of_month
HAVING COUNT(*) > 1000;