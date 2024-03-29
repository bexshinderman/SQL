/****** Script for SelectTopNRows command from SSMS  

SELECT TOP (1000) [PaperID]
      ,[SemesterID]
      ,[PersonID]
  FROM [IN705_201902_kwood].[dbo].[Enrolment]
  
  Week 2 labs are due on Friday 16 August

 13.1 Develop a stored procedure [EnrolmentCount] that accepts a paperID
		and a semesterID and calculates the number of enrolments in the 
		relevant paper instance. It returns the enrolment count as an
		output parameter.

		*/
		
		create procedure EnrolmentCounter(@PaperID nvarchar(10), @SemesterID char(6))
		as
		begin
		select count(PersonID) from Enrolment where SemesterID = @SemesterID and PaperID = @PaperID
		end

		go
		select * from Enrolment;
		exec EnrolmentCounter @SemesterID = '2017S1', @PaperID = 'IN238'; /* stop trying to use brackets here! */

	
		/*
13.2	Re-develop stored procedure [EnrolmentCount] so that semesterID
		is optional and defaults to the current semester. If there is no
		current semester, it chooses the most recent semester. */

		alter procedure EnrolmentCounterOpt(@PaperID nvarchar(10), @SemesterID char(6) = '2021S1')
		as
		begin
		select count(PersonID) from Enrolment where SemesterID = @SemesterID and PaperID = @PaperID
		end

		go
		select * from Enrolment;
		exec EnrolmentCounterOpt  'IN238';


		create proc getEnrolmentByDate(@date datetime = null)
		as
		begin
		if @date is null set @date = getdate()
		select * from Enrolment
		join Semester on Enrolment.SemesterID = Enrolment.SemesterID
		where @date between Semester.StartDate and Semester.EndDate
		end
		Go
 
 exec getEnrolmentByDate
  exec getEnrolmentByDate '12-August-2017'

13.3  Write the script you will need to test 13.2 hint: you may have to cast your output.
	
		/* unsure what is meant by test - need to clarify */