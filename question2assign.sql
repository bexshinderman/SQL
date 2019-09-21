/* question 2 */


create proc createQoute(@QouteID int output,
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


	
	set identity_insert Qoute on
	exec createQoute @QouteID = 32, @QouteDescription = 'i am a description',@QouteDate = null, @QoutePrice = '$4', @QouteCompiler = 'Jenifer', @CustomerID = '22';

	select * from Qoute
end



alter proc addQouteComponent(@QouteID int output,
							@ComponentID int,
							@Quantity int
							@TradePrice money
							@TimeToFit time)
as
exec createQoute @QouteID = @QouteID, @QouteDate = null, @QoutePrice = '$4', @QouteCompiler = 'Jenifer', @CustomerID = '40'
insert into QouteComponent(ComponentID, QouteID, Quantity, TradePrice, ListPrice, TimeToFit)
values (@QouteID, @ComponentID, @Quantity)
go

exec addQouteComponent @QouteID = 100, @ComponentID = 100, @Quantity = 100;