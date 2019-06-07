{{
    config(
        materialized = 'table'
    )
}}
with suppliers as (

    select * from {{ ref('base_supplier')}}

)
select 
    s.*
from
    suppliers s
order by
    s.supplier_key