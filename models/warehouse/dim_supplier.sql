{{
    config(
        materialized = 'table'
    )
}}
with suppliers as (

    select * from {{ ref('suppliers')}}

),
final as (

    select 
        s.supplier_key,
        s.supplier_name,
        s.supplier_address,
        s.supplier_nation_key,
        s.supplier_phone_number,
        s.supplier_account_balance
    from
        suppliers s
)
select 
    f.*,
    {{ dbt_housekeeping() }}
from
    final f
order by
    f.supplier_key