SELECT V.gender, 
       Count(*) 
FROM   Viewer V, 
       Attended AT, 
       Playedin PI, 
       Movie M 
WHERE  V.viewer_id = AT.viewer_id 
       AND AT.playedin_id = PI.id 
       AND PI.movie_id = M.movie_id 
       AND M.title = 'Drive' 
GROUP  BY gender 
HAVING gender != 'other'; 