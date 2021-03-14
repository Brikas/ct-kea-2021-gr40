-- Code to insert data. Goes after DDL.
INSERT INTO `User`
(`User_ID`, `Name`)
VALUES
(1, 'Orion Beer'),
(2, 'Eugene Deckow'),
(3, 'Zelma Zboncak'),
(4, 'Prof. Theresa Leannon'),
(5, 'Jimmie Bashirian II'),
(6, 'Daphney Okuneva'),
(7, 'Prof. Stuart Eichmann Sr.'),
(8, 'Serenity Eichmann'),
(9, 'Jerad Hayes'),
(10, 'Johan Howe DDS'),
(11, 'Watson Littel I'),
(12, 'Gino Price'),
(13, 'Miss Joyce Cormier'),
(14, 'Kian West'),
(15, 'Ara Nicolas'),
(16, 'Ariel Grant'),
(17, 'Rogers Borer DVM'),
(18, 'Lessie Kulas'),
(19, 'Prof. Elinor Wuckert II'),
(20, 'Coralie Walker');


INSERT INTO `Payment`
(`Payment_ID`, `Date`, `Amount`, `User_ID`)
VALUES
(1, '1998-03-10 10:07:58', '10.00', 8),
(2, '2007-04-26 20:25:51', '10.00', 7),
(3, '1996-07-24 12:05:11', '10.00', 13),
(4, '2003-06-09 15:00:47', '10.00', 19),
(5, '1992-04-15 18:26:02', '10.00', 18),
(6, '2021-01-24 20:28:31', '10.00', 6);


INSERT INTO `Category`
(`Category_ID`, `Name`)
VALUES
(1, 'Graphical Design'),
(2, 'Programming'),
(3, 'Social Media'),
(4, 'Accounting'),
(5, 'Business');


INSERT INTO `Course`
(`Course_ID`, `Length`, `Name`, `Difficulty`, `Category_ID`)
VALUES
(1, '01:01:31', 'Business card design with Illustrator', 0, 1),
(2, '00:43:01', 'Video editing with After Effects', 4, 1),
(3, '03:50:09', 'Adobe Illustrator basics', 3, 1),
(4, '02:09:25', 'Ad material design with Photoshop', 1, 1),
(5, '10:01:33', 'Photoshop shortcuts for intermediate users', 5, 1),
(6, '04:37:04', 'Mobile Applications 101', 2, 2),
(7, '03:27:07', 'Android Application Security (Java)', 7, 2),
(8, '09:06:56', 'Developing cross-platform applications with Firebase', 3, 2),
(9, '09:49:35', 'Full guide on T-SQL', 8, 2),
(10, '05:42:33', 'Web application development with flask - basics', 3, 2),
(11, '00:09:44', 'Desktop application security - intermediate', 5, 2),
(12, '03:09:33', 'Campaign management for Instagram', 1, 3),
(13, '03:23:27', 'Advertising on Facebook', 0, 3),
(14, '02:18:06', 'Maximizing user inflow', 4, 3),
(15, '06:22:22', 'Growing a youtube audience', 4, 3),
(16, '01:20:42', 'Calculating profit and finding the break-even point', 8, 4),
(17, '03:05:18', 'Filing personal taxes', 7, 4),
(18, '09:47:28', 'Project management', 5, 5),
(19, '09:40:14', 'Negotiating as a freelancer', 0, 5),
(20, '04:31:31', 'Finding clients 101', 5, 5);


INSERT INTO `Curriculum`
(`Curriculum_ID`, `Name`)
VALUES
(1, 'Creating freelance business'),
(2, 'Business expansion'),
(3, 'Online presence management'),
(4, 'Full desktop application course'),
(5, 'How to be an Influenza');


INSERT INTO `Curriculum_Course`
(`Curriculum_ID`, `Course_ID`)
VALUES
(1, 20),
(1, 19),
(1, 18),
(1, 16),
(1, 17),
(2, 14),
(2, 15),
(3, 14),
(3, 13),
(3, 4),
(4, 8),
(4, 11),
(4, 9),
(5, 12),
(5, 4);


INSERT INTO `Quiz`
(`Quiz_ID`, `Name`, `Introduction`)
VALUES
(1, 'Preference', 'Hey! Let''s find out which course is right for you with this quiz!');


INSERT INTO `Question`
(`Question_ID`, `Text`, `Quiz_ID`)
VALUES
(1, 'How do you prefer to spend your time online?', 1),
(2, 'Which would you prefer to do in your free time?', 1),
(3, 'Choose what you like most', 1),
(4, 'Choose what you like most', 1);


INSERT INTO `Answer`
(`Answer_ID`, `Text`, `Points`, `Category_ID`, `Question_ID`)
VALUES
(1, 'Talking with friends', 3, 3, 1),
(2, 'Browsing social media', 5, 3, 1),
(3, 'Playing games', 4, 2, 1),
(4, 'Studying', 3, 2, 1),
(5, 'Watching movies', 2, 1, 1),

(6, 'Go to an art exhibition', 4, 1, 2),
(7, 'Spend time with friends out', 4, 3, 2),
(8, 'Paint', 5, 1, 2),
(9, 'Solve a puzzle', 3, 2, 2),
(10, 'Play sports', 2, 3, 2),

(11, '🐱', 2, 1, 3),
(12, '🦊', 5, 3, 3),
(13, '🐼', 1, 2, 3),
(14, '🦝', 3, 1, 3),

(15, '🐒', 4, 2, 4),
(16, '🐰', 3, 3, 4),
(17, '🐹', 1, 2, 4);


INSERT INTO `Enrollment`
VALUES
(1,13,18),
(3,19,100),
(6,3,47),
(8,18,37),
(11,16,55),
(12,12,27),
(14,7,8),
(14,12,67),
(14,15,65),
(15,6,98),
(15,13,65),
(16,16,76),
(17,4,11),
(20,11,6),
(20,12,1);


INSERT INTO `User_answer`
VALUES
(13,1),
(13,7),
(13,13),
(13,17),
(16,3),
(16,9),
(16,13),
(16,16),
(3,3),
(3,10),
(3,11),
(3,17),
(4,3),
(4,8),
(4,14),
(4,15),
(11,3),
(11,10),
(11,11),
(12,1);


INSERT INTO `Reason`
VALUES
(1,"This quiz sucks. Real waste of time 💩💩",13),
(2,"",16)

