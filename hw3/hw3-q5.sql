SELECT DISTINCT f.dest_city AS city
FROM Flights AS f
WHERE f.dest_city NOT IN (SELECT DISTINCT f2.dest_city AS city
                        FROM flights AS f2, Flights AS f3
                        WHERE f2.origin_city = f3.dest_city
                        AND f3.origin_city = 'Seattle WA')
AND f.dest_city NOT IN (SELECT DISTINCT f1.dest_city AS city
                          FROM flights AS f1
                          WHERE f1.origin_city = 'Seattle WA')
ORDER BY f.dest_city ASC;

/*
3 rows returned
28s for query
first 20 rows:
city
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/