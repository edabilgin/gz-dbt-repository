with sales_margin as ( 
    select * from 
{{ ref('int_sales_margin') }}
), 
shipping as ( 
    select * from 
{{ ref('stg_raw__ship') }} 
) 
select 
    s.orders_id, 
    s.date_date, 
    round(cast(s.margin as float64) + cast(sh.shipping_fee as float64) - (cast(sh.logcost as float64) + cast(sh.ship_cost as float64)), 2) as operational_margin, 
    s.revenue, 
    s.purchase_cost, 
    s.margin, 
    sh.shipping_fee, 
    sh.logcost, 
    sh.ship_cost 
from sales_margin s 
left join shipping sh using (orders_id)