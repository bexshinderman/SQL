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
	values ('2018S1', 2018-02-02, 2018-06-06); /* executed */

	insert into PaperInstance values ('IN610', '2018S1'); /* executed */

	insert into Enrolment(PaperID, SemesterID, PersonID) /* executed */
	values('IN610', '2018S1', 'shinrl1');

	select * from Enrolment; /* confirms 3 insertions ^_^ */

	8.3 

	insert into Semester values ('2021S1', 2021-02-02, 2021-06-06); /*executed */

	delete from Semester WHERE SemesterID = '2021S1', StartDate = 2021-02-02, EndDate = 2021-06-06;

	insert into Semester values ('2021S1', '02-feb-2021', '06-june-2021');

	
	select * from Semester;