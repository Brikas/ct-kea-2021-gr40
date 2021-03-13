-- Create views.
-- Goes after create_tables.

CREATE VIEW `v_Courses` AS
SELECT Course.Name, Course.Length, Course.Difficulty, Category.Name 
FROM Course INNER JOIN Category
ON Course.Category_ID = Category.Category_ID
