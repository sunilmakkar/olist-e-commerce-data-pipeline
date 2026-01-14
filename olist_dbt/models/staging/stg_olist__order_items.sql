with source as (
    select * from {{ source('olist_raw', 'order_items') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_id', 'order_item_id'])}} as order_item_key,
        order_id,
        product_id,
        seller_id,
        shipping_limit_date as shipping_limit_at,
        price,
        freight_value as freight_amount
    from source
)

select * from renamed