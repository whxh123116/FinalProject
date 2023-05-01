
SELECT Strftime("%H", pickup_datetime),
       Count(id)
FROM   taxi_trips
WHERE  pickup_datetime BETWEEN '2009-01-01' AND '2015-06-31'
GROUP  BY Strftime("%H", pickup_datetime)
ORDER  BY Count(id) DESC 
