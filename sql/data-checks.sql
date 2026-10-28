-- BiteByte - SQL data checks used during manual testing
-- Run in phpMyAdmin (database: bitebyte). Replace the values in quotes with your test data.
-- Each query is referenced from a test case as "SQL check Qn".

-- Q1 (SU-01, SU-17): new user was created and the password is hashed
-- Expected: 1 row; Pass starts with '$2y$'; RegDate = time of registration
SELECT UsersID, Username, Email, LEFT(Pass, 4) AS hash_prefix, LENGTH(Pass) AS hash_length, RegDate
FROM users
WHERE Email = 'qa.tester1@test.com';

-- Q2 (SU-13, SU-14): no duplicate emails or usernames exist
-- Expected: 0 rows
SELECT Email, COUNT(*) AS accounts FROM users GROUP BY Email HAVING COUNT(*) > 1;
SELECT Username, COUNT(*) AS accounts FROM users GROUP BY Username HAVING COUNT(*) > 1;

-- Q3 (SR-01): submitted recipe saved with the correct author, values, categories and tags
-- Expected: values match what was entered; UsersID = the logged-in tester
SELECT r.RecipesID, r.Title, r.TimeNeeded, r.Difficulty, r.PotsNum, r.ImageURL, u.Username AS author
FROM recipes r
LEFT JOIN users u ON u.UsersID = r.UsersID
WHERE r.Title = 'QA Test Pancakes';

SELECT c.Name AS category
FROM recipescat rc JOIN categories c ON c.CategoriesID = rc.CategoriesID
WHERE rc.RecipesID = /* RecipesID from above */ 0;

SELECT t.Name AS tag
FROM recipestag rt JOIN tags t ON t.TagsID = rt.TagsID
WHERE rt.RecipesID = /* RecipesID from above */ 0;

-- Q4 (ED-04): edited recipe has the new values and only the new categories
-- Expected: new title/time; removed category no longer listed
SELECT RecipesID, Title, TimeNeeded FROM recipes WHERE RecipesID = /* id */ 0;
SELECT CategoriesID FROM recipescat WHERE RecipesID = /* id */ 0;

-- Q5 (ED-06): deleted recipe left no orphan rows behind
-- Expected: 0 rows in every query
SELECT * FROM recipes    WHERE RecipesID = /* deleted id */ 0;
SELECT * FROM recipescat WHERE RecipesID NOT IN (SELECT RecipesID FROM recipes);
SELECT * FROM recipestag WHERE RecipesID NOT IN (SELECT RecipesID FROM recipes);

-- Q6 (SP-01): support request was saved
-- Expected: 1 new row with Status = 'Open'
SELECT SupportID, Type, Name, Email, Subject, Status, SubmitTime
FROM support
ORDER BY SubmitTime DESC
LIMIT 5;

-- Q7 (general): recipes whose author no longer exists or is missing
-- Expected: 0 rows
SELECT RecipesID, Title, UsersID FROM recipes
WHERE UsersID IS NULL OR UsersID NOT IN (SELECT UsersID FROM users);

-- Cleanup after testing (optional): remove test accounts and their recipes
-- DELETE FROM users WHERE Email LIKE '%@test.com';
