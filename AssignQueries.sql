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
print @ContactID;

go

set identity_insert Contact on
exec createCustomer @CustomerID='25' , @Name='Bex Shinderman1', @Phone ='0210000000', @Email='bex.shinderman@gmail.com',@PostalAddress= '42 Stardew Valley'

go

select * from Customer;
select * from Contact;