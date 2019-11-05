DECLARE @ListOfStudents Table (
[rowNumber] int NOT NULL identity(1,1), [LastName] varchar(100) NULL, 
[FirstName] varchar(100) NULL,
 [Username] varchar(100) NULL, 
[UserPassword] varchar(100) NULL
)
INSERT INTO @ListOfStudents (LastName, FirstName, Username, UserPassword) SELECT LastName, FirstName, Username, password FROM dbo.Databaseusers

IF EXISTS (SELECT * FROM @listOfStudents) 
BEGIN 
		DECLARE @dbFilePath nvarchar(2000) 
		DECLARE @dbLogPath nvarchar(2000)
		DECLARE @createFolderXP nvarchar(2000) 
		DECLARE @domainLogin nvarchar(30) 
		DECLARE @prefix nvarchar(200)
		DECLARE @dbName nvarchar(1000)

		DECLARE @logicalDataName nvarchar(600) 
		DECLARE @logicalLogName nvarchar(600) 
		DECLARE @dataFileName nvarchar(600) 
		DECLARE @logFileName nvarchar(600)

		DECLARE @dataSize nvarchar(500) 
		DECLARE @dataMaxSize nvarchar(500) 
		DECLARE @dataFileGrowth nvarchar(500) 
		DECLARE @logSize nvarchar(500) 
		DECLARE @logMaxSize nvarchar(500) 
		DECLARE @logFileGrowth nvarchar(500)
		DECLARE @exeTemp nvarchar(4000)

		DECLARE @currentRow int;
		DECLARE @maximumRows int;
		set @currentRow = 0;
		set @maximumRows = (select count(*) from @ListOfStudents)
		DECLARE @_Login nvarchar(100), @_Password nvarchar(100), @_DefaultDatabase nvarchar(100)
		DECLARE @ExecTemp nvarchar(1000)

       WHILE @currentRow <= @maximumRows
 		BEGIN 
		Select @_Login = Username, @_Password = UserPassword FROM @listOfStudents WHERE rowNumber = @currentRow
		SET @_DefaultDatabase = @_Login
		
		
				BEGIN
				SET @ExecTemp = 'CREATE LOGIN ' + @_Login + ' WITH PASSWORD = ''' + @_Password + ''', DEFAULT_DATABASE = ' + @_DefaultDatabase 
				PRINT (@ExecTemp)
				EXEC (@ExecTemp)

				END

				set @dbName = @_Login
				set @dbFilePath ='/var/opt/mssql/data/'
				set @dbLogPath = '/var/opt/mssql/data/'
				set @dataSize = '8'
				set @dataMaxSize = '17408'
				set  @dataFileGrowth = '8192'
				set @logSize = '8'
				set @logMaxSize = '17408'
				set @logFileGrowth = '8192'

		BEGIN
			PRINT('Begin create database')
			SET @LogicalDataName=@DBName + '_dat'
			SET @DataFileName= @dbFilePath + @DBName + '.mdf'
			SET @LogicalLogName=@DBName + '_log'
			SET @LogFileName= @dbLogPath + @DBName + '.ldf'
	
			SET @exeTemp = 'CREATE DATABASE ' + @DBName + ' ON ('
			+ 'NAME = [' + @LogicalDataName + '], '
			+ 'FILENAME = [' + @DataFileName + '], '
			+ 'SIZE = ' + @DataSize + ', '
			+ 'MAXSIZE = ' + @DataMaxSize + ', '
			+ 'FILEGROWTH = ' + @DataFileGrowth + ') '
			+ 'LOG ON ('
			+ 'NAME = [' + @LogicalLogName + '], '
			+ 'FILENAME = [' + @LogFileName + '], '
			+ 'SIZE = ' + @LogSize + ', '
			+ 'MAXSIZE = ' + @LogMaxSize + ', '
			+ 'FILEGROWTH = ' + @LogFileGrowth + ') ' 
			PRINT('Creating database ' + @DBName)
			PRINT(@exeTemp)
			exec(@exeTemp);
		END

		print @currentRow
		SET @exeTemp='USE ' + @DBName + ' CREATE LOGIN [' + @_Login + '] FOR LOGIN [' + @_Login + ']'
		exec(@exeTemp);
		SET @currentRow += 1;
	SELECT * FROM @ListOfStudents
end
end
