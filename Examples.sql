-- ███████╗██╗░░██╗░█████╗░███╗░░░███╗██████╗░██╗░░░░░███████╗░██████╗
-- ██╔════╝╚██╗██╔╝██╔══██╗████╗░████║██╔══██╗██║░░░░░██╔════╝██╔════╝
-- █████╗░░░╚███╔╝░███████║██╔████╔██║██████╔╝██║░░░░░█████╗░░╚█████╗░
-- ██╔══╝░░░██╔██╗░██╔══██║██║╚██╔╝██║██╔═══╝░██║░░░░░██╔══╝░░░╚═══██╗
-- ███████╗██╔╝╚██╗██║░░██║██║░╚═╝░██║██║░░░░░███████╗███████╗██████╔╝
-- ╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝╚══════╝╚═════╝░



-- ███████╗██╗░░░██╗███╗░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗░█████╗░██╗░░░░░██╗████████╗██╗░░░██╗
-- ██╔════╝██║░░░██║████╗░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔══██╗██║░░░░░██║╚══██╔══╝╚██╗░██╔╝
-- █████╗░░██║░░░██║██╔██╗██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║███████║██║░░░░░██║░░░██║░░░░╚████╔╝░
-- ██╔══╝░░██║░░░██║██║╚████║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║██╔══██║██║░░░░░██║░░░██║░░░░░╚██╔╝░░
-- ██║░░░░░╚██████╔╝██║░╚███║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██║░░██║███████╗██║░░░██║░░░░░░██║░░░
-- ╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═╝░░╚═╝╚══════╝╚═╝░░░╚═╝░░░░░░╚═╝░░░


-- Scenario: 
-- Open course page to see all courses offered
--
-- Code:
SELECT * FROM v_Course


-- Scenario: 
-- Recomend the user higher difficulty courses from the same category (used after the user finishes a course)
--
-- Code:
SELECT * FROM Course
WHERE
Category_ID IN (
	SELECT Category_ID FROM Course
	WHERE Course_ID = 6
)
AND
Difficulty BETWEEN (
	SELECT Difficulty+1 FROM Course
	WHERE Course_ID = 6
) AND (
	SELECT Difficulty+4 FROM Course
	WHERE Course_ID = 6
)
ORDER BY Difficulty ASC


-- Scenario: 
-- Show suggested courses to user with Id 16 based on their quiz result so far
--
-- Code:
SELECT * FROM Course
WHERE Course.Category_ID IN
(
	SELECT Category FROM
	(
		SELECT Category, MAX(TotalPoints) FROM
		(
			SELECT User.Name, Category.Category_ID AS 'Category' , SUM(Answer.Points) as TotalPoints
			FROM User
			INNER JOIN User_answer ON User.User_ID = User_answer.User_ID
			INNER JOIN Answer ON Answer.Answer_ID = User_answer.Answer_ID
			INNER JOIN Category ON Category.Category_ID = Answer.Category_ID

			WHERE User.User_ID = 16
			GROUP BY Category.Name
		) T
	) T
) AND Difficulty <= 3



-- ██████╗░███████╗░██████╗░██████╗░███████╗░██████╗░██████╗██╗░█████╗░███╗░░██╗
-- ██╔══██╗██╔════╝██╔════╝░██╔══██╗██╔════╝██╔════╝██╔════╝██║██╔══██╗████╗░██║
-- ██████╔╝█████╗░░██║░░██╗░██████╔╝█████╗░░╚█████╗░╚█████╗░██║██║░░██║██╔██╗██║
-- ██╔══██╗██╔══╝░░██║░░╚██╗██╔══██╗██╔══╝░░░╚═══██╗░╚═══██╗██║██║░░██║██║╚████║
-- ██║░░██║███████╗╚██████╔╝██║░░██║███████╗██████╔╝██████╔╝██║╚█████╔╝██║░╚███║
-- ╚═╝░░╚═╝╚══════╝░╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░╚═════╝░╚═╝░╚════╝░╚═╝░░╚══╝

-- Scenario: 
-- Remove any trace of the quiz solution
--
-- Code:
drop table if exists User_answer;
drop table if exists Answer;
drop table if exists Question;
drop table if exists Quiz;
drop table if exists Reason;
