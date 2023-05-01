
WITH hired_trips
     AS (SELECT Strftime('%Y-%m-%d %H', pickup_datetime) AS trip_date,
                distance
         FROM   taxi_trips
         WHERE  pickup_datetime BETWEEN "2012-10-22" AND "2012-11-07"
         UNION ALL
         SELECT Strftime('%Y-%m-%d %H', pickup_datetime),
                distance
         FROM   uber_trips
         WHERE  pickup_datetime BETWEEN "2012-10-22" AND "2012-11-07")
SELECT Strftime('%Y-%m-%d %H', weather_date),
       COALESCE(Count(trip_date), 0),
       precipitation,
       wind_speed
FROM   hourly_weather
       INNER JOIN hired_trips
               ON Strftime('%Y-%m-%d %H', weather_date) = trip_date
WHERE  Strftime('%Y-%m-%d %H', weather_date) BETWEEN "2012-10-22" AND "2012-11-07"
GROUP  BY Strftime('%Y-%m-%d %H', weather_date) 
