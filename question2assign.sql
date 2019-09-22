/* question 2 */


create proc createQoute(@QouteID int output, --first sp, all good in my books
						@QouteDescription varchar(500) = "N/A",
						@QouteDate date = null,
						@QoutePrice money,
						@QouteCompiler varchar(100),
						@CustomerID int)
as
if @QouteDate is null set @QouteDate = current_timestamp
insert into Qoute (QouteID, QouteDescription, QouteDate, QoutePrice, QouteCompiler, CustomerID)
values (@QouteID, @QouteDescription, @QouteDate, @QoutePrice, @QouteCompiler, @CustomerID)
go	

set identity_insert Qoute on --testing first sp
exec createQoute @QouteID = 32, @QouteDescription = 'i am a description',@QouteDate = null, @QoutePrice = '$4', @QouteCompiler = 'Jenifer', @CustomerID = '22';
--adds to Qoute table as intended
end


alter proc addQouteComponent(@ComponentID int,@QouteID int, @Quantity int)
as -- because timetofit was a decimal and one data type I decided to forfit obtaining TimeToFit dynamically and thus added @TimeToFit as an input parameter.
declare @ComponentID2 int
set @ComponentID2 = @ComponentID
declare @TradePrice2 money
set @TradePrice2 = (select TradePrice from Component where ComponentID = @ComponentID2 )
declare @ListPrice2 money
set @ListPrice2 = (select ListPrice from Component where ComponentID = @ComponentID2) 
declare @TimeToFit2 decimal
set @TimeToFit2 = (select TimeToFit from Component where ComponentID = @ComponentID2)

insert into  QouteComponent (ComponentID, QouteID, Quantity, TradePrice, ListPrice, TimeToFit)
values (@ComponentID, @QouteID, @Quantity, @TradePrice2, @ListPrice2, @TimeToFit2) 
go	


set identity_insert Qoute on --testing first sp
exec createQoute @QouteID = 13, @QouteDescription = 'testing' , @QoutePrice = '$4', @QouteCompiler = 'Jenifer', @CustomerID = '23';
exec addQouteComponent  @ComponentID =30906, @QouteID = 33, @Quantity = 100; 

select * from QouteComponent;

select * from Qoute
select * from QouteComponent
select * from Component



--helper functions for second sp
/* helper functions nolonger in use
create function dbo.getTradePrice(@ComponentID2 int)
returns money
as
begin
return (select TradePrice from Component where ComponentID = @ComponentID2  )
end
go

select dbo.getTradePrice (30901)

create function dbo.getListPrice(@ComponentID2 int)
returns money
as
begin
return (select ListPrice from Component where ComponentID = @ComponentID2  )
end
go

select dbo.getListPrice (30901)
drop function dbo.getTimeToFit
create function dbo.getTimeToFit(@ComponentID2 int)
returns decimal
as
begin
return (select TimeToFit from Component where ComponentID = @ComponentID2  ) 
end
go
select * from component
select dbo.getTimeToFit(30901) */



