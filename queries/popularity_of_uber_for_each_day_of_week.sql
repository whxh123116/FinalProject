
SELECT Strftime("%w", pickup_datetime),
       Count(id)
FROM   uber_trips
WHERE  pickup_datetime BETWEEN '2009-01-01' AND '2015-06-31'
GROUP  BY Strftime("%w", pickup_datetime)
ORDER  BY Count(id) DESC 
