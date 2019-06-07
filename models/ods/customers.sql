{{
    config(
        materialized = 'table'
    )
}}
with customers as (

    select * from {{ ref('base_customer')}}

)
select 
    c.*
from
    customers c
order by
    c.customer_key