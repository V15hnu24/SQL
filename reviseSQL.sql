/*
delete from invoices 
	where client_id = (
    select*
    from clients
    where name = 'Myworks')

using sql_stores
(update)
update  orders
set 
	comments = "gold"
where customer_id IN 
	(select customer_id
    from customers
    where points>3000)

using store
(Update)
update customers
set 
	points = points + 50
where birth_date < '1990-01-01'

Using invocing 
(Update)
update invoices 
set
	payment_total = invoice_total*0.5,
    payment_date = due_date
Where invoice_id = 3

using invoicing
(creating tables)
create table invoice_archived as
SELECT invoice_id, number,c.name , invoice_total, payment_total
from invoices i
join clients c using (client_id)
where payment_date is not null

(unions) 
select
	customer_id,
    first_name,
    points,
    'bronze' as type
from customers
where points<2000
union
select
	customer_id,
    first_name,
    points,
    'silver' as type
from customers
where points between 2000 and 3000
union 
select
	customer_id,
    first_name,
    points,
    'gold' as type
from customers
where points between 3000 and 5000
order by first_name

use store
(Cross joins)
select *
from shippers
cross join products
order by shipper_id

 
use sql_invocing
(using clause)
SELECT 
	p.date,
    c.name as client,
    p.amount,
    pm.name as paymentThrough
FROM payments p
JOIN clients c
	using (client_id) 
JOIN payment_methods pm 
	 on p.payment_method = pm.payment_method_id
*/