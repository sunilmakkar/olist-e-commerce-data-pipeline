with sellers as (
    select * from {{ ref('stg_olist__sellers') }}
)

select
    seller_id,
    zip_code as seller_zip_code,
    city as seller_city,
    state as seller_state
from sellers