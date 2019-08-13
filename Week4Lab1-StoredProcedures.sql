/*
Using Transact-SQL : Exercises
------------------------------------------------------------

Exercises for section 12 : STORED PROCEDURE

*In all exercises, write the answer statement and then execute it.



e12.1		Create a SP that returns the people with a family name that 
			starts with a vowel [A,E,I,O,U]. List the PersonID and the FullName.

			*/
			select * from Person;

			create procedure getVowel3 /* in future queries use ALTER instead of renaming!! */
			as
			select PersonID, FullName, FamilyName from Person where substring(FullName, 1, 1) = 'A'
			or substring(FamilyName, 1, 1) = 'E' 
			or substring(FamilyName, 1, 1) = 'I'
			or substring(FamilyName, 1, 1) = 'O' 
			or substring(FamilyName, 1, 1) = 'U' group by PersonID, FullName, FamilyName;

			exec getVowel3; /* rewritten to be more elegant - use like instead of 5 where's */

			create procedure getVowelRedo as
			select PersonID, FullName, FamilyName 
			from Person 
			where substring(FamilyName, 1, 1) LIKE '[AEIOU]%'

			exec getVowelRedo;
			/*
		
			

e12.2		Create a SP that accepts a semesterID parameter and returns the papers that
			have enrolments in that semester. List the PaperID and PaperName.

			*/
			select * from Enrolment;
			select  * from PaperInstance;

			alter procedure EnroledIn1(@semesterID nvarchar(10))  /* sooooo important to specify the length of variable!! */
			as
			select * from Enrolment 
			join 
			Paper on Enrolment.PaperID = Paper.PaperID where SemesterID = @semesterID
			go

			exec EnroledIn1 '2021S1';
			go

			/*
e12.3		Create a SP that creates a new semester record. the user must supply all
			appropriate input parameters. */

			alter procedure CreateNewSemester(@SemesterID nvarchar(10), @StartDate datetime, @EndDate datetime) 
			as
			insert into Semester values(@SemesterID, @StartDate, @EndDate)
			go

			exec CreateNewSemester '2029S1', '02-Feb-2019', '06-June-2019';
			exec CreateNewSemester '2039S1', '02-Feb-2019', '06-June-2019';

			select * from Semester;

			
