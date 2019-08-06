e8.1 insert into Paper(PaperID, PaperName)
	values ('IN338', 'Extraspecial Topic');

	insert into Paper(PaperID, PaperName)
	values ('IN238', 'Extraspecial Topic');

	select * from Paper;

ex8.2 


	insert into Person(PersonID, GivenName, FamilyName, FullName)
	values ('shinrl1', 'Bex', 'Shinderman', 'Rebekah Shinderman');

	select * from Person;
	select * from Enrolment;
	select * from PaperInstance;
	select * from Semester;
	select * from Paper;

	insert Paper(PaperID, PaperName)
	values('IN615', 'CCNA3');

	insert into PaperInstance(PaperID, SemesterID)
	values('IN615', '2019S1'); /* executed */

	insert into Enrolment(PaperID, SemesterID, PersonID)
	values('IN705', '2019S1', 'shinrl1'); /* executed */

	insert into Enrolment(PaperID, SemesterID, PersonID)
	values('IN615', '2019S1', 'shinrl1'); /* executed */

	insert into Semester
	values ('2018S1', 2018-02-02, 2018-06-06); /* executed but wrong date type! - deleted in 8.3*/

	


	insert into PaperInstance values ('IN610', '2018S1'); /* executed */

	insert into Enrolment(PaperID, SemesterID, PersonID) /* executed */
	values('IN610', '2018S1', 'shinrl1');

	select * from Enrolment; /* confirms 3 insertions ^_^ */

	8.3 

	insert into Semester values ('2021S1', 2021-02-02, 2021-06-06); /*executed but wrong date format - clean up in following delete statements*/

	delete from Semester WHERE SemesterID = '2021S1' and StartDate = 2021-02-02 and EndDate = 2021-06-06; /* executed - bad date type remooved */
	
	delete from Semester WHERE SemesterID = '2018S1' and StartDate = 2018-02-02 and EndDate = 2018-06-06; /* executed */
	
	insert into Semester values ('2021S1', '02-feb-2021', '06-june-2021'); /* executed */
	
	insert into Semester
	values ('2018S1', '02-Feb-2018', '06-June-2018'); /* executed - correct date type inserted */

	insert into PaperInstance
	values ('IN510', '2021S1'); /* executed */


	select * from PaperInstance;

	insert PaperInstance(paperID, SemesterID)
	select PaperID, Semester.SemesterID from Semester 
	join PaperInstance on Semester.SemesterID = PaperInstance.SemesterID
	where Semester.SemesterID = '2021S1';

	
	select * from Semester; /* I think I've lost the plot on this one */

	8.4)

	insert into PaperInstance values ('IN612', '2021S1'); /* executed */
	delete from PaperInstance where PaperID = 'IN612' and SemesterID = '2021S1'; /* unexecuted */
	select * from PaperInstance; /* please ignore workings*/
	select * from Semester;

	insert into Enrolment(PaperID, SemesterID, PersonID)
	select PaperInstance.PaperID, Semester.SemesterID, Person.PersonID from Semester
	join PaperInstance on Semester.SemesterID = PaperInstance.SemesterID
	join Paper on PaperInstance.PaperID = Paper.PaperID 
	join Enrolment on PaperInstance.PaperID = Enrolment.PaperID 
	join Person on Person.PersonID = Enrolment.PersonID

	where Semester.SemesterID = '2021S1' and Paper.PaperID = 'IN612' 
	
	select * from PaperInstance;

	select * from Paper;

	/* people enrolled in IN605 but not 612  */


	insert into Enrolment(PaperID, SemesterID, PersonID)

	select Enrolment.PaperID, Enrolment.SemesterID, Enrolment.PersonID
	from Enrolment full outer join PaperInstance 
	on Enrolment.PaperID = PaperInstance.PaperID 
	where Enrolment.PaperID = 'IN605' and Enrolment.PaperID != 'IN612' 
	and Enrolment.SemesterID = '2019S2'; 

	select * from Enrolment where PaperID = 'IN238';


	select * from Enrolment;
	select * from Paper;

	insert into Paper values('IN238', 'ExtraSpecialTopicInsert')

	insert into PaperInstance values('IN238', '2021S2')

		insert into Semester
	values ('2021S2', '02-July-2018', '06-Dec-2018');


	/* what am I missing? */
	insert into Enrolment(PaperID, SemesterID, PersonID)
	select 'IN238', '2021S1', IN605.PersonID from 
	(
	(select PaperID, SemesterID,PersonID from Enrolment  where PaperID = 'IN605' and SemesterID = '2019S2') IN605
	left join (select PaperID, SemesterID, PersonID from Enrolment  where PaperID = 'IN612' and SemesterID = '2019S2') IN612
	on IN605.PersonID = IN612.PersonID ) 

	select * from Paper;
	select * from PaperInstance;
	select * from Semester;




	


