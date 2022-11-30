SELECT first_name, 
       last_name 
FROM   Actor A 
WHERE  EXISTS(SELECT * 
              FROM   Actedin AI, 
                     Movie M 
              WHERE  A.actor_id = AI.actor_id 
                     AND AI.movie_id = M.movie_id 
                     AND M.genre = 'comedy') 
ORDER  BY first_name, 
         last_name; 