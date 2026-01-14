select
    order_id,
    delivered_customer_at
from {{ ref('stg_olist__orders') }}
-- If any delivery date is after the moment this test runs, it's a fail
where delivered_customer_at > current_timestamp