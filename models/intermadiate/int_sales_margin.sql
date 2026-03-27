with sales as ( 
    select * from 
{{ ref('stg_raw__sales') }} 
), 
product as ( 
    select * from 
{{ ref('stg_raw__product') }} 
)
select 
    s.date_date, 
    s.orders_id, 
    s.products_id, 
    s.revenue, 
    s.quantity, 
    p.purchase_price, 
    round(cast(s.quantity as int64) * cast(p.purchase_price as float64), 2) as purchase_cost, 
    round(cast(s.revenue as float64) - (cast(s.quantity as int64) * cast(p.purchase_price as float64)), 2) as margin 
from sales s 
left join product p 
    on s.products_id = p.products_id