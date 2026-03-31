select
   f.date_date,
   f.total_average_basket as average_basket,
   f.total_operational_margin as operational_margin,
   f.total_operational_margin as margin,
   f.total_revenue as revenue,
   f.total_purchase_cost as purchase_cost,
   f.total_quantity_product_sold as quantity,
   f.total_shipping_fee as shipping_fee,
   f.total_logcost as logcost,
   f.total_ship_cost as ship_cost,
   i.ads_cost as ads_cost,
   i.ads_impression as ads_impression,
   i.ads_click as ads_click,
   round((f.total_operational_margin-i.ads_cost),2) as ads_margin
   from {{ ref('finance_days') }} as f
   left join {{ ref('int_campaigns_day') }} as i
   on f.date_date=i.date_date