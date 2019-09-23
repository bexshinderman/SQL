/* Question 1 */

alter proc createCustomer( @CustomerID int output,
							@Name varchar(100), 
							@Phone varchar(30),
							@Fax varchar(100) = "Not Applicable",
							@MobilePhone varchar(30) = "Not Applicable",
							@Email varchar(100),
							@WWW varchar(200) = "Not Applicable",
							@PostalAddress varchar(500))
as
declare @ContactID int
set @ContactID = @CustomerID
insert Contact (ContactID, ContactName, ContactPhone, ContactFax, 
				ContactMobilePhone, ContactEmail, ContactWWW, ContactPostalAddress)
values (@CustomerID, @Name, @Phone, @Fax, @MobilePhone, @Email, @WWW, @PostalAddress)
insert Customer(CustomerID) values (@CustomerID)
select @ContactID as ContactID;

go

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
set identity_insert Qoute off
end
go


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


/* question 3 */
--identity k


set identity_insert Contact on
exec createCustomer @CustomerID='109' , @Name='Bimble & Hat', @Phone ='4445555', @Email='guy..little@bh.biz.nz',@PostalAddress= '123 digit st Dunedin'
set identity_insert Contact off
go
--identity k 
set identity_insert Qoute on 
exec createQoute @QouteID = 535, @QouteDescription = 'testing' , @QoutePrice = '$4', @QouteCompiler = 'Jenifer', @CustomerID = '104';
exec addQouteComponent  @ComponentID =30903, @QouteID = 535, @Quantity = 100; 
set identity_insert Qoute off



select * from Customer;
select * from QouteComponent
select * from Qoute;



/*question 5 trigsupplierdelete */

go


alter Trigger trd_delete On Supplier
instead of delete
as
--declare @SupplierName varchar(100)
--set @SupplierName = (Select ContactName from Contact c Join Supplier s on (s.SupplierID = c.ContactID) where s.SupplierID = c.ContactID)

declare @SupplierName varchar(100)  = (Select ContactName from Contact c join deleted d on c.ContactID = d.SupplierID)
  declare @Counts int
  set @Counts = (select count(Component.SupplierID) as [Count in Component] from Supplier left join Component on (Supplier.SupplierID = Component.SupplierID) )
  if (@Counts > 0) 
  raiserror( 'You cannot delete this supplier. %s has %i number of related components', 16, 1,  @SupplierName, @Counts)
  
 

  delete from Supplier where SupplierID = 5
 select * from Supplier;
 select * from Component;