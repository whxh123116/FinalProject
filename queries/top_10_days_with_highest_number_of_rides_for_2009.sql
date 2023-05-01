
WITH hired_trips AS
(
       SELECT pickup_datetime,
              distance
       FROM   taxi_trips
       WHERE  pickup_datetime BETWEEN "2009-01-01" AND    "2009-12-31"
       UNION ALL
       SELECT pickup_datetime,
              distance
       FROM   uber_trips
       WHERE  pickup_datetime BETWEEN "2009-01-01" AND    "2009-12-31")
SELECT   Date(pickup_datetime),
         Count(*) ,
         Avg(distance)
FROM     hired_trips
GROUP BY Date(pickup_datetime)
ORDER BY Count(*) DESC limit 10
