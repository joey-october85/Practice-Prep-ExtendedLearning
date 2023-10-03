-- https://datalemur.com/questions/matching-skills

-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. -- You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.
-- Assumption:
-- There are no duplicates in the candidates table.

SELECT candidate_id 
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY 1
HAVING COUNT(*) = 3;




-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

SELECT 
  tweets_num AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM (
  SELECT
    user_id, 
    COUNT(tweet_id) AS tweets_num
  FROM tweets
  WHERE tweet_date BETWEEN'2022-01-01' AND '2022-12-31'
  GROUP BY user_id) AS total_tweets
GROUP BY 1;

-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

SELECT p.page_id 
FROM pages p
LEFT JOIN page_likes l ON p.page_id = l.page_id
WHERE liked_date IS NULL
ORDER BY 1;

-- Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.
-- Assumptions:
-- parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
-- An unfinished part is one that lacks a finish_date.
-- This question is straightforward, so let's approach it with simplicity in both thinking and solution.
-- Effective April 11th 2023, the problem statement and assumptions were updated to enhance clarity.

SELECT part, assembly_step 
FROM parts_assembly
WHERE finish_date IS NULL;


-- This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
-- Effective 15 April 2023, the solution has been updated with a more concise and easy-to-understand approach.

SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet','phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;


-- Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.
-- p.s. If you've read the Ace the Data Science Interview and liked it, consider writing us a review?

SELECT user_id, 
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE
	DATE_PART('year',post_date::date)=2021 
GROUP BY 1
HAVING COUNT(user_id) >= 2;

-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.
-- Assumption:No two users have sent the same number of messages in August 2022.

SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE
  EXTRACT( MONTH FROM sent_date) = '8'
  AND EXTRACT( YEAR FROM sent_date) = '2022'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;



-- This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!
-- Assume you're given a table containing job postings from various companies on the LinkedIn platform. Write a query to retrieve the count of companies that have posted duplicate job listings.
-- Definition:Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

WITH job_count_cte AS (
  SELECT company_id, title, description, count(job_id) as job_count
  FROM job_listings
  GROUP BY company_id, title, description)
  
SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;