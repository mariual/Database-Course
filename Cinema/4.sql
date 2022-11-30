SELECT first_name, 
       last_name 
FROM   Viewer 
WHERE  age IN (SELECT Max(age) 
               FROM   Viewer 
               WHERE  gender = 'male'); 