SELECT DISTINCT( C.cinema_id ), 
               name 
FROM   Cinema C 
       JOIN Playedin PI 
         ON C.cinema_id = PI.cinema_id 
WHERE  ticket_price >= 30 
ORDER  BY name; 