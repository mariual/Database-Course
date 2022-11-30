SELECT Max(ticket_price) AS Highest_price 
FROM   Cinema C, 
       Playedin PI 
WHERE  PI.cinema_id = C.cinema_id 
GROUP  BY name 
HAVING name = 'Esteghlal'; 