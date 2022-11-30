(SELECT M.title, 
        sold_table.sold_num 
 FROM   Movie AS M, 
        (SELECT movie_id, 
                Sum(count) AS sold_num 
         FROM   Playedin AS PI, 
                (SELECT playedin_id, 
                        Count(*) AS Count 
                 FROM   Attended 
                 GROUP  BY playedin_id) AS tmp 
         WHERE  tmp.playedin_id = PI.id 
         GROUP  BY movie_id) AS sold_table 
 WHERE  M.movie_id = sold_table.movie_id 
 ORDER  BY sold_num 
 LIMIT  1) 

UNION ALL

(SELECT M.title, 
        sold_table.sold_num 
 FROM   Movie AS M, 
        (SELECT movie_id, 
                Sum(count) AS sold_num 
         FROM   Playedin AS PI, 
                (SELECT playedin_id, 
                        Count(*) AS Count 
                 FROM   Attended 
                 GROUP  BY playedin_id) AS tmp 
         WHERE  tmp.playedin_id = PI.id 
         GROUP  BY movie_id) AS sold_table 
 WHERE  M.movie_id = sold_table.movie_id 
 ORDER  BY sold_num DESC 
 LIMIT  1); 