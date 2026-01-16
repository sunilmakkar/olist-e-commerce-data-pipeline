with source as (
    select * from {{ source('olist_raw', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        order_status as status,
        {{ cast_to_timestamp([
            'order_purchase_timestamp', 
            'order_approved_at', 
            'order_delivered_carrier_date', 
            'order_delivered_customer_date', 
            'order_estimated_delivery_at'
        ]) }}
    from {{ source('olist_raw', 'orders') }}
)

select * from renamed