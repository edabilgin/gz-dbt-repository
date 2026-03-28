{{ config(materialized='table') }}
with finance_days as(
    select
        date_date,
        count(orders_id) as number_of_transactions,
        round(sum(revenue),2) as total_revenue,
        round(sum(revenue)/count(orders_id),2) as average_basket,
        round(sum(operational_margin),2) as total_operational_margin,
        round(sum(purchase_cost),2) as total_purchase_cost,
        round(sum(shipping_fee),2) as total_shipping_fee,
        round(sum(logcost),2) as total_logcost,
        sum(quantity) as total_quantity_product_sold
    from {{ ref('int_orders_operational') }}
    group by date_date 
    )
    select * from finance_days
    order by date_date desc
