with items as (
    select * from {{ ref('stg_olist__order_items') }}
),

products as (
    select * from {{ ref('stg_olist__products') }}
),

joined as (
    select
        items.order_item_key,
        items.order_id,
        items.product_id,
        items.seller_id,
        items.price,
        items.freight_amount
        -- Descriptive attributes (category_name_en, etc.) are removed.
        -- They are now handled in the dim_products table.
    from items
    left join products 
        on items.product_id = products.product_id
)

select * from joined