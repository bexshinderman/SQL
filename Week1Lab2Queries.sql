/*delete from PaperInstance where PaperID = 'IN610' ;*/



4.1)Select * from Paper JOIN PaperInstance on Paper.PaperID = PaperInstance.PaperID where PaperInstance.PaperID = 'IN511';


4.2 Select DISTINCT FullName From Person JOIN Enrolment on Person.PersonID = Enrolment.PersonID where PaperID = 'IN511';

4.3 Select * From Person LEFT OUTER JOIN Enrolment on Person.PersonID = Enrolment.PersonID;
Select * From Person LEFT OUTER JOIN Enrolment on Person.PersonID = Enrolment.PersonID where Enrolment.PersonID IS NULL;

select * from Paper;
select * from PaperInstance;

4.4 /* Insert into Paper values ('IN728', 'Programming5') left outer joins are great for exposiing nulls */
SELECT * FROM Paper LEFT OUTER JOIN PaperInstance on Paper.PaperID = PaperInstance.PaperID where PaperInstance.PaperID IS NULL;

4.5 Select PaperID, StartDate, EndDate, DATEDIFF(day, StartDate, EndDate) as [Length], PaperInstance.SemesterID from Semester join PaperInstance on Semester.SemesterID = PaperInstance.SemesterID WHERE PaperInstance.PaperID = 'IN511';

4.6