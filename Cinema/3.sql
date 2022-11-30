SELECT M.title 
FROM   Cinema C 
       JOIN Playedin P 
         ON C.cinema_id = P.cinema_id 
       JOIN Movie M 
         ON P.movie_id = M.movie_id 
WHERE  M.title IN (SELECT M.title 
                   FROM   Actor A 
                          JOIN Actedin AI 
                            ON A.actor_id = AI.actor_id 
                          JOIN Movie M 
                            ON AI.movie_id = M.movie_id 
                   WHERE  first_name = 'Leila' 
                          AND last_name = 'Hatami') 
       AND C.name = 'Ghods' 
ORDER  BY title; 