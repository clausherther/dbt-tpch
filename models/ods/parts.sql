{{
    config(
        materialized = 'table'
    )
}}
with parts as (

    select * from {{ ref('base_part')}}

)
select 
    p.*
from
    parts p
order by
    p.part_key