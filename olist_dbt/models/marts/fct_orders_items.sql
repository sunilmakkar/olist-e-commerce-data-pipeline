with order_items as (
    select * from {{ ref('int_order_items_products') }}
),

orders as (
    select * from {{ ref('stg_olist__orders') }}
),

final as (
    select
        order_items.order_item_key,
        order_items.order_id,
        order_items.product_id,
        order_items.seller_id,
        orders.customer_id,
        orders.purchased_at,
        order_items.price,
        order_items.freight_amount,
        order_items.category_name_en
    from order_items
    inner join orders on order_items.order_id = orders.order_id
)

select * from final