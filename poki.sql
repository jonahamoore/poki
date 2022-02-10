--1. Select * From Grade;

--2. Select * From Emotion;

--3. Select Count (p.Title) as 'number of poems' From Poem p 

--4.SELECT Top 76 a.[Name] From Author a Order By a.Name ASC

--5. Starting with the above query, add the grade of each of the authors.
--SELECT Top 76 a.[Name] as 'Author name', g.Name as 'kids grade'  
--From Author a 
--LEFT JOIN grade g on a.GradeId = g.Id  
--Order By a.Name ASC


--6.starting with the above query, add the recorded gender of each of the authors.
--Select Top 76 a.[Name] as 'Author' , g.Name as 'Author Grade', gr.Name as 'Gender'
--From Author a
--Left Join  Grade g on a.GradeId = G.Id
--Left Join Gender gr on a.GenderId = gr.Id
--Order By a.[Name] ASC;

--7
--Select SUM(p.WordCount) as 'number of characters'
--From Poem p

--8
--Which poem has the fewest characters?
--Select Top 1 p.CharCount
--From Poem p
--ORDER BY p.CharCount ASC;

--Select p.CharCount
--From Poem p
--Where p.CharCount = (Select Min(CharCount) From Poem);

--9
--SELECT Count(au.Id) as 'number of kids in 3rd grade'
--FROM Author au
--WHERE au.GradeId = 3

--10
--SELECT Count(au.Id) as 'all the kids in 1st, 2nd, 3rd'
--FROM Author au
--WHERE au.GradeId = 1 OR au.GradeId=2 OR au.GradeId=3

--11
--What is the total number of poems written by fourth graders?
--SELECT Count(p.Id) as 'total number of poems'
--FROM Poem p
--LEFT JOIN Author au ON au.Id=p.AuthorId
--WHERE au.GradeId = 4;

--12
--How many poems are there per grade?
--select au.gradeid, count(p.id) as 'number of poems per grade'
--from poem p
--left join author au on au.id=p.authorid
--left join grade gr on au.gradeid=gr.id
--group by au.gradeid

--SELECT gr.[Name] AS 'Grade Level', COUNT(p.Id) AS 'Poems per grade'
--FROM Poem p
--LEFT JOIN Author au ON p.AuthorId = au.Id
--LEFT JOIN Grade gr ON au.GradeId = gr.Id
--GROUP BY gr.[Name]
--ORDER BY gr.[Name] ASC;

--13
--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--Select gr.Name AS 'Grade Level', COUNT(au.Id) AS 'number of authors'
--FROM Author au 
--LEFT JOIN Grade gr ON au.GradeId = gr.Id
--GROUP BY gr.Name
--ORDER BY gr.Name ASC;

--14
--What is the title of the poem that has the most words?
--Select p.WordCount, p.Title
--From Poem p
--Where p.WordCount = (Select Max(WordCount) From Poem);

--15
--Which author(s) have the most poems? (Remember authors can have the same name.)
--SELECT Top 1 Count(p.AuthorId), au.Name
--FROM Poem p
--LEFT JOIN Author au ON au.Id=p.AuthorId 
--GROUP BY au.Name
--ORDER BY Count(p.AuthorId) DESC

--16
--How many poems have an emotion of sadness?
--SELECT  Count(pe.PoemId) as 'Number of poems with emotions', pe.EmotionId 
--FROM PoemEmotion pe
--LEFT JOIN Poem p ON p.Id = pe.Id
--LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--GROUP BY pe.EmotionId 
--HAVING pe.EmotionId = 3

--17
--SELECT COUNT (*)
--FROM Poem p LEFT JOIN  PoemEmotion pe on p.Id = pe.PoemId
--WHERE pe.EmotionId IS NULL;

--18
--Which emotion is associated with the least number of poems?
	--How many poems have an emotion of sadness?
--SELECT  Top 1 Count(pe.PoemId) as 'Number of poems with emotions', pe.EmotionId 
--FROM PoemEmotion pe
--LEFT JOIN Poem p ON p.Id = pe.Id
--LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--GROUP BY pe.EmotionId 
--ORDER BY COUNT(pe.PoemId) ASC
--HAVING pe.EmotionId   = (Select Min(pe.EmotionId) from PoemEmotion pe)

--19
--Which grade has the largest number of poems with an emotion of joy?--4
--SELECT TOP 1g.Id, pe.EmotionId, COUNT(p.Id)
--FROM Author a
--LEFT JOIN Grade g ON a.GradeId = g.Id
--LEFT JOIN Poem p ON a.Id = p.AuthorId
--LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--GROUP BY g.Id, pe.EmotionId
--HAVING  pe.EmotionId = 4 
--ORDER BY COUNT(p.Id) DESC


--20
--Which gender has the least number of poems with an emotion of fear?
--SELECT Top 1 g.Name, e.Name, Count(p.id) as '# of poems' FROM Grade g
--Left Join Author a on a.GradeId	 = g.Id
--Left Join Poem p on a.id = p.AuthorId
--Left Join PoemEmotion pe on p.Id = pe.PoemId
--Left Join Emotion e on pe.EmotionId = e.Id
--group by g.NAME, e.Name
--HAVING e.Name = 'Fear'
--order by '# of poems' 