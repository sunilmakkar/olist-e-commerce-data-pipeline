with order_items_sum as (
    select
        order_id,
        round(sum(price + freight_amount), 2) as total_item_value
    from {{ ref('stg_olist__order_items') }}
    group by 1
),

order_payments_sum as (
    select
        order_id,
        round(sum(amount), 2) as total_payment_value
    from {{ ref('stg_olist__order_payments') }}
    group by 1
)

select
    i.order_id,
    i.total_item_value,
    p.total_payment_value
from order_items_sum i
join order_payments_sum p on i.order_id = p.order_id
-- We look for cases where the difference is more than 1 cent to account for rounding
where abs(i.total_item_value - p.total_payment_value) > 0.01