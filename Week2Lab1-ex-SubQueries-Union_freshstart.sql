/*
Using Transact-SQL : Exercises
------------------------------------------------------------
Exercises for section 6 Subqueries

e6.1	List the paper with the lowest average enrolment per instance. Ignore all papers with no enrolments.
	Display the paper ID, paper name and average enrolment count.
*/

--average enrolment per paperID  what is the best way to go about restricting the entries to only show minimum? obviously top isn't dynamic here
select min(ae.AverageEnrolment) as MinimumAvgEnrolment, ae.PaperID from
(select
p.PaperID, --what is in select is in group by as we're using aggregates
p.PaperName,
avg(ec.EnrolmentCount) as AverageEnrolment
from
	(select 
	PaperID, -- again, what's in select is in group by
	SemesterID,
	count(*) as EnrolmentCount
	from Enrolment
	group by PaperID, SemesterID) ec -- counts enrolments
join Paper p on p.PaperID = ec.PaperID --this is what I was glitching over -I was trying to join Enrolment.PaperID instead of ec.PaperID in situations like this. The subselect already has that data!
group by p.PaperID, p.PaperName) ae -- average enrolments
group by PaperID order by MinimumAvgEnrolment asc;

/*
e6.2	List the paper with the highest average enrolment per instance. 
	Display the paper ID, paper name and average enrolment count.
*/
select max(ae.AverageEnrolment) as MaximumAvgEnrolment, ae.PaperID, ae.PaperName  from
(select
p.PaperID, --what is in select is in group by as we're using aggregates
p.PaperName,
avg(ec.EnrolmentCount) as AverageEnrolment,
max(ec.EnrolmentCount) as MaxEnrolment
from
	(select 
	PaperID, -- again, what's in select is in group by
	SemesterID,
	count(*) as EnrolmentCount
	from Enrolment
	group by PaperID, SemesterID) ec -- counts enrolments
join Paper p on p.PaperID = ec.PaperID --this is what I was glitching over -I was trying to join Enrolment.PaperID instead of ec.PaperID in situations like this. The subselect already has that data!
group by p.PaperID, p.PaperName) ae
group by ae.PaperID, ae.PaperName order by MaximumAvgEnrolment desc;


/*
e6.3	For each paper that has a paper instance: list the paper ID, paper name, 
	starting date of the earliest instance, starting date of the most recent instance, 
	the minimum number of enrolments in the instances,
	maximum number of enrolments in the instances and 
	average number of enrolments across all	the instances.


*/

select * from Semester; 
select * from Paper;
select * from Enrolment;
select * from PaperInstance
--adding data to test minEnrolment
insert into PaperInstance values('IN238', '2017S1'); --executed
insert into Enrolment values('IN238', '2017S1', 'shinrl1'); --executed

select 
p.PaperID, --what is in select is in group by as we're using aggregates
p.PaperName,
min(s.StartDate) as EarliestSD,
max(s.StartDate) as LatestSD,
avg(ec.EnrolmentCount) as AverageEnrolment,
min(ec.EnrolmentCount) as MinEnrolment,
max(ec.EnrolmentCount) as MaxEnrolment
from
	(select 
	PaperID, -- again, what's in select is in group by
	SemesterID,
	count(*) as EnrolmentCount
	from Enrolment
	group by PaperID, SemesterID) ec -- counts enrolments
join Paper p on p.PaperID = ec.PaperID 
join Semester s on s.SemesterID = ec.SemesterID
group by p.PaperID, p.PaperName
/*
e6.4	Which paper attracts people with long names? Find the background statistics 
	to support a hypothesis test: for each paper with enrolments calculate the mean full name length, 
	sample standard deviation full name length & sample size (that is: number of enrolments).

	
*/
select nl.FullName, avg(nl.NameLength) as AverageLength, stdev(nl.NameLength) as StandardDeviation, count(e.PersonID) as SampleSize from (select
GivenName,
FamilyName,
FullName,
PersonID,
len(FullName)-1 as NameLength 
from Person) nl
join Enrolment e on e.PersonID = nl.PersonID
group by nl.FullName
/*
e6.5	Rank the semesters from the most loaded (that is: the highest number of enrolments) to
	the least loaded. Calculate the ordinal position (1 for first, 2 for second...) of the semester
	in this ranking.
	*/

	--setting up unrealistic date for easy deskchecking 
	
	insert into Semester values('2030', '03-Feb-2030', '09-Dec-3030'); --executed
	update Semester set SemesterID = '2030S1' where SemesterID = '2030'; --whoops quick clean up
	select * from Semester;
	insert into PaperInstance values('IN238', '2030S1'); --executed
	select * from PaperInstance;
	insert into Enrolment values('IN238', '2030S1', 'shinrl1'); --executed
	Select * from Enrolment;
	select * from Semester join Enrolment on Semester.SemesterID = Enrolment.SemesterID;

	-- answer ^_^

	select  max(ec.StartDate)
	PaperID, ec.SemesterID, ec.StartDate, ec.EnrolmentCount
	from(
		select
		PaperID,
		Enrolment.SemesterID,
		Semester.StartDate,
		count(*) as EnrolmentCount
		from Enrolment
		join Semester on Enrolment.SemesterID = Semester.SemesterID
		group by PaperID, Enrolment.SemesterID, Semester.StartDate
		) ec
	join
	Semester on Semester.SemesterID  = ec.SemesterID
	group by ec.EnrolmentCount, ec.SemesterID, ec.StartDate order by ec.EnrolmentCount desc; 


	
	/*
Exercises for section 7

--Use UNION to solve these tasks. 
--Note that these tasks could possibly be solved by another non-UNION statement.
--Can you also write a non-UNION statement that produces the same result?   

e7.1	In one result, list all the people who enrolled in a paper delivered during 2019 and
	all the people who have enrolled in IN605. 
	The result should have three columns: PersonID, Full Name and the reason the person
	is on the list - either 'enrolled in 2019' or 'enrolled in IN605'

e7.2	Produce one resultset with two columns. List the all Paper Names and all the Person Full Names in one column.
	In the other column calculate the number of characters in the name.
	Sort the result with the longest name first.

*/