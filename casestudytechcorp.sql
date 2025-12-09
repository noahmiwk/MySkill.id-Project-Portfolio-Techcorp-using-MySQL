-- case study 1: top customers
select
c. first_name,
c. last_name,
sum(o.total_amount) total_order_amount
from Customers as c
join Orders o ON o.customer_id = c.customer_id
group by c.customer_id
order by total_order_amount desc
limit 3
;

-- case study 2: avg order
select
c.first_name,
c.last_name,
avg(total_amount) average_order
from customers c
join Orders o on c.customer_id = o.customer_id
group by c.customer_id
;

-- case study 3: employees with >4 support tickets
select
e.first_name,
e.last_name,
count(s.ticket_id)
from Employees e
join SupportTickets s on e.employee_id = s.employee_id
where s.status = 'resolved'
group by e.employee_id
having count(s.ticket_id)>4
;

-- case study 4: produk yg blm pernah dipesan
select
products.product_name
from Products
left join OrderDetails od on od.product_id = products.product_id
where od.order_id is null
;

-- case study 5: total revenue
select
sum(quantity*unit_price)
from orderDetails;

-- case study 6: average price products
with cte_avg_price as (
	select category, avg(price) ratarata
    from products
    group by category
    )
select * from cte_avg_price where ratarata > 500
;

-- case study 7: pelanggan order lebih dr 1000
select *
from customers
where
customer_id in (
	select customer_id
    from orders
    where total_amount > 1000
    )
    ;
