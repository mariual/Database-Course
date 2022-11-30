SELECT viewer_id, 
       title 
FROM   (SELECT tmp.*, 
               Row_number() 
                 OVER ( 
                   partition BY viewer_id 
                   ORDER BY min_date ASC) AS row_num 
        FROM   (SELECT V.viewer_id, 
                       M.title, 
                       Min(date) AS min_date 
                FROM   Movie M, 
                       Viewer V, 
                       Attended AT, 
                       Playedin PI 
                WHERE  V.viewer_id = AT.viewer_id 
                       AND AT.playedin_id = PI.id 
                       AND PI.movie_id = M.movie_id 
                GROUP  BY V.viewer_id, 
                          M.title) tmp) AS ranks 
WHERE  row_num = 1
ORDER  BY title;