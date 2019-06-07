{{
    config(
        materialized = 'table'
    )
}}
with orders_items as (
    
    select * from {{ ref('orders_items')}}

),
final as (
    select 

        o.order_item_key,
        o.order_key,
        o.order_date,
        o.customer_key,
        o.order_status_code,
        
        o.part_key,
        o.supplier_key,
        o.return_status_code,
        o.order_line_number,
        o.order_line_status_code,
        o.ship_date,
        o.commit_date,
        o.receipt_date,
        o.ship_mode_name,

        o.quantity,
        
        o.extended_price,

        o.discount_amount,
        o.tax_amount,
        o.total_amount

    from
        orders_items o
)
select 
    f.*,
    {{ dbt_housekeeping() }}
from
    final f
order by
    f.order_date