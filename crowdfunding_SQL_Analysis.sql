--Write a SQL query that retrieves the number of backer_counts in 
--descending order for each “cf_id” for all the "live" campaigns.
SELECT  cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

--Write a SQL query that uses the backers table to confirm the results from Step 2.
SELECT cf_id, COUNT(backer_id) as BI
FROM backers
GROUP BY cf_id
ORDER BY BI DESC;

-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT first_name, last_name, email, (goal - pledged) as "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts as co
	RIGHT JOIN campaign as cm
	ON (co.contact_id = cm.contact_id)
WHERE outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;

-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of
-- each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT email, first_name, last_name, bk.cf_id, company_name, description, end_date, (goal - pledged) as "Remaining Goal Amount"
INTO email_backers_remaining_goal_amount
FROM campaign as cp
	LEFT JOIN backers as bk
	ON (cp.cf_id = bk.cf_id)
WHERE outcome = 'live'
ORDER BY email DESC;