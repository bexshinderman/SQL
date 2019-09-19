/* question 2 */

create proc create proc createQoute(@QouteID int output,
						@QouteDescription varchar(500),
						@QouteDate varchar(date) = current_timestamp,
						@QoutePrice money,
						@QouteCompiler varchar(100),
						@CustomerID int)

			create proc addQouteComponent(@QouteID int,
										@ComponentID int,
										@Quantity int)