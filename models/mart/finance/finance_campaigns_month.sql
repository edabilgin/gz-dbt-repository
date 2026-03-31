select
    date_trunc(date_date,month) as date_month,
    sum(average_basket) as average_basket,
    sum(operational_margin) as operational_margin,
    sum(revenue) as revenue,
    sum(purchase_cost) as purchase_cost,
    sum(quantity) as quantity,
    sum(shipping_fee) as shipping_fee,
    sum(logcost) as logcost,
    sum(ship_cost) as ship_cost,
    sum(ads_cost) as ads_cost,
    sum(ads_impression) as ads_impression,
    sum(ads_click) as ads_click,
    sum(margin) as ads_margin
from {{ ref('finance_campaigns_day') }}
group by date_month
order by date_month desc