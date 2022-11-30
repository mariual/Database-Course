SELECT Count(*) AS Total 
FROM   (SELECT A.actor_id, 
               Count(*) AS Num 
        FROM   Actor A, 
               Actedin AC 
        WHERE  A.actor_id = AC.actor_id 
        GROUP  BY A.actor_id 
        HAVING num > 1) AS Act_num; 