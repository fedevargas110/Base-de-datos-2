-- Exercises:
-- Create a user data_analyst
-- Grant permissions only to SELECT, UPDATE and DELETE to all sakila tables to it.
-- Login with this user and try to create a table. Show the result of that operation.
-- Try to update a title of a film. Write the update script.
-- With root or any admin user revoke the UPDATE permission. Write the command
-- Login again with data_analyst and try again the update done in step 4. Show the result.

-- 1
CREATE USER data_analyst@'%'
	IDENTIFIED BY 'password';

-- 2
GRANT SELECT, UPDATE, DELETE ON sakila.*
	TO data_analyst;
	
-- 3
USE sakila;
CREATE TABLE demo(
	name VARCHAR(255) NOT NULL
);
-- results: SQL Error [1142] [42000]: CREATE command denied to user 'data_analyst'@'172.18.0.1' for table 'demo'

-- 4 
UPDATE film
SET title='Pepe' WHERE title='ACE GOLDFINGER';

-- 5
REVOKE UPDATE ON sakila.* 
	FROM data_analyst@'%';

-- 6
-- results: SQL Error [1142] [42000]: UPDATE command denied to user 'data_analyst'@'172.18.0.1' for table 'film'
