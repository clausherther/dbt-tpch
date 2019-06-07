{{
    config(
        materialized = 'table'
    )
}}
with orders as (
    
    select * from {{ ref('orders')}}

),
final as (

    select 
    
        o.order_key, 
        o.order_date,
        o.customer_key,
        o.order_status_code,
        o.order_priority_code,
        o.order_clerk_name,
        o.shipping_priority,
        o.order_amount

    from
        orders o
)
select 
    f.*,
    {{ dbt_housekeeping() }}
from
    final f
order by
    f.order_date