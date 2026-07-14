/*=========================================================
SECTION 1 : DATABASE VALIDATION
=========================================================*/

-- Query 1
SELECT *
FROM students;

-- Query 2
SELECT Student_name, Branch, CGPA
FROM students;

-- Query 3
SELECT DISTINCT(Branch)
FROM students;

-- Query 4
SELECT *  FROM students
ORDER BY CGPA DESC;

-- Query 5
SELECT *  FROM students
ORDER BY CGPA DESC LIMIT 5;

-- Query 6
SELECT * FROM students
WHERE CGPA = (
    SELECT MIN(CGPA)
    FROM students
);

-- Query 7
SELECT COUNT(*) AS Total_Students
FROM students;

-- Query 8
SELECT MAX(CGPA) AS Highest_CGPA,
MIN(CGPA) AS Lowest_CGPA 
FROM students;

-- QUERY 9
SELECT ROUND(AVG(CGPA), 2) AS AVERAGE_CGPA 
FROM students;

-- Query 10
SELECT COUNT(DISTINCT Branch) AS Total_Branches
FROM students;

/*=========================================================
SECTION 2 : STUDENT ANALYTICS
=========================================================*/

-- Query 11
SELECT * FROM students
WHERE CGPA > 8.5;

-- Query 12
SELECT Student_name, CGPA
FROM students
WHERE CGPA BETWEEN 8.0 AND 9.0;

-- Query  13
SELECT Student_name , Branch 
FROM students
WHERE BRANCH IN ('IT', 'CSE');

-- Query 14
SELECT Student_name,Branch from students
WHERE Student_name LIKE 'A%';

-- Query 15
SELECT Student_name,Branch,CGPA FROM students
where CGPA > 8.5 AND BRANCH IN ('CSE') ;

-- Query 16
SELECT Student_name,Branch,CGPA FROM students
where CGPA > 9.0 OR BRANCH IN ('CSE') ;

-- QUERY 17
SELECT Student_name, Branch
FROM students
WHERE Branch NOT IN ('CSE');

-- Query 18
SELECT Student_name , Branch from students
WHERE Student_name Like '%a';

-- Query 19
SELECT Student_name , Branch from students
WHERE Student_name Like '%a%';

-- Query 20
SELECT Student_name , Branch,CGPA from students
WHERE CGPA  >= 9.0 AND Branch IN ('CSE','IT');

-- Query 21
SELECT Student_name , Branch,CGPA from students
WHERE CGPA  BETWEEN 8.0 AND 9.0 AND Branch NOT IN ('CSE');

-- Query 22
SELECT Branch , COUNT(*) AS Total_Students
FROM students GROUP BY Branch;

-- Query 23
SELECT Branch , ROUND(AVG(CGPA),2) AS Average_CGPA
from students GROUP BY Branch;

-- Query 24
SELECT Branch , ROUND(AVG(CGPA),2) AS Average_CGPA
FROM students
GROUP BY Branch ORDER BY Average_CGPA DESC LIMIT 1;

-- Query 25
SELECT Branch, ROUND(AVG(CGPA),2) AS Average_CGPA
FROM students GROUP BY Branch HAVING Average_CGPA > 8.5;

-- Query 26
SELECT Branch,COUNT(*) AS Total_Students FROM students
GROUP BY Branch HAVING COUNT(*) > 8;

-- Query 27
SELECT Branch, ROUND(AVG(CGPA),2) AS Average_CGPA, COUNT(*)
 AS Total_Students FROM students
GROUP BY Branch HAVING COUNT(*) > 8 AND Average_CGPA > 8.5;

-- Query 28
SELECT Branch , COUNT(*) AS Total_Students
FROM students
GROUP BY Branch ORDER BY Total_Students DESC LIMIT 1;

-- Query 29
SELECT Branch , ROUND(AVG(CGPA),2) AS AVG_CGPA
FROM students
GROUP BY Branch ORDER BY AVG_CGPA ASC LIMIT 1;

-- Query 30
SELECT Branch , ROUND(AVG(CGPA),2) AS AVG_CGPA
FROM students
GROUP BY Branch HAVING AVG_CGPA BETWEEN 8.0 AND 9.0;

-- Query 31
SELECT Student_id , Student_name,Branch,CGPA 
FROM students ORDER BY CGPA DESC LIMIT 5;

-- Query 32
SELECT Student_id , Student_name,Branch,CGPA 
FROM students ORDER BY CGPA ASC LIMIT 5;

-- Query 33
SELECT Student_id,Student_name,Branch,CGPA
FROM students
WHERE CGPA > (SELECT AVG(CGPA) FROM students);

-- Query 34
SELECT Student_id,Student_name,Branch,CGPA
FROM students
WHERE CGPA <(SELECT AVG(CGPA) FROM students);

-- Query 35
SELECT Student_id,Student_name,Branch,CGPA
FROM students
WHERE CGPA >=  8.0 ORDER BY CGPA DESC;

-- Query 36
SELECT Student_id,Student_name,Branch,CGPA
FROM students
WHERE CGPA < 8.0 ORDER BY CGPA ;

-- Query 37
SELECT Student_id,Student_name,Branch,CGPA
FROM students
WHERE CGPA =  (SELECT MAX(CGPA) FROM students);

-- Query 38
SELECT Student_id,Student_name,Branch,CGPA
FROM students
WHERE CGPA =  (SELECT MIN(CGPA) FROM students);

-- Query 39
SELECT Student_id,Student_name,Branch,CGPA
FROM students s
WHERE CGPA = ( SELECT MAX(CGPA) FROM students 
WHERE Branch = s.Branch);

-- Query 40
SELECT Student_id,Student_name,Branch,CGPA
FROM students s
WHERE CGPA = (SELECT MIN(CGPA) FROM students WHERE Branch = s.Branch);

-- Query 41
SELECT Branch,COUNT(*) AS Total_Students, 
ROUND(MAX(CGPA),2) AS Highest_CGPA, ROUND(MIN(CGPA),2)
 AS Lowest_CGPA, ROUND(AVG(CGPA),2) AS Average_CGPA 
 FROM students
 GROUP BY BRANCH ORDER BY Average_CGPA DESC;
 
 -- Query 42
 SELECT Branch,COUNT(*) AS Total_Students,ROUND(AVG(CGPA),2)
 AS AVG_CGPA FROM students
 GROUP BY BRANCH HAVING AVG_CGPA < 8.0;

-- Query 43
SELECT COUNT(*) AS Eligible_Students 
FROM students
WHERE CGPA >= 9.0;

-- Query 44
SELECT Branch,COUNT(*) AS Eligible_Students
FROM students
WHERE CGPA >= 8.0 GROUP BY Branch
ORDER BY Eligible_Students DESC;

-- Query 45
SELECT Branch,ROUND(MIN(CGPA), 2) AS Lowest_CGPA
FROM students
GROUP BY Branch
HAVING Lowest_CGPA >= 8.0;

-- Query 46
SELECT Branch,ROUND(MAX(CGPA), 2) AS Highest_CGPA
FROM students
GROUP BY  Branch HAVING Highest_CGPA >= 9.5 ORDER BY Highest_CGPA  DESC;

-- Query 47
SELECT Branch,ROUND(AVG(CGPA), 2) AS AVG_CGPA,COUNT(*) AS Total_Students
FROM students
GROUP BY Branch HAVING AVG_CGPA >= 9.0 ORDER  BY AVG_CGPA DESC;

-- Query 48
SELECT Branch,COUNT(*) AS Total_Students,ROUND(AVG(CGPA), 2)
 AS Average_CGPA FROM students GROUP BY Branch
HAVING AVG(CGPA) BETWEEN 8.0 AND 9.0
ORDER BY Average_CGPA DESC;

-- Query 49
SELECT Branch,ROUND(AVG(CGPA), 2) AS Average_CGPA
FROM students GROUP BY Branch ORDER BY Average_CGPA DESC
LIMIT 1;

-- Query 50
SELECT Branch,ROUND(AVG(CGPA), 2) AS Average_CGPA
FROM students
GROUP BY Branch ORDER BY Average_CGPA ASC
LIMIT 1;


/*=========================================================
SECTION 3 : LEETCODE ANALYTICS
=========================================================*/

-- Query 51
SELECT Student_id,Easy_Solved,Medium_Solved,
Hard_Solved,(Easy_Solved+Medium_Solved+
Hard_Solved) AS Total_Solved 
FROM leetcode_progress
ORDER BY Total_Solved DESC
LIMIT 5;

-- Query 52
SELECT Student_id,Easy_Solved,Medium_Solved,
Hard_Solved,(Easy_Solved+Medium_Solved+
Hard_Solved) AS Total_Solved 
FROM leetcode_progress
ORDER BY Total_Solved ASC LIMIT 5;

-- Query 53
SELECT Student_id,Easy_Solved,Medium_Solved,Hard_Solved,
(Easy_Solved + Medium_Solved + Hard_Solved) 
AS Total_Solved FROM leetcode_progress
where (Easy_Solved + Medium_Solved + Hard_Solved)  >= 400 ;

-- Query 54
SELECT Student_id,Easy_Solved,Medium_Solved,Hard_Solved,
(Easy_Solved + Medium_Solved + Hard_Solved) 
AS Total_Solved FROM leetcode_progress
where (Easy_Solved + Medium_Solved + Hard_Solved) < 100  ;

-- Query 55
SELECT Student_id,Hard_Solved
 FROM leetcode_progress
 WHERE Hard_Solved >= 30
 ORDER BY Hard_Solved DESC;

-- Query 56
SELECT Student_id,Medium_Solved
 FROM leetcode_progress
 WHERE Medium_Solved >= 150
 ORDER BY Medium_Solved DESC;

-- Query 57
SELECT Student_id,Contest_Rating
 FROM leetcode_progress
 WHERE Contest_Rating >= 1800
 ORDER BY Contest_Rating DESC;

-- Query 58
SELECT Student_id,Contest_Rating
 FROM leetcode_progress
 WHERE Contest_Rating < 1000
 ORDER BY Contest_Rating ASC;

-- Query 59
SELECT Student_id,Contest_Rating
 FROM leetcode_progress
 WHERE Contest_Rating BETWEEN 1500 AND 1800
 ORDER BY Contest_Rating DESC;
 
 -- Query 60
 SELECT Student_id,Contest_Rating
 FROM leetcode_progress
 WHERE Contest_Rating > (
 SELECT AVG(Contest_Rating)
 FROM leetcode_progress
 )
 ORDER BY Contest_Rating DESC;

-- Query 61
 SELECT Student_id,Contest_Rating
 FROM leetcode_progress
 WHERE Contest_Rating < (
 SELECT AVG(Contest_Rating)
 FROM leetcode_progress
 )
 ORDER BY Contest_Rating ASC;
 
 -- Query 62
 SELECT Student_id,Contest_Rating 
 FROM leetcode_progress
 ORDER  BY Contest_Rating DESC
 LIMIT 5;
 
  -- Query 63
 SELECT Student_id,Contest_Rating 
 FROM leetcode_progress
 ORDER  BY Contest_Rating ASC
 LIMIT 5;
 
  -- Query 64
 SELECT ROUND(AVG(Contest_Rating),2)
 AS Average_Contest_Rating
 FROM leetcode_progress;
 
 -- Query 65
 SELECT MAX(Contest_Rating) AS Highest_Contest_Rating,
 MIN(Contest_Rating) AS Lowest_Contest_Rating
 FROM leetcode_progress;
 
 -- Query 66
 SELECT COUNT(*) AS Elite_Coders
 FROM leetcode_progress
 WHERE Contest_Rating >= 1800 ;
 
 -- Query 67
 SELECT Student_id,Easy_Solved,Medium_Solved
 FROM leetcode_progress
 WHERE Easy_Solved >= 200 and Medium_Solved >= 150
 ORDER BY Medium_Solved DESC;
 
  -- Query 68
 SELECT Student_id,Hard_Solved,Contest_Rating
 FROM leetcode_progress
 WHERE Hard_Solved >= 30 OR Contest_Rating >= 1800
 ORDER BY Contest_Rating DESC;
 
 -- Query 69
 SELECT Student_id,Hard_Solved,Medium_Solved
 FROM leetcode_progress
 WHERE Medium_Solved >= 150 and Hard_Solved < 30
 ORDER BY Medium_Solved DESC;
 
 -- Query 70
 SELECT Student_id,Hard_Solved,Medium_Solved,Easy_Solved
 FROM leetcode_progress
 where Hard_Solved>=30 AND Medium_Solved >= 150
 AND Easy_Solved >= 200
 ORDER BY Hard_Solved DESC;
 
 -- Query 71
 SELECT s.Student_Name,s.Branch,l.Contest_Rating,
 (l.Easy_solved + l.Medium_solved + l.Hard_solved)
 AS Total_Solved FROM students s
 INNER JOIN leetcode_progress l
 ON s.Student_id = l.Student_id
 ORDER BY Total_Solved DESC
 LIMIT 5;
 
 -- Query 72
 SELECT S.Branch , ROUND(AVG(l.Easy_solved + l.Medium_solved + l.Hard_solved),2)
 AS Average_Total_Solved 
 FROM students S INNER JOIN leetcode_progress l
 ON S.Student_id = l.Student_id
 GROUP BY Branch
 ORDER BY Average_Total_Solved DESC;
 
 -- Query 73
SELECT s.Student_Name,s.Branch,
(l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) AS Total_Solved
FROM students s INNER JOIN leetcode_progress l
ON s.Student_id = l.Student_id
WHERE (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) =
(SELECT MAX(lp.Easy_Solved + lp.Medium_Solved + lp.Hard_Solved)
FROM students st
INNER JOIN leetcode_progress lp
ON st.Student_id = lp.Student_id
WHERE st.Branch = s.Branch);
 
 -- Query 74
 SELECT S.Student_Name,S.Branch,S.CGPA,
 (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) AS Total_Solved
 FROM students S
 INNER JOIN leetcode_progress l
 ON S.Student_id = l.Student_id
 WHERE S.CGPA >= 8.5 AND 
 (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) < 200
 ORDER BY CGPA DESC;
 
 -- Query 75
  SELECT S.Student_Name,S.Branch,S.CGPA,l.Contest_Rating,
 (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) AS Total_Solved
 FROM students S
 INNER JOIN leetcode_progress l
 ON S.Student_id = l.Student_id
 WHERE S.CGPA BETWEEN 7.5 AND 8.5 AND 
 (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) >= 400
 ORDER BY Total_Solved DESC;
 
 -- Query 76
 SELECT S.Branch,ROUND(AVG(l.Contest_Rating),2)AS AVG_Contest_Rating
 FROM students S INNER JOIN leetcode_progress l
 ON S.Student_id = l.Student_id
 GROUP BY S.Branch ORDER BY AVG_CONTEST_RATING DESC
 LIMIT 1;
 
 -- Query 77
 SELECT S.Branch,ROUND(AVG(l.Contest_Rating),2)AS AVG_Contest_Rating
 FROM students S INNER JOIN leetcode_progress l
 ON S.Student_id = l.Student_id
 GROUP BY S.Branch ORDER BY AVG_CONTEST_RATING ASC
 LIMIT 1;
 
 -- Query 78
 SELECT S.Branch,COUNT(*) AS Elite_Coders
  FROM students S INNER JOIN leetcode_progress l
 ON S.Student_id = l.Student_id
 WHERE l.Contest_Rating >= 1800
 GROUP BY S.Branch ORDER BY Elite_Coders DESC;
 
-- Query 79
SELECT s.Student_Name,
       s.Branch,
       s.CGPA,
       l.Contest_Rating,
       (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) AS Total_Solved
FROM students s
INNER JOIN leetcode_progress l
ON s.Student_id = l.Student_id
WHERE s.CGPA >= (
        SELECT AVG(CGPA)
        FROM students
)
AND l.Contest_Rating >= (
        SELECT AVG(Contest_Rating)
        FROM leetcode_progress
)
AND (l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) >= (
        SELECT AVG(Easy_Solved + Medium_Solved + Hard_Solved)
        FROM leetcode_progress
)
ORDER BY l.Contest_Rating DESC,
         Total_Solved DESC;
         

-- Query 80
SELECT s.Student_Name,s.Branch,s.CGPA,l.Contest_Rating,
(l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) AS Total_Solved
FROM students s INNER JOIN leetcode_progress l
ON s.Student_id=l.Student_id
ORDER BY l.Contest_Rating DESC,(l.Easy_Solved + l.Medium_Solved + l.Hard_Solved) DESC, s.CGPA DESC
LIMIT 10;
 
 
 
 
 
/*=========================================================
SECTION 4 : SQL ANALYTICS
=========================================================*/

-- Query 81
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
ORDER BY Practice_Questions DESC LIMIT 5;

-- Query 82
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
ORDER BY Assessment_Score DESC LIMIT 5;

-- Query 83
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
WHERE Topics_Completed >= 20
ORDER BY Topics_Completed DESC;

-- Query 84
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
WHERE Topics_Completed < 10
ORDER BY Topics_Completed ASC;

-- Query 85
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
WHERE Practice_Questions >= 150
ORDER BY Practice_Questions DESC;

-- Query 86
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
WHERE Assessment_Score >= 90
ORDER BY Assessment_Score DESC;

-- Query 87
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
WHERE Assessment_Score > (SELECT AVG(Assessment_Score) 
FROM sql_progress) ORDER BY Assessment_Score DESC;

-- Query 88
SELECT Student_id,Topics_Completed,Practice_Questions,
Assessment_Score FROM sql_progress
WHERE Assessment_Score < (SELECT AVG(Assessment_Score) 
FROM sql_progress) ORDER BY Assessment_Score ASC;

-- Query 89
SELECT MAX(Assessment_Score)  AS Highest_Assessment_Score,
 MIN(Assessment_Score)  AS Lowest_Assessment_Score,
 ROUND(AVG(Assessment_Score),2) AS Average_Assessment_Score
 FROM sql_progress;
 
-- Query 90
SELECT Student_id,Topics_Completed,Practice_Questions,Assessment_Score
FROM sql_progress
WHERE Topics_Completed >= 20
  AND Assessment_Score < (
      SELECT AVG(Assessment_Score)
      FROM sql_progress
  )
ORDER BY Assessment_Score ASC;

-- Query 91
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Topics_Completed,SQ.Practice_Questions,SQ.Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
ORDER BY SQ.Assessment_Score DESC,
SQ.Practice_Questions DESC LIMIT 5;

-- Query 92
SELECT S.Branch,ROUND(AVG(SQ.Assessment_Score),2) AS
Average_Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
GROUP BY S.Branch
ORDER BY Average_Assessment_Score DESC;

-- Query 93
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Topics_Completed,SQ.Practice_Questions,SQ.Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
WHERE S.CGPA>=8.5 AND SQ.Assessment_Score < 70
ORDER BY CGPA DESC;

-- Query 94
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Topics_Completed,SQ.Practice_Questions,SQ.Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
WHERE S.CGPA BETWEEN 7.5 AND 8.5 AND SQ.Assessment_Score >= 90
ORDER BY S.CGPA DESC;

-- Query 95
SELECT S.Branch,ROUND(AVG(SQ.Assessment_Score),2) AS
Average_Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
GROUP BY S.Branch
ORDER BY Average_Assessment_Score DESC
LIMIT 1;

-- Query 96
SELECT S.Branch,ROUND(AVG(SQ.Assessment_Score),2) AS
Average_Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
GROUP BY S.Branch
ORDER BY Average_Assessment_Score ASC
LIMIT 1;

-- Query  97
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
WHERE SQ.Assessment_Score = (
      SELECT MAX(SQ2.Assessment_Score)
      FROM students S2
      INNER JOIN sql_progress SQ2
      ON S2.Student_ID = SQ2.Student_ID
      WHERE S2.Branch = S.Branch
)
ORDER BY S.Branch ASC;

-- Query 98
SELECT S.Branch,COUNT(*) AS SQL_Excellence_Students
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
WHERE SQ.Assessment_Score>= 90
GROUP BY S.Branch ORDER BY SQL_Excellence_Students DESC;

-- Query 99
SELECT S.Student_Name,S.Branch,SQ.Assessment_Score
FROM sql_progress SQ INNER JOIN students S
ON SQ.Student_ID = S.Student_id
WHERE SQ.Assessment_Score > (SELECT AVG(SQ2.Assessment_Score)
FROM students S2  INNER JOIN sql_progress SQ2
    ON S2.Student_ID = SQ2.Student_ID
    WHERE S2.Branch = S.Branch
)
ORDER BY S.Branch ASC,
         SQ.Assessment_Score DESC;

-- Query 100
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Topics_Completed,SQ.Practice_Questions,SQ.Assessment_Score
FROM students S INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
WHERE SQ.Topics_Completed >= 20 AND 
SQ.Practice_Questions >= 150 AND SQ.Assessment_Score >=85
ORDER BY SQ.Assessment_Score DESC,SQ.Practice_Questions DESC,
S.CGPA DESC;

-- Query 101
SELECT S.Student_Name,S.Branch,S.CGPA,SQ.Assessment_Score,L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE SQ.Assessment_Score >= 85
  AND L.Contest_Rating >= 1800
ORDER BY L.Contest_Rating DESC,
         SQ.Assessment_Score DESC;

-- Query 102
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Assessment_Score,
L.Contest_Rating,(L.Easy_Solved + L.Medium_Solved+L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE SQ.Assessment_Score >= 85 AND
L.Contest_Rating < 1500 ORDER BY
SQ.Assessment_Score DESC,L.Contest_Rating ASC;

-- Query 103
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Assessment_Score,
L.Contest_Rating,(L.Easy_Solved + L.Medium_Solved+L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE L.Contest_Rating >= 1800 AND
SQ.Assessment_Score <
(SELECT AVG(Assessment_Score)FROM sql_progress)
ORDER BY L.Contest_Rating DESC,SQ.Assessment_Score ASC;

-- Query 104
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Assessment_Score,L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE S.CGPA >
(SELECT AVG(CGPA) FROM students)
AND SQ.Assessment_Score >
(SELECT AVG(Assessment_Score) FROM sql_progress)
AND L.Contest_Rating >
(SELECT AVG(Contest_Rating) FROM leetcode_progress)
ORDER BY L.Contest_Rating DESC,
SQ.Assessment_Score DESC,S.CGPA DESC;

-- Query 105
SELECT S.Student_Name,S.Branch,
SQ.Assessment_Score,SQ.Topics_Completed,SQ.Practice_Questions,
L.Contest_Rating FROM students S
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE SQ.Assessment_Score >= 90 AND
SQ.Topics_Completed >=20 AND
SQ.Practice_Questions >= 180
ORDER BY SQ.Assessment_Score DESC,SQ.Practice_Questions DESC;

-- Query 106
SELECT S.Branch,
ROUND(AVG(SQ.Assessment_Score),2) AS Average_SQL_Assessment,
ROUND(AVG(L.Contest_Rating),2) AS Average_Contest_Rating FROM students S
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
GROUP BY S.Branch ORDER BY Average_Contest_Rating DESC,
Average_SQL_Assessment DESC;

-- Query 107
SELECT S.Student_Name,S.Branch,
SQ.Assessment_Score,
L.Contest_Rating ,
(L.Easy_Solved+L.Medium_Solved+L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE SQ.Assessment_Score > (SELECT AVG(SQ2.Assessment_Score)
FROM sql_progress SQ2) AND
L.Contest_Rating > (SELECT AVG(L2.Contest_Rating)
FROM leetcode_progress L2)
ORDER BY SQ.Assessment_Score DESC,L.Contest_Rating DESC;


-- Query 108
SELECT S.Student_Name,S.Branch,SQ.Assessment_Score,
L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE SQ.Assessment_Score >= 85
AND (L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) >
(SELECT AVG(L1.Easy_Solved + L1.Medium_Solved + L1.Hard_Solved)
FROM leetcode_progress L1)
ORDER BY SQ.Assessment_Score DESC,
Total_LeetCode_Solved DESC;

-- Query 109
SELECT S.Student_Name,S.Branch,SQ.Assessment_Score,
L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE (L.Easy_Solved + L.Medium_Solved + L.Hard_Solved)>=400
AND
SQ.Assessment_Score >= 85
ORDER BY (L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) DESC,
SQ.Assessment_Score DESC;

-- Query 110
SELECT S.Student_Name,S.Branch,S.CGPA,
SQ.Assessment_Score,
L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE SQ.Assessment_Score >= 85
AND L.Contest_Rating >= 1800
AND (L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) >= 400
ORDER BY L.Contest_Rating DESC,
SQ.Assessment_Score DESC,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) DESC;

/*=========================================================
SECTION 5 : PROJECT ANALYTICS
=========================================================*/

-- Query 111
SELECT  S.Student_Name,S.Branch,S.CGPA,
P.Project_Name , P.Technology  , P.Status,
P.Completion_Percentage,P.Project_Score
FROM students S INNER  JOIN projects P
ON S.Student_ID = P.Student_ID
ORDER BY  P.Project_Score DESC, P.Completion_Percentage DESC
LIMIT 10;

-- Query 112
SELECT  S.Student_Name,S.Branch,S.CGPA,
P.Project_Name , P.Technology  , P.Status,
P.Project_Score
FROM students S INNER  JOIN projects P
ON S.Student_ID = P.Student_ID
WHERE P.Project_Score > (SELECT AVG(P2.Project_Score) FROM
projects P2) ORDER BY P.Project_Score DESC;

-- Query 113
SELECT  S.Student_Name,S.Branch,S.CGPA,
P.Project_Name , P.Technology  , P.Completion_Percentage,
P.Project_Score
FROM students S INNER  JOIN projects P
ON S.Student_ID = P.Student_ID
WHERE P.Project_Score >= 90 AND P.Status = 'Completed'
ORDER BY P.Project_Score DESC,S.CGPA DESC;

-- Query 114
SELECT  S.Student_Name,S.Branch,S.CGPA,
P.Project_Name , P.Technology ,P.Project_Score
FROM students S INNER  JOIN projects P
ON S.Student_ID = P.Student_ID
WHERE P.Project_Score > (SELECT AVG(P2.Project_Score) FROM
projects P2) AND 
S.CGPA > (SELECT AVG(S2.CGPA) FROM students S2) 
ORDER BY P.Project_Score DESC, S.CGPA DESC;

-- Query 115
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_OF_Projects
FROM students S INNER JOIN projects P 
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID
HAVING Number_OF_Projects > 1
ORDER BY Number_OF_Projects DESC;

-- Query 116
SELECT P.Technology,COUNT(*) AS Number_of_Projects,
AVG(P.Project_Score) AS Average_Project_Score
FROM students S INNER JOIN projects P 
ON S.Student_ID = P.Student_ID
GROUP BY P.Technology
ORDER BY Average_Project_Score DESC,
Number_of_Projects DESC LIMIT 5;

-- Query 117
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_of_Projects,
AVG(P.Project_Score) AS Average_Project_Score
FROM students S INNER JOIN projects P 
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID
HAVING Number_OF_Projects >= 2
AND AVG(P.Project_Score) >
(SELECT AVG(P2.Project_Score)FROM projects P2)
ORDER BY Average_Project_Score DESC,
Number_of_Projects DESC;

-- Query 118
SELECT S.Branch,
       COUNT(*) AS Number_of_Projects,
       ROUND(AVG(P.Project_Score),2) AS Average_Project_Score
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Branch
ORDER BY Average_Project_Score DESC,
         Number_of_Projects DESC
LIMIT 1;

-- Query 119
SELECT S.Student_Name,S.Branch,P.Project_Name,SQ.Assessment_Score,P.Project_Score
FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
WHERE P.Project_Score > (SELECT AVG(P2.Project_Score)
FROM projects P2) AND
SQ.Assessment_Score > (SELECT AVG(SQ2.Assessment_Score)
FROM sql_progress SQ2) ORDER BY P.Project_Score DESC,
SQ.Assessment_Score DESC;

-- Query 120
SELECT S.Student_Name,S.Branch,
COUNT(*) AS Number_of_Completed_Projects,
ROUND(AVG(P.Project_Score),2) AS Average_Project_Score
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
WHERE P.Status = 'Completed'
GROUP BY S.Student_ID
HAVING 
ROUND(AVG(P.Project_Score),2) > (SELECT AVG(P2.Project_Score)
FROM projects P2) AND
Number_of_Completed_Projects > 2 ;

-- Query 121
SELECT S.Student_Name,S.Branch,P.Project_Name,P.Technology,
P.Project_Score FROM students S
INNER JOIN projects P ON S.Student_ID = P.Student_ID
WHERE P.Project_Score =
(SELECT MAX(P2.Project_Score) FROM students S2
INNER JOIN projects P2 ON S2.Student_ID=P2.Student_id WHERE
S2.Branch = S.Branch) ORDER BY S.Branch ASC,
P.Project_Score DESC;

-- QUERY 122 
SELECT S.Student_Name,S.Branch,P.Project_Name,P.Project_Score
 FROM students S INNER JOIN projects P ON S.Student_ID = P.Student_ID
WHERE P.Project_Score =
(SELECT MAX(P2.Project_Score)
FROM projects P2 WHERE P2.Student_ID = P.Student_ID)
AND P.Project_Score >
(SELECT AVG(P3.Project_Score) FROM students S3
INNER JOIN projects P3
ON S3.Student_ID = P3.Student_ID WHERE S3.Branch = S.Branch)
ORDER BY P.Project_Score DESC, S.Student_Name ASC;

-- Query 123
SELECT S.Student_Name,
       S.Branch,
       COUNT(*) AS Number_of_Projects,
       COUNT(DISTINCT P.Technology) AS Number_of_Technologies
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID,
         S.Student_Name,
         S.Branch
HAVING COUNT(DISTINCT P.Technology) > 1
ORDER BY Number_of_Technologies DESC,
         Number_of_Projects DESC;

-- Query 124
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_of_Projects,
COUNT(DISTINCT P.Technology) AS Number_of_Different_Technologies,
GROUP_CONCAT(DISTINCT P.Project_Name ORDER BY P.Project_Name SEPARATOR ', ') AS Projects_Built
FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
ORDER BY Number_of_Projects DESC,
Number_of_Different_Technologies DESC;

-- Query 125
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_of_Projects,
COUNT(DISTINCT P.Technology) AS Number_of_Different_Technologies,
GROUP_CONCAT(DISTINCT P.Technology ORDER BY P.Technology SEPARATOR ', ') AS Technologies_Used
FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
ORDER BY Number_of_Projects DESC,
Number_of_Different_Technologies DESC;

-- Query 126
SELECT S.Student_Name,
S.Branch,
P.Project_Name,
P.Project_Score,
L.Contest_Rating,
(L.Easy_Solved+L.Medium_Solved+L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE P.Project_Score > (SELECT AVG(P2.Project_Score) FROM
projects P2) AND
L.Contest_Rating > 
(SELECT AVG(L2.Contest_Rating) FROM leetcode_progress L2)
 ORDER BY Project_Score DESC, Contest_Rating DESC;

-- Query 127

SELECT S.Student_Name,S.Branch,P.Project_Name,
P.Project_Score,SQ.Assessment_Score,L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved) AS Total_LeetCode_Solved
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID
INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID
WHERE P.Project_Score >
(SELECT AVG(P2.Project_Score) FROM projects P2)
AND SQ.Assessment_Score >
(SELECT AVG(SQ2.Assessment_Score) FROM sql_progress SQ2)
AND L.Contest_Rating >
(SELECT AVG(L2.Contest_Rating)FROM leetcode_progress L2)
ORDER BY P.Project_Score DESC,SQ.Assessment_Score DESC,
L.Contest_Rating DESC;

-- Query 128
SELECT S.Student_Name,S.Branch,
COUNT(*) AS Number_of_Projects,
ROUND(AVG(P.Project_Score),2) AS Average_Project_Score
FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Branch,S.Student_ID,Student_Name 
ORDER BY Average_Project_Score DESC,
Number_of_Projects DESC LIMIT 5;

-- Query 129
SELECT S.Student_Name,S.Branch,
COUNT(*) AS Number_of_Projects,
ROUND(AVG(P.Project_Score),2) AS Average_Project_Score
FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch HAVING 
AVG(P.Project_Score) > (SELECT AVG(P2.Project_Score)
FROM projects P2) ORDER BY
Average_Project_Score DESC,Number_of_Projects DESC;

-- Query 130
-- PERFORMANCE INDEX = 70% PROJECT SCORE + 30% COMPLETION PROGRESS
SELECT S.Student_Name,S.Branch,
COUNT(*) AS Number_of_Projects,
ROUND(AVG(P.Project_Score),2) AS Average_Project_Score,
ROUND(AVG(P.Completion_Percentage),2) AS Average_Completion,
ROUND((AVG(P.Project_Score) * 0.70) +
(AVG(P.Completion_Percentage) * 0.30),2) AS Performance_Index
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
ORDER BY Performance_Index DESC,Number_of_Projects DESC
LIMIT 5;

-- Query 131
SELECT S.Student_Name,S.Branch,
P.Project_Name,P.Project_Score,P.Completion_Percentage,
ROUND((P.Project_Score * 0.70) +
(P.Completion_Percentage * 0.30),2) AS Performance_Index
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
WHERE
((P.Project_Score * 0.70) +(P.Completion_Percentage * 0.30)) =
(SELECT MAX(
(P2.Project_Score * 0.70) +(P2.Completion_Percentage * 0.30))
FROM projects P2
WHERE P2.Student_ID = P.Student_ID)
ORDER BY Performance_Index DESC,P.Project_Score DESC
LIMIT 5;

-- Query 132
SELECT S.Student_Name,S.Branch,COUNT(*) AS No_of_Projects,
ROUND(AVG(P.Project_Score),2) AS Average_Project_Score,
ROUND(AVG(P.Completion_Percentage),2) AS Average_Completion_Percentage
FROM students S INNER JOIN projects P 
ON S.Student_ID=P.Student_ID
GROUP BY S.Student_ID,Student_Name,S.Branch
HAVING  AVG(P.Completion_Percentage)  >( SELECT AVG(P2.Completion_Percentage)
FROM projects P2);

-- Query 133
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_of_Projects,
ROUND(AVG(P.Project_Score),2) AS Average_Project_Score
FROM students S INNER JOIN projects P 
ON S.Student_ID=P.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
HAVING 
SUM(CASE WHEN P.Status = 'Completed'THEN 1 ELSE 0 END)
 = COUNT(*)
ORDER BY Average_Project_Score DESC,
Number_of_Projects DESC;

-- Query 134

SELECT S.Student_Name,S.Branch,
P.Project_Name,P.Project_Score,
SQ.Assessment_Score,L.Contest_Rating,
(L.Easy_Solved + L.Medium_Solved + L.Hard_Solved)
AS Total_LeetCode_Solved,

ROUND((P.Project_Score * 0.50) +
(SQ.Assessment_Score * 0.25) +
((L.Contest_Rating / 2000) * 100 * 0.25),2)
AS Technical_Performance_Index

FROM students S INNER JOIN projects P
ON S.Student_ID = P.Student_ID

INNER JOIN sql_progress SQ
ON S.Student_ID = SQ.Student_ID

INNER JOIN leetcode_progress L
ON S.Student_ID = L.Student_ID

WHERE P.Project_Score >
(SELECT AVG(P2.Project_Score) FROM projects P2)

AND SQ.Assessment_Score >
(SELECT AVG(SQ2.Assessment_Score) FROM sql_progress SQ2)

AND L.Contest_Rating >
(SELECT AVG(L2.Contest_Rating) FROM leetcode_progress L2)

ORDER BY Technical_Performance_Index DESC,
P.Project_Score DESC;

-- Query 135

SELECT S.Branch,
       COUNT(*) AS Number_of_Projects,
       COUNT(DISTINCT P.Technology) AS Number_of_Different_Technologies,
       GROUP_CONCAT(
           DISTINCT P.Technology
           ORDER BY P.Technology
           SEPARATOR ', '
       ) AS Technologies_Used
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Branch
ORDER BY Number_of_Different_Technologies DESC,
         Number_of_Projects DESC;
         
-- Query 136

SELECT S.Student_Name,
       S.Branch,
       COUNT(*) AS Number_of_Projects,
       MAX(P.Project_Score) AS Highest_Project_Score,
       ROUND(AVG(P.Project_Score),2) AS Average_Project_Score
FROM students S
INNER JOIN projects P
ON S.Student_ID = P.Student_ID
GROUP BY S.Student_ID,
         S.Student_Name,
         S.Branch
HAVING MAX(P.Project_Score) >= 90
AND AVG(P.Project_Score) >
(
    SELECT AVG(P2.Project_Score)
    FROM projects P2
)
ORDER BY Highest_Project_Score DESC,
         Average_Project_Score DESC;

/*=========================================================
SECTION 6 : GITHUB ANALYTICS
=========================================================*/

-- Query 137
SELECT Repository_Name,Primary_Language,Total_Commits
FROM github_activity
ORDER BY Total_Commits DESC LIMIT 10;

-- Query 138
SELECT Repository_Name,Primary_Language,Total_Commits
FROM github_activity
ORDER BY Total_Commits ASC LIMIT 10;

-- Query 139
SELECT Repository_Name,Primary_Language,Total_Commits
FROM github_activity
WHERE Total_Commits > (SELECT AVG(T.Total_Commits) FROM
github_activity T) ORDER BY Total_Commits DESC;

-- Query 140
SELECT Repository_Name,Primary_Language,Total_Commits
FROM github_activity
WHERE Total_Commits < (SELECT AVG(T.Total_Commits) FROM
github_activity T) ORDER BY Total_Commits ASC;

-- Query 141
SELECT Repository_Name,Primary_Language,Total_Commits
FROM github_activity
WHERE Total_Commits > 200
ORDER BY Total_Commits DESC;

-- Query 142
SELECT Repository_Name,Primary_Language,Total_Commits
FROM github_activity
WHERE Total_Commits < 50
ORDER BY Total_Commits ASC;

-- Query 143
SELECT MAX(Total_Commits) AS Highest_Total_Commits,
MIN(Total_Commits) AS Lowest_Total_Commits,
ROUND(AVG(Total_Commits),2) AS Average_Total_Commits
FROM github_activity;

-- Query 144
SELECT Primary_Language,COUNT(*) AS Number_of_Repositories
FROM github_activity
GROUP BY Primary_Language
ORDER BY Number_of_Repositories DESC;

-- Query 145
SELECT S.Student_Name,s.Branch,
COUNT(*) AS Number_of_Repositories,
SUM(G.Total_Commits) AS Total_Github_Commits
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_Name,s.Branch,S.Student_ID
ORDER BY Total_GitHub_Commits DESC,
Number_of_Repositories DESC LIMIT 10;

-- Query 146
SELECT S.Student_Name,s.Branch,
COUNT(*) AS Number_of_Repositories,
SUM(G.Total_Commits) AS Total_Github_Commits
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
ORDER BY Total_GitHub_Commits ASC,
Number_of_Repositories ASC LIMIT 10;

-- Query 147
SELECT S.Student_Name,s.Branch,
COUNT(*) AS Number_of_Repositories,
SUM(G.Total_Commits) AS Total_Github_Commits
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
HAVING SUM(G.Total_Commits) >
(
    SELECT AVG(Student_Total_Commits)
    FROM
    (
        SELECT SUM(Total_Commits) AS Student_Total_Commits
        FROM github_activity
        GROUP BY Student_ID
    ) AS GitHub_Average
)
ORDER BY Total_GitHub_Commits DESC,
         Number_of_Repositories DESC;

-- ROUND(AVG(G.Total_Commits),2) AS Average_Github_Commits

-- Query 148
SELECT
    Branch,
    COUNT(*) AS Total_Students,
    ROUND(AVG(Student_Total_Commits),2) AS Average_GitHub_Commits
FROM
(
    SELECT
        S.Student_ID,
        S.Branch,
        COUNT(*) AS Number_of_Repositories,
        SUM(G.Total_Commits) AS Student_Total_Commits
    FROM students S
    INNER JOIN github_activity G
        ON S.Student_ID = G.Student_ID
    GROUP BY
        S.Student_ID,
        S.Branch
) AS Student_GitHub
GROUP BY Branch
ORDER BY
    Average_GitHub_Commits DESC,
    Total_Students DESC;

-- Query 149
WITH StudentGitHub AS
(SELECT S.Student_ID,S.Student_Name,S.Branch,
COUNT(*) AS Number_of_Repositories,
SUM(G.Total_Commits) AS Total_GitHub_Commits
FROM students S
INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch),

BranchMaximum AS
(SELECT Branch,
MAX(Total_GitHub_Commits) AS Max_Commits
FROM StudentGitHub GROUP BY Branch)
SELECT
SG.Branch,SG.Student_Name,SG.Number_of_Repositories,
SG.Total_GitHub_Commits
FROM StudentGitHub SG
INNER JOIN BranchMaximum BM
ON SG.Branch = BM.Branch
AND SG.Total_GitHub_Commits = BM.Max_Commits
ORDER BY SG.Branch ASC,SG.Total_GitHub_Commits DESC;

-- Query 150
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_of_Repositories
FROM students S INNER JOIN github_activity G
ON S.Student_ID=G.Student_ID
GROUP BY S.Student_Name ,S.Student_ID,S.Branch
HAVING  Number_of_Repositories>=2
ORDER BY Number_of_Repositories DESC,
Student_Name  ASC;

-- Query  151
SELECT StudentGitHub.Branch,ROUND(AVG(Student_Total_Commits),2),
COUNT(*) AS Total_Students
FROM
(SELECT  S.Student_Name,S.Branch,SUM(G.Total_Commits) AS Student_Total_Commits
FROM students S INNER JOIN github_activity G
ON S.Student_ID=G.Student_ID
GROUP BY S.Student_Name,S.Student_ID,S.Branch ) AS StudentGitHub
GROUP BY StudentGitHub.Branch
ORDER BY AVG(Student_Total_Commits) DESC
LIMIT 1;

-- Query 152
WITH StudentGithub AS
(SELECT  S.Student_Name,S.Branch,COUNT(*) AS Number_of_Repositories
FROM students S INNER JOIN github_activity G
ON S.Student_ID=G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch),

RepositoryMaximum AS
(SELECT MAX(Number_of_Repositories) AS MAX_Repositories
FROM StudentGitHub)
SELECT SG.Student_Name,SG.Branch,SG.Number_of_Repositories
FROM StudentGitHub SG
INNER JOIN RepositoryMaximum RM
ON SG.Number_of_Repositories = RM.Max_Repositories
ORDER BY SG.Number_of_Repositories DESC,
SG.Student_Name ASC;

-- Query 153
WITH StudentGithub AS
(SELECT  S.Student_Name,S.Branch,COUNT(*) AS Number_of_Repositories
FROM students S INNER JOIN github_activity G
ON S.Student_ID=G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch),

RepositoryAverage AS
(SELECT AVG(Number_of_Repositories) AS AVG_Repositories
FROM StudentGitHub)
SELECT SG.Student_Name,SG.Branch,SG.Number_of_Repositories
FROM StudentGitHub SG
CROSS JOIN RepositoryAverage RA
WHERE SG.Number_of_Repositories > RA.AVG_Repositories
ORDER BY SG.Number_of_Repositories DESC,
SG.Student_Name ASC;

-- Query 154
WITH StudentGitHub AS
(
SELECT S.Student_Name,S.Branch,SUM(G.Total_Commits) AS Total_Github_Commits
FROM students S INNER JOIN github_activity G
ON S.Student_ID=G.Student_ID
GROUP BY S.Student_Name,S.Student_ID,S.Branch),

AverageGithub AS
(
SELECT AVG(Total_Github_Commits) AS AVG_Total_Commits
FROM StudentGitHub )
SELECT SG.Student_Name,SG.Total_Github_Commits,SG.Branch
FROM StudentGitHub SG
CROSS JOIN  AverageGithub AG
WHERE SG.Total_GitHub_Commits > AG.AVG_Total_Commits
ORDER BY
Total_GitHub_Commits DESC,Student_Name  ASC;

-- Query 155
SELECT S.Student_Name,S.Branch,SUM(G.Total_Commits) AS Total_Github_Commits,
 CASE
WHEN SUM(G.Total_Commits) >= 500
THEN 'Excellent Contributor'
WHEN SUM(G.Total_Commits) >= 300
THEN 'Active Contributor'
ELSE 'Needs Improvement'
END AS Contribution_Level
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
ORDER BY Total_GitHub_Commits DESC,
Student_Name ASC;

-- QUERY 156
SELECT S.Student_Name,S.Branch,SUM(G.Total_Commits) AS Total_Github_Commits,
CASE
WHEN SUM(G.Total_Commits) >= 500
THEN 'Excellent Contributor'
END AS Contribution_Level
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
HAVING SUM(G.Total_Commits) >= 500
ORDER BY Total_GitHub_Commits DESC,
Student_Name ASC;

-- Query 157
SELECT S.Branch,COUNT(*) AS  Number_of_Repositories,
GROUP_CONCAT(DISTINCT Primary_language ORDER BY Primary_language SEPARATOR ' , ') AS Language_Used
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Branch
ORDER BY Number_of_Repositories DESC,
Branch ASC;

-- Query 158
WITH StudentGithub AS
(
SELECT S.Student_Name,S.Branch,COUNT(*) AS Number_of_Repositories
FROM students S INNER JOIN github_activity G
ON S.Student_ID=G.Student_ID
GROUP BY S.Branch,S.Student_Name,S.Student_ID),
HighestActivity AS 
(
SELECT Branch,MAX(Number_of_Repositories) AS Max_Repositories
 FROM StudentGithub GROUP BY Branch)

SELECT SG.Branch,SG.Student_Name,SG.Number_of_Repositories
FROM StudentGithub SG INNER JOIN HighestActivity HA
ON SG.Branch = HA.Branch
AND SG.Number_of_Repositories = HA.Max_Repositories
ORDER BY SG.Branch ASC, SG.Number_of_Repositories DESC;

-- Query 159
SELECT S.Student_Name,S.Branch,
COUNT(DISTINCT G.Primary_Language) AS Number_of_Languages,
GROUP_CONCAT(DISTINCT G.Primary_Language ORDER BY G.Primary_Language SEPARATOR ',')
FROM students S INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
HAVING COUNT(DISTINCT G.Primary_Language) > 1
ORDER BY Number_of_Languages DESC;

-- Query 160
WITH BranchCommits AS
(
    SELECT
        S.Branch,
        SUM(G.Total_Commits) AS Total_GitHub_Commits
    FROM students S
    INNER JOIN github_activity G
        ON S.Student_ID = G.Student_ID
    GROUP BY S.Branch
),

CollegeCommits AS
(
    SELECT
        SUM(Total_GitHub_Commits) AS College_Total_Commits
    FROM BranchCommits
)

SELECT
    BC.Branch,
    BC.Total_GitHub_Commits,

    ROUND(
        (BC.Total_GitHub_Commits * 100.0) /
        CC.College_Total_Commits,
        2
    ) AS Contribution_Percentage

FROM BranchCommits BC
CROSS JOIN CollegeCommits CC

ORDER BY
    Contribution_Percentage DESC,
    BC.Branch ASC;

-- Query 161

WITH StudentGithub AS
(
SELECT S.Student_ID,S.Student_Name,S.Branch,
SUM(G.Total_Commits) AS Total_GitHub_Commits
FROM students S
INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID
GROUP BY S.Student_ID,S.Student_Name,S.Branch
)
SELECT 
ROW_NUMBER() OVER
(
ORDER BY Total_Github_Commits DESC
) AS Github_Rank,
Student_Name,Branch,Total_Github_Commits
FROM StudentGithub
ORDER BY
GitHub_Rank;


-- Query 162

WITH StudentGithub AS
(
    SELECT
        S.Student_ID,
        S.Student_Name,
        S.Branch,
        SUM(G.Total_Commits) AS Total_GitHub_Commits
    FROM students S
    INNER JOIN github_activity G
        ON S.Student_ID = G.Student_ID
    GROUP BY
        S.Student_ID,
        S.Student_Name,
        S.Branch
)

SELECT
    Student_Name,
    Branch,
    Total_GitHub_Commits,

    RANK() OVER (
        ORDER BY Total_GitHub_Commits DESC
    ) AS StudentRank,

    DENSE_RANK() OVER (
        ORDER BY Total_GitHub_Commits DESC
    ) AS DenseRank

FROM StudentGithub

ORDER BY
    Total_GitHub_Commits DESC,
    Student_Name ASC;

-- Query 163

CREATE VIEW GitHub_Summary AS

SELECT
    S.Student_ID,
    S.Student_Name,
    S.Branch,
    COUNT(*) AS Number_of_Repositories,
    SUM(G.Total_Commits) AS Total_GitHub_Commits

FROM students S
INNER JOIN github_activity G
ON S.Student_ID = G.Student_ID

GROUP BY
    S.Student_ID,
    S.Student_Name,
    S.Branch;

-- Query 164

SELECT
    COUNT(*) AS Total_Students,
    SUM(Number_of_Repositories) AS Total_Repositories,
    SUM(Total_GitHub_Commits) AS Total_GitHub_Commits,
    ROUND(AVG(Number_of_Repositories),2) AS Average_Repositories,
    ROUND(AVG(Total_GitHub_Commits),2) AS Average_Commits
FROM GitHub_Summary;



/*=========================================================
SECTION 7 : MOCK TEST ANALYTICS
=========================================================*/

-- Query 165
SELECT S.Student_Name,S.Branch,T.Test_Name,
T.Score,T.Difficulty FROM
students S INNER JOIN mock_tests T
ON S.Student_ID=T.Student_ID
ORDER BY T.Score DESC LIMIT 10;

-- Query 166
SELECT S.Student_Name,S.Branch,T.Test_Name,
T.Score,T.Difficulty FROM
students S INNER JOIN mock_tests T
ON S.Student_ID=T.Student_ID
ORDER BY T.Score,S.Student_ID ASC LIMIT 10;

-- Query 167
SELECT S.Student_Name,S.Branch,T.Test_Name,
T.Score,T.Difficulty FROM
students S INNER JOIN mock_tests T
ON S.Student_ID=T.Student_ID
WHERE T.Score > (SELECT AVG(T2.Score) FROM mock_tests T2)
ORDER BY T.Score DESC,S.Student_Name ASC;

-- Query 168
SELECT S.Student_Name,S.Branch,T.Test_Name,
T.Score,T.Difficulty FROM
students S INNER JOIN mock_tests T
ON S.Student_ID=T.Student_ID
WHERE T.Score < (SELECT AVG(T2.Score) FROM mock_tests T2)
ORDER BY T.Score ASC,S.Student_Name ASC;

-- Query 169
SELECT Test_Name,ROUND(AVG(Score),2) AS Average_Score,
COUNT(*) AS Number_of_Attempts
FROM mock_tests 
GROUP BY Test_Name;

-- Query 170
SELECT Difficulty,
ROUND(AVG(Score),2) AS Average_Score,
MAX(Score) AS Highest_Score,MIN(Score) AS Lowest_Score,
COUNT(*) AS Number_of_Attempts
FROM mock_tests
GROUP BY Difficulty ;

-- Query 171

WITH MockScores AS
(
    SELECT
        S.Student_Name,
        S.Branch,
        T.Test_Name,
        T.Score
    FROM students S
    INNER JOIN mock_tests T
        ON S.Student_ID = T.Student_ID
),

HighestScore AS
(
    SELECT
        Test_Name,
        MAX(Score) AS Highest_Score
    FROM MockScores
    GROUP BY Test_Name
)

SELECT
MS.Test_Name,MS.Student_Name,MS.Branch,MS.Score
FROM MockScores MS
INNER JOIN HighestScore HS
ON MS.Test_Name = HS.Test_Name
AND MS.Score = HS.Highest_Score
ORDER BY MS.Test_Name ASC,MS.Student_Name ASC;

-- Query 172
WITH RankedMockTests AS
(
SELECT S.Student_Name,S.Branch,T.Test_Name,T.Score,
ROW_NUMBER() OVER
(
PARTITION BY T.Test_Name
ORDER BY T.Score DESC
) AS Student_Rank
from students s INNER JOIN mock_tests T
ON S.Student_ID = T.Student_ID
)
SELECT Student_Name,Branch,Test_Name,Score,Student_Rank
FROM RankedMockTests WHERE Student_Rank <= 3
ORDER BY Test_Name , Student_Rank;

-- Query 173

SELECT S.Student_Name,S.Branch,T.Test_Name,T.Score,

    RANK() OVER
    (
        PARTITION BY T.Test_Name
        ORDER BY T.Score DESC
    ) AS Student_Rank,

    DENSE_RANK() OVER
    (
        PARTITION BY T.Test_Name
        ORDER BY T.Score DESC
    ) AS DenseRank

FROM students S
INNER JOIN mock_tests T
ON S.Student_ID = T.Student_ID
ORDER BY T.Test_Name ASC, Student_Rank ASC,S.Student_Name ASC;

-- Query 174
SELECT S.Student_Name,S.Branch,Count(DISTINCT T.Test_Name) AS 
Number_of_test_attempted FROM students S INNER JOIN
mock_tests T ON S.Student_ID = T.Student_ID
GROUP BY S.Student_Name,S.Student_ID,S.Branch
HAVING COUNT(DISTINCT T.Test_Name) =
(SELECT COUNT(DISTINCT Test_Name)FROM mock_tests)
ORDER BY S.Student_Name ASC;

-- Query 175
SELECT S.Student_Name,S.Branch,Count(DISTINCT T.Test_Name) AS 
Number_of_test_attempted FROM students S INNER JOIN
mock_tests T ON S.Student_ID = T.Student_ID
GROUP BY S.Student_Name,S.Student_ID,S.Branch
HAVING COUNT(DISTINCT T.Test_Name) <
(SELECT COUNT(DISTINCT Test_Name)FROM mock_tests)
ORDER BY S.Student_Name ASC;

-- Query 176
SELECT S.Branch,Count(*) AS 
Number_of_test_attempted, ROUND(AVG(T.Score),2) AS AVG_Branch
FROM students S INNER JOIN
mock_tests T ON S.Student_ID = T.Student_ID
GROUP BY S.Branch
ORDER BY AVG_Branch DESC;

-- Query 177
WITH StudentMock AS
( SELECT S.Student_Name,S.Branch,
ROUND(AVG(T.Score),2) AS Average_Mock_Test
FROM students S INNER JOIN mock_tests T
ON S.Student_ID=T.Student_ID
GROUP BY S.Student_Name,S.Student_ID,S.Branch),
BranchMaximum AS 
( SELECT MAX(Average_Mock_Test) AS Max_Score,Branch
FROM StudentMock GROUP BY Branch)
SELECT SM.Student_Name,SM.Branch,SM.Average_Mock_Test
FROM StudentMock SM INNER JOIN BranchMaximum BM
ON SM.Branch = BM.Branch
AND SM.Average_Mock_Test = BM.Max_Score
ORDER BY SM.Average_Mock_Test DESC,SM.Student_Name ASC;

-- Query 178
SELECT S.Student_Name,S.Branch,
ROUND(AVG(T.Score),2) AS Average_Mock_Score,
CASE
WHEN AVG(T.Score) >= 90
THEN 'Excellent'
WHEN AVG(T.Score) >= 80
THEN 'Very Good'
WHEN AVG(T.Score) >= 70
THEN 'Good'
WHEN AVG(T.Score) >= 60
THEN 'Average'
ELSE 'Need Improvement'
 END AS Performance_Grade

FROM students S INNER JOIN mock_tests T
ON S.Student_ID = T.Student_ID

GROUP BY S.Student_ID,S.Student_Name,S.Branch

ORDER BY Average_Mock_Score DESC,S.Student_Name ASC;

-- Query 179

CREATE VIEW Mock_Test_Summary AS

SELECT
    S.Student_ID,
    S.Student_Name,
    S.Branch,
    COUNT(*) AS Number_of_Attempts,
    COUNT(DISTINCT T.Test_Name) AS Number_of_Tests_Attempted,
    ROUND(AVG(T.Score),2) AS Average_Mock_Score,
    MAX(T.Score) AS Highest_Score,
    MIN(T.Score) AS Lowest_Score

FROM students S
INNER JOIN mock_tests T
ON S.Student_ID = T.Student_ID

GROUP BY S.Student_ID,S.Student_Name,S.Branch;
    
SELECT *
FROM Mock_Test_Summary;

-- Query 180

SELECT
    COUNT(*) AS Total_Students,
    SUM(Number_of_Attempts) AS Total_Mock_Attempts,
    ROUND(AVG(Average_Mock_Score),2) AS Average_Mock_Score,
    MAX(Highest_Score) AS Highest_Score,
    MIN(Lowest_Score) AS Lowest_Score
FROM Mock_Test_Summary;
/*=========================================================
SECTION 8 : COMPANY ANALYTICS
=========================================================*/

-- Query 181
SELECT Company_Name,COUNT(*) AS Number_of_Applications
FROM company_applications
GROUP BY Company_Name
ORDER BY Number_of_Applications DESC,Company_Name ;

-- Query 182
SELECT S.Branch,COUNT(*) AS Number_of_applications
FROM students S INNER JOIN company_applications C
ON S.STudent_ID=C.Student_ID
GROUP BY S.Branch
ORDER BY Number_of_applications DESC;

-- Query 183
SELECT S.Student_Name,
S.Branch,COUNT(*) AS Number_of_applications
FROM students S INNER JOIN company_applications C
ON S.STudent_ID=C.Student_ID
GROUP BY S.Student_ID, S.Student_Name, S.Branch
ORDER BY Number_of_applications DESC LIMIT 10;

-- Query 184

SELECT
    S.Student_Name,
    S.Branch,
    COUNT(*) AS Number_of_Applications
FROM students S
INNER JOIN company_applications C
ON S.Student_ID = C.Student_ID

GROUP BY
    S.Student_ID,
    S.Student_Name,
    S.Branch

HAVING COUNT(*) >
(
    SELECT AVG(Student_Applications)
    FROM
    (
        SELECT
            COUNT(*) AS Student_Applications
        FROM company_applications
        GROUP BY Student_ID
    ) AS ApplicationAverage
)
ORDER BY Number_of_Applications DESC,S.Student_Name ASC;

-- Query 185
SELECT Application_Status,COUNT(*) AS Number_of_Applications
FROM company_applications
GROUP BY Application_Status
ORDER BY Number_of_Applications DESC;

-- Query 186
SELECT Company_name,COUNT(*) AS Number_of_Selections
FROM company_applications
WHERE Application_Status = 'Selected'
GROUP BY Company_name
ORDER BY Number_of_Selections DESC,Company_name;

-- Query 187

SELECT Company_Name,COUNT(*) AS Number_of_Rejections
FROM company_applications
WHERE Application_Status = 'Rejected'
GROUP BY Company_Name
ORDER BY Number_of_Rejections DESC,Company_Name ASC;

-- Query 188

SELECT Company_Name,COUNT(*) AS Total_Applications,
SUM(Application_Status = 'Selected') AS Number_of_Selections,
ROUND(SUM(Application_Status = 'Selected') * 100.0 / COUNT(*),2) AS Selection_Percentage
FROM company_applications
GROUP BY Company_Name
ORDER BY Selection_Percentage DESC,Company_Name ASC;

-- Query 189

SELECT Company_Name,
ROUND(AVG(Package_lpa),2) AS Average_Package_LPA,
MAX(Package_lpa) AS Highest_Package_LPA,
COUNT(*) AS Number_of_Offers
FROM company_applications
WHERE Application_Status = 'Selected'
GROUP BY Company_Name
ORDER BY Average_Package_LPA DESC,Company_Name ASC;


-- Query 190
SELECT S.Student_Name,S.Branch,C.Company_name,C.Role,
C.Package_lpa FROM students S INNER JOIN
company_applications C 
ON S.Student_ID = C.Student_ID
WHERE Application_Status = 'Selected'
AND C.Package_lpa = (SELECT MAX(C1.Package_lpa) FROM
company_applications C1 WHERE C1.Application_status = 'Selected');

-- Query 191

SELECT
    S.Branch,
    COUNT(DISTINCT S.Student_ID) AS Total_Students,
    COUNT(DISTINCT CASE
        WHEN C.Application_Status = 'Selected'
        THEN S.Student_ID
    END) AS Placed_Students,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN C.Application_Status = 'Selected'
            THEN S.Student_ID
        END) * 100.0 / COUNT(DISTINCT S.Student_ID),
        2
    ) AS Placement_Percentage
FROM students S
INNER JOIN company_applications C
ON S.Student_ID = C.Student_ID
GROUP BY S.Branch
ORDER BY Placement_Percentage DESC,S.Branch ASC;

-- Query 192
WITH CompanyHiring AS
(
SELECT Company_name,COUNT(*) AS Number_of_Selections
FROM company_applications
WHERE Application_Status = 'Selected'
GROUP BY Company_name
)
SELECT Company_name,Number_of_Selections,
RANK () OVER
( ORDER BY Number_of_Selections DESC)
AS Hiring_Rank,
DENSE_RANK() OVER
(ORDER BY Number_of_Selections DESC) 
AS HiringDenseRank
FROM CompanyHiring
ORDER BY Hiring_Rank ASC,Company_name ASC;

-- Query 193

SELECT S.Student_Name,S.Branch,
GROUP_CONCAT(
DISTINCT CASE 
WHEN C.Application_Status = 'Selected'
THEN C.Company_Name
END
ORDER BY C.Company_Name
SEPARATOR ', '
) AS Selected_Companies,

CASE
WHEN SUM(
CASE
WHEN C.Application_Status = 'Selected'
THEN 1
ELSE 0
END
) > 0
THEN 'Placed'
ELSE 'Not Placed'
END AS Placement_Status

FROM students S INNER JOIN company_applications C
ON S.Student_ID = C.Student_ID

GROUP BY S.Student_ID,S.Student_Name,S.Branch

ORDER BY Placement_Status ASC,S.Student_Name ASC;

-- Query 194

SELECT
    Role,
    COUNT(*) AS Total_Applications,

    SUM(
        CASE
            WHEN Application_Status = 'Selected'
            THEN 1
            ELSE 0
        END
    ) AS Number_of_Selections,

    ROUND(
        SUM(
            CASE
                WHEN Application_Status = 'Selected'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS Selection_Percentage,

    ROUND(AVG(
        CASE
            WHEN Application_Status = 'Selected'
            THEN Package_lpa
        END
    ),2) AS Average_Selected_Package_LPA

FROM company_applications

GROUP BY Role

ORDER BY
    Total_Applications DESC,
    Selection_Percentage DESC;

-- Query 195

CREATE VIEW Company_Application_Summary AS

SELECT S.Student_ID,S.Student_Name,S.Branch,
COUNT(*) AS Total_Applications,

SUM(
CASE
WHEN C.Application_Status = 'Selected'
THEN 1
ELSE 0
END
) AS Selected_Offers,

MAX(C.Package_lpa) AS Highest_Package_LPA,

CASE
WHEN SUM(
CASE
WHEN C.Application_Status = 'Selected'
THEN 1
ELSE 0
END
) > 0
THEN 'Placed'
ELSE 'Not Placed'
END AS Placement_Status

FROM students S INNER JOIN company_applications C
ON S.Student_ID = C.Student_ID

GROUP BY S.Student_ID,S.Student_Name,S.Branch;

SELECT *
FROM Company_Application_Summary;


-- Query 196
SELECT
COUNT(*) AS Total_Students,
SUM(Total_Applications) AS Total_Applications,

SUM(
CASE
WHEN Placement_Status = 'Placed'
THEN 1
ELSE 0
END
) AS Total_Placed_Students,

SUM(Selected_Offers) AS Total_Selected_Offers,

ROUND(
SUM(
CASE
WHEN Placement_Status = 'Placed'
THEN 1
ELSE 0
END
) * 100.0 / COUNT(*),
2
) AS Placement_Percentage,

MAX(Highest_Package_LPA) AS Highest_Package_LPA

FROM Company_Application_Summary;


/*=========================================================
SECTION 9 : PLACEMENT ANALYTICS
=========================================================*/
-- Query 197

SELECT S.Student_Name,S.Branch,
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score,
P.Overall_score,P.Placement_status
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
ORDER BY P.Overall_score DESC,S.Student_Name ASC;

-- Query 198

SELECT S.Student_Name,S.Branch,
P.Overall_score,P.Placement_status
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
WHERE P.Overall_score >
(SELECT AVG(P2.Overall_score)
FROM placement_readiness P2)
ORDER BY P.Overall_score DESC,S.Student_Name ASC;

-- Query 199

SELECT S.Student_Name,S.Branch,
P.Overall_score,P.Placement_status
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
WHERE P.Overall_score <
(SELECT AVG(P2.Overall_score)
FROM placement_readiness P2)
ORDER BY P.Overall_score ASC,S.Student_Name ASC;

-- Query 200

SELECT S.Branch,
ROUND(AVG(P.Overall_score),2) AS Average_Readiness_Score
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
GROUP BY S.BrancH
ORDER BY Average_Readiness_Score DESC,S.Branch ASC;

-- Query 201

SELECT S.Student_Name,S.Branch,
P.Overall_score,P.Placement_status
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
WHERE P.Overall_score =
(
SELECT MAX(P2.Overall_score)
FROM students S2 INNER JOIN placement_readiness P2
ON S2.Student_ID = P2.Student_ID
WHERE S2.Branch = S.Branch
)
ORDER BY S.Branch ASC,P.Overall_score DESC,
S.Student_Name ASC;

-- Query 202

SELECT S.Student_Name,S.Branch,
P.Overall_score,

CASE
WHEN P.Overall_score >= 90
THEN 'Placement Ready'

WHEN P.Overall_score >= 75
THEN 'Almost Ready'

WHEN P.Overall_score >= 60
THEN 'Needs Practice'

ELSE 'Needs Improvement'
END AS Readiness_Category

FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID

ORDER BY P.Overall_score DESC,S.Student_Name ASC;

-- Query 203

SELECT S.Student_Name,S.Branch,
P.Overall_score,P.Placement_status,
RANK() OVER
(
ORDER BY P.Overall_score DESC
) AS Readiness_Rank,
DENSE_RANK() OVER
(
ORDER BY P.Overall_score DESC
) AS Readiness_Dense_Rank
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
ORDER BY Readiness_Rank ASC,S.Student_Name ASC;

-- Query 204

SELECT S.Student_Name,S.Branch,
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score,

GREATEST(
P.Leetcode_score,
P.SQL_score,
P.Project_score,
P.Github_score,
P.Mock_test_score
) AS Highest_Area_Score,

CASE
WHEN P.Leetcode_score = GREATEST(
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score)
THEN 'LeetCode'

WHEN P.SQL_score = GREATEST(
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score)
THEN 'SQL'

WHEN P.Project_score = GREATEST(
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score)
THEN 'Projects'

WHEN P.Github_score = GREATEST(
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score)
THEN 'GitHub'

ELSE 'Mock Test'
END AS Strongest_Readiness_Area
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID
ORDER BY Highest_Area_Score DESC,S.Student_Name ASC;

-- Query 205

CREATE VIEW Placement_Readiness_Summary AS

SELECT S.Student_ID,S.Student_Name,S.Branch,
P.Leetcode_score,P.SQL_score,P.Project_score,
P.Github_score,P.Mock_test_score,
P.Overall_score,P.Placement_status
FROM students S INNER JOIN placement_readiness P
ON S.Student_ID = P.Student_ID;

SELECT * FROM Placement_Readiness_Summary;

-- Query 206

SELECT COUNT(*) AS Total_Students,
ROUND(AVG(Overall_score),2) AS Average_Readiness_Score,

SUM(CASE WHEN Placement_status = 'Placement Ready'
THEN 1 ELSE 0 END) AS Placement_Ready_Students,

SUM(CASE WHEN Placement_status = 'Almost Ready'
THEN 1 ELSE 0 END) AS Almost_Ready_Students,

SUM(CASE WHEN Placement_status = 'Needs Practice'
THEN 1 ELSE 0 END) AS Needs_Practice_Students,

SUM(CASE WHEN Placement_status = 'Needs Improvement'
THEN 1 ELSE 0 END) AS Needs_Improvement_Students,

ROUND(SUM(CASE WHEN Placement_status = 'Placement Ready'
THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2)
AS Placement_Ready_Percentage,

MAX(Overall_score) AS Highest_Readiness_Score,
MIN(Overall_score) AS Lowest_Readiness_Score

FROM Placement_Readiness_Summary;
