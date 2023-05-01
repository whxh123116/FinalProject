
WITH hired_trips AS
(
       SELECT Date(pickup_datetime) AS trip_date,
              distance
       FROM   taxi_trips
       WHERE  pickup_datetime BETWEEN "2014-01-01" AND    "2014-12-31"
       UNION ALL
       SELECT Date(pickup_datetime),
              distance
       FROM   uber_trips
       WHERE  pickup_datetime BETWEEN "2014-01-01" AND    "2014-12-31")
SELECT     Date(weather_date),
           wind_speed,
           Count(*)
FROM       daily_weather
INNER JOIN hired_trips
ON         Date(weather_date) = trip_date
WHERE      Date(weather_date) BETWEEN "2014-01-01" AND        "2014-12-31"
GROUP BY   Date(weather_date)
ORDER BY   wind_speed DESC limit 10
