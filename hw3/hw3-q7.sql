SELECT DISTINCT c.name as carrier
FROM Flights AS f, Carriers AS c
WHERE f.carrier_id = c.cid
AND f.origin_city = 'Seattle WA'
AND f.dest_city = 'San Francisco CA'
ORDER BY c.name ASC;

/*
4 rows returned
7s for query
First 20 rows:
carrier
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/