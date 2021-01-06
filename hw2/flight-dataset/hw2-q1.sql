/*
Haokun Cai
hw2
1832787
*/

-- has 3 rows for output
SELECT DISTINCT F.flight_num AS flight_num
FROM Flights AS F, Carriers AS C, Weekdays AS W
WHERE W.day_of_week = "Monday" 
AND W.did = F.day_of_week_id
AND C.cid = F.carrier_id
AND C.name = "Alaska Airlines Inc."
AND F.origin_city = "Seattle WA"
AND F.dest_city = "Boston MA";