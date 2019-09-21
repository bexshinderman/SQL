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

alter proc addQouteComponent( -- second sp of weirdness
							@ComponentID int,	
							@QouteID int,
							@Quantity int)
as
insert into QouteComponent(ComponentID, QouteID, Quantity, TradePrice, ListPrice, TimeToFit)
values ( @ComponentID, @QouteID, @Quantity, 
'select TradePrice from Component where ComponentID = @ComponentID', 
'select ListPrice from Component where ComponentID = @ComponentID' ,
'select TradePrice from Component where ComponentID = @ComponentID') -- how do I make these execute??
go 
exec addQouteComponent @QouteID = 32, @ComponentID =3091, @Quantity = 100; -- returns "Cannot convert a char value to money"