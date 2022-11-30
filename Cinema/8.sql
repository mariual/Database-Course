SELECT Count(*) AS Sold_tickets 
FROM   Viewer V, 
       Attended AT, 
       Playedin PI, 
       Cinema C 
WHERE  V.viewer_id = AT.viewer_id 
       AND AT.playedin_id = PI.id 
       AND PI.cinema_id = C.cinema_id 
       AND C.name = 'Ghods'; 