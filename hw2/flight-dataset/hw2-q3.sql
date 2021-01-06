/*
Haokun Cai
hw2
1832787
*/

--1 row of result
SELECT W.day_of_week AS day_of_week,
            AVG(F.arrival_delay) AS delay
FROM Flights AS F, Weekdays AS W
WHERE F.day_of_week_id = W.did
GROUP BY w.did
ORDER BY arrival_delay DESC
LIMIT 1;