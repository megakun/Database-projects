/*
Haokun Cai
hw2
1832787
*/

--6 rows of result
SELECT C.name AS name, AVG(F.canceled) AS percentage
FROM Flights AS F,  Carriers AS C 
WHERE C.cid = F.carrier_id
AND F.origin_city = 'Seattle WA'
GROUP BY c.name
HAVING percentage > 0.005
ORDER BY percentage ASC;