SELECT DISTINCT first_name, 
                last_name 
FROM   Viewer V, 
       Attended AT, 
       Playedin PI 
WHERE  V.viewer_id = AT.viewer_id 
       AND AT.playedin_id = PI.id 
       AND Year(date) = '2010' 
ORDER  BY first_name, 
          last_name; 