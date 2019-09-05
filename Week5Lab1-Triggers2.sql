/*
Using Transact-SQL : Exercises
------------------------------------------------------------

Exercises for section 11 : TRIGGER

*In all exercises, write the answer statement and then execute it.

*Before you start, run these statements against your database:

		create table [Password](
			PersonID nvarchar(16) not null primary key,
			pwd char(4) not null default left(newID(), 4)  --automatically create a new password
			constraint [fk_password_person] foreign key (PersonID) references Person (PersonID) 	
			on delete cascade on update cascade 			
			)

		insert Person (PersonID, GivenName, FamilyName, FullName)
		values ('122', 'Krissi', 'Wood', 'Krissi Wood')

		drop table Withdrawn

		create table Withdrawn(
			PaperID nvarchar(10) not null,
			SemesterID char(6) not null,
			PersonID nvarchar(16) not null,
			WithdrawnDateTime datetime not null default getdate()
			constraint [pk_withdrawn] primary key (PaperID, SemesterID, PersonID)
			)


e11.1		Create a trigger that reacts to new records on the Person table. 
			The trigger creates new related records on the Password table, automatically creating passwords.
			*/

			select * from Person;
			select * from Password;
			insert into Person(PersonID, GivenName, FamilyName, FullName) values('1111', 'Sally', 'Briggs', 'Sally Briggs');

			
	insert into Person(PersonID, GivenName, FamilyName, FullName)
	values ('s', 'B', 'S', 'R');

			alter trigger updatePerson on Person
			after insert
			as
			begin
				insert Password(PersonID, pwd)
				select PersonID, 'insert' from Password 
			end
			go


			/*
		
		

e11.2		Create a trigger that reacts to new paper instances
			by automatically making an enrolment for Krissi Wood in those paper instances
			
			drop trigger trigPaperInstanceInsert

			*/
			select * from PaperInstance; 
			select * from Paper;
			select * from Enrolment;

			insert PaperInstance values('IN628', '2019S2');

			create trigger autoEnrol on PaperInstance
			after insert
			as
			begin 
			insert Enrolment(PaperID, PersonID, SemesterID)
			select PaperID, '122', SemesterID  from inserted
			end 
			go
			

			
	/*		

			

e11.3		Create two triggers that record the people who withdraw or dropout of a paper 
			when it is running [compare the system date to the semester dates].
			The details of the withdrawl should be posted to the Withdrawn table.
			*/

			create table deletedEnrolments1
			(
			personsID varchar(100),
			fullnames varchar(100)
			)
			select * from deletedEnrolments1
			
			drop table deletedEnrolments1;
 /* reread the question and discovered the Withdrawn table. Above is workings */


		
			begin 
			insert Withdrawn(PaperID, SemesterID, PersonID, WithdrawnDateTime) 
			select Enrolment.PaperID, Enrolment.SemesterID, Enrolment.PersonID, WithdrawnDateTime from 
			Enrolment, Withdrawn
			end 
			go

			delete from Enrolment WHERE PersonID = 'shinrl1';

			/* arrrgh! two triggers! read the question!!!!!!! */
			create trigger WithdrawnTime 
			on Withdrawn
			after insert, update
			as update Withdrawn SET WithdrawnDateTime = CURRENT_TIMESTAMP
			from inserted 
			go

			alter trigger InsertWithdrawn
			on Enrolment
			after delete
			as 
			insert Withdrawn(PaperID, SemesterID, PersonID) 
			select PaperID, SemesterID, PersonID
			from Deleted
			go

			select * from Enrolment;

			delete from Withdrawn 
			where PaperID = 'IN605' and SemesterID = '2019S2'and PersonID = '104';

			delete from Enrolment 
			where PaperID = 'IN605' and SemesterID = '2019S2'and PersonID = '104';

			select * from Withdrawn;

			/* WithdrawnTime trigger is updating every single field in Withdrawn, InsertWithdrawn trigger is working as should (I think)*/







1.	If a student can withdraw from a paper, then re-enrol, then withdraw again in one single semester.
	BTW: this is NOT how things run at Otago Polytechnic.

				--if person already has a withdrawn record for this paper instance
				--insert will cause a PK violation, so
				--delete the existing record before inserting new record

			/* workings for 1 & 2 are above, see InsertWithdrawn and WithdrawnTime triggers */


2.	If a student can withdraw from the paper only one time in a single semester
	BTW: this is what happens at OP. Drop or disable the previous trigger.





e11.4		Enhance the mechanism from e11.1 so that it also reacts when 
			a person's PersonID is modified. 
			In this case, the system must generate a new password for the modified PersonID.

	*/		