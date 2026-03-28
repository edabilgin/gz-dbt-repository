with orders_margin as ( 
    select * from 
{{ ref('int_orders_margin') }}
), 
shipping as ( 
    select * from 
{{ ref('stg_raw__ship') }} 
) 
select 
    o.orders_id, 
    o.date_date, 
    round(cast(o.margin as float64) + cast(sh.shipping_fee as float64) - (cast(sh.logcost as float64) + cast(sh.ship_cost as float64)), 2) as operational_margin, 
    o.revenue, 
    o.purchase_cost, 
    o.margin,
    o.quantity,
    sh.shipping_fee, 
    sh.logcost, 
    sh.ship_cost 
from orders_margin o 
left join shipping sh using (orders_id)