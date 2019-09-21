create procedure createCustomer(@Name varchar(100), @Phone varchar(30), @Fax varchar(100) = 'Not Applicable', @MobilePhone varchar(100) = 'Not Applicable', @Email varchar(100), @WWW varchar(200) = 'Not Applicable', @PostalAddress varchar(200))
as
begin
insert  Contact (ContactName, ContactPhone, ContactFax, ContactMobilePhone, ContactEmail, ContactWWW, ContactPostalAddress)
values (@Name, @Phone, @Fax, @MobilePhone, @Email, @WWW, @PostalAddress)
print @


create procedure createCustomer(@Name varchar(100), @Phone varchar(30), @Fax varchar(100) = 'Not Applicable', @MobilePhone varchar(100) = 'Not Applicable', @Email varchar(100), @WWW varchar(200) = 'Not Applicable', @PostalAddress varchar(200))
insert Contact (ContactName, ContactPhone, ContactFax, ContactMobilePhone, ContactEmail, ContactWWW, ContactPostalAddress)
values (@Name, @Phone, @Fax, @MobilePhone, @Email, @WWW, @PostalAddress)
insert Customer (CustomerID) values (@ContactName)