with customers as (
    select * from {{ ref('stg_olist__customers') }}
)

select
    customer_id,
    customer_unique_id,
    city as customer_city,
    state as customer_state,
    zip_code as customer_zip_code
from customers