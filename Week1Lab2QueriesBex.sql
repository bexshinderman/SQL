/*delete from PaperInstance where PaperID = 'IN610' ;*/



4.1)
Select * from Paper 
JOIN PaperInstance on Paper.PaperID = PaperInstance.PaperID 
where PaperInstance.PaperID = 'IN511';


4.2 
Select DISTINCT FullName 
From Person 
JOIN Enrolment on Person.PersonID = Enrolment.PersonID 
where PaperID = 'IN511';

4.3 
Select * From Person 
LEFT OUTER JOIN Enrolment on Person.PersonID = Enrolment.PersonID 
where Enrolment.PersonID IS NULL;



4.4 /* Insert into Paper values ('IN728', 'Programming5') left outer joins are great for exposiing nulls */
SELECT * FROM Paper 
LEFT OUTER JOIN PaperInstance on Paper.PaperID = PaperInstance.PaperID 
where PaperInstance.PaperID IS NULL;

4.5
Select PaperID, StartDate, EndDate, DATEDIFF(day, StartDate, EndDate) as [Length], PaperInstance.SemesterID from Semester 
join PaperInstance on Semester.SemesterID = PaperInstance.SemesterID 
WHERE PaperInstance.PaperID = 'IN511';

4.6 
/* I really need to see how this is done! */

5.1 
Select PaperID, count(PaperID) as [Num of Instances] 
from PaperInstance 
group by PaperID;


5.2 
Select Enrolment.PaperID, count(PersonID) as [Count], Paper.PaperName 
from Enrolment 
Join Paper on Enrolment.PaperID = Paper.PaperID 
group by Enrolment.PaperID, PaperName;

5.3 
Select Count(PersonID), Enrolment.PaperID, PaperName 
from Enrolment  
join Paper on Enrolment.PaperID = Paper.PaperID 
group by PaperName, Enrolment.PaperID;

5.4 /* Didn't quite get there..."*/

Select Max(PersonID) 
from Enrolment;

Select StartDate, EndDate, PaperName, COUNT(Enrolment.PersonID) as [Number of Pupils] 
from Semester join Enrolment on Semester.SemesterID = Enrolment.SemesterID 
join Paper on Enrolment.PaperID = Paper.PaperID 
group by StartDate, EndDate, PaperName 
order by [Number of Pupils] DESC;

5.5 Select GivenName, FamilyName, FullName 
from Person JOIN Enrolment on Person.PersonID = Enrolment.PersonID
GROUP BY GivenName, FamilyName, FullName 
having count(Enrolment.PersonID) = 3 or count(Enrolment.PersonID) = 4 or count(Enrolment.PersonID) = 5 ;