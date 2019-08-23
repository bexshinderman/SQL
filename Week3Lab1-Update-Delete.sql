/*
Using Transact-SQL : Exercises
------------------------------------------------------------
Note: I will be marking off all labs from the first week on Friday, make sure you have committed your work to GitLab.
		If you are using GitHub you need to send me a link to your repository.


Exercises for section 9 : UPDATE

*In all exercises, write the answer statement and then execute it.


e9.1	Change the name of IN628 to 'Object-Oriented Software Development (discontinued after 2019)'  

*/ 
select * from Paper;
update Paper 
set PaperName = 'Object-Oriented Software Development (discontinued after 2019)' 
where PaperID = 'IN628' /* executed */

/*

e9.2	For all the semesters that start after 01-June-2018, alter the end date
		to be 14 days later than currently recorded.
		*/

select * from Semester;
update Semester
set StartDate = DATEADD(week, 2, '01-June-2018')
where StartDate > '01-June-2018';

		/*

e9.3	Imagine a strange enrolment requirement regarding the students
		enrolled in IN328 for 2020S1 [Ensure your database has all the records
		created by exercise e8.4]: all students with short names [length of FullName
		is less than 12 characters] must have their enrolment moved 
		from 2020S1 to 2019S2. Write a statement that will perform this enrolment change.

	*/
	insert into PaperInstance values('IN238', '2021S2'); /*executed */
	select * from PaperInstance;
	select * from Enrolment;

	/* unfinished */

	select * from Enrolment;
	Select * from Person;

	update Enrolment 
	set SemesterID = '2019S2' 
	from Enrolment
	join Person on Person.PersonID = Enrolment.PersonID
	where SemesterID = '2021S1' 
	and PaperID = 'IN238' 
	and len(FullName) < 12 
	
	
	/*

Exercises for section 10 : DELETE

*In all exercises, write the answer statement and then execute it.

e10.1	Write a statement to delete all enrolments for IN238 Extraspecial Topic in semester 2020S11.

*/
select * from Semester;
insert into Semester values('2020S1', '02-Feb-2020', '06-June-2020'); /* executed */
Select * from Paper; /* IN238 already in Paper table */
select * from PaperInstance;
insert into PaperInstance values('IN238', '2020S1'); /* executed */
select * from Enrolment;
insert into Enrolment values('IN238', '2020S1', 'shinrl1'); /* executed - adds to enrolment */
delete from Enrolment where PaperID = 'IN238' and SemesterID = '2020S1'; /* executed - removes from enrolment */
/*
		

e10.2	Delete all PaperInstances that have no enrolments.

*/
delete PaperInstance from
--select * from
PaperInstance 
full outer join Enrolment 
on PaperInstance.PaperID = Enrolment.PaperID 
where Enrolment.PaperID is null; /* executed */

select * from PaperInstance
		