SELECT DISTINCT f.origin_city AS city
FROM flights AS f
WHERE f.origin_city NOT IN (SELECT DISTINCT f1.origin_city AS city
                            FROM flights AS f1
                            WHERE f1.actual_time >= 180 OR
                                  f1.actual_time = NULL)
order by f.origin_city ASC

/*
109 rows return
12s for query
first 20 rows
city
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
Columbus MS
*/