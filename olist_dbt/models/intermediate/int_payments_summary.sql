with payments as (
    select * from {{ ref('stg_olist__order_payments') }}
),

aggregated as (
    select
        order_id,
        sum(amount) as total_payment_value,
        count(payment_sequential) as payment_installments_count
    from payments
    group by 1
)

select * from aggregated