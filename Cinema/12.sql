WITH VC
     AS (SELECT AT.playedin_id, 
                C.cinema_id, 
                v.gender, 
                C.NAME, 
                V.first_name, 
                V.last_name 
         FROM   Viewer V, 
                Playedin PI, 
                Attended AT, 
                Cinema C 
         WHERE  V.viewer_id = AT.viewer_id 
                AND AT.playedin_id = PI.id 
                AND PI.cinema_id = C.cinema_id) 
SELECT Concat(T1.first_name, ' ', T1.last_name) AS man, 
       Concat(T2.first_name, ' ', T2.last_name) AS woman, 
       T1.playedin_id, 
       Count(*) 
FROM   VC T1 
       JOIN VC T2 
         ON T1.playedin_id = T2.playedin_id 
            AND T1.gender = 'male' 
            AND T2.gender = 'female' 
GROUP  BY man, 
          woman, 
          T1.playedin_id 
ORDER  BY man, 
          woman; 