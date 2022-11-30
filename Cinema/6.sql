SELECT V.first_name, 
       V.last_name 
FROM   Viewer V, 
       Attended AT, 
       Playedin PI 
WHERE  V.viewer_id = AT.viewer_id 
       AND AT.playedin_id = PI.id 
       AND ticket_price = 20 
       AND Year(date) = '2000' 
ORDER  BY first_name, 
          last_name; 