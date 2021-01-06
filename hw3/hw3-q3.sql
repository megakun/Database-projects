SELECT g1.origin_city AS city, ISNULL(ROUND(g2.ct / g1.ct * 100.0, 2), 0) AS percentage
FROM (SELECT f2.origin_city, CAST(COUNT(*) AS FLOAT) AS ct
      FROM Flights AS f2
      GROUP BY f2.origin_city) AS g1
      LEFT JOIN
     (SELECT f1.origin_city, CAST(COUNT(*) AS FLOAT) AS ct
      FROM Flights AS f1
      WHERE f1.actual_time < 180
      GROUP BY f1.origin_city) AS g2
      ON g1.origin_city = g2.origin_city
ORDER BY percentage, city asc;

/*
327 rows returned
10s for quety
first 20 rows:
city
percentage
Guam TT
0
Pago Pago TT
0
Aguadilla PR
29.43
Anchorage AK
32.15
San Juan PR
33.89
Charlotte Amalie VI
40
Ponce PR
41.94
Fairbanks AK
50.69
Kahului HI
53.66
Honolulu HI
54.91
San Francisco CA
56.31
Los Angeles CA
56.6
Seattle WA
57.76
Long Beach CA
62.45
Kona HI
63.28
New York NY
63.48
Las Vegas NV
65.16
Christiansted VI
65.33
Newark NJ
67.14
Worcester MA
67.74
*/