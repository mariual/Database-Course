WITH Viewer_num_table(cinema_id, movie_id, Viewer_num) 
     AS (SELECT cinema_id, 
                movie_id, 
                Count(viewer_id) AS Viewer_num 
         FROM   Playedin PI, 
                Attended AT 
         WHERE  AT.playedin_id = PI.id 
         GROUP  BY cinema_id, 
                   movie_id) 
SELECT C.name, 
       M.title, 
       viewer_num 
FROM   Viewer_num_table vnt, 
       Cinema C, 
       Movie M 
WHERE  viewer_num = (SELECT Max(viewer_num) 
                     FROM   Viewer_num_table) 
       AND vnt.cinema_id = C.cinema_id 
       AND vnt.movie_id = M.movie_id 
ORDER  BY M.title; 