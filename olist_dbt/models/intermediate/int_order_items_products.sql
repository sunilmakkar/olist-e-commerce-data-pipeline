with items as (
    select * from {{ ref('stg_olist__order_items') }}
),

products as (
    select * from {{ ref('stg_olist__products') }}
),

categories as (
    select * from {{ ref('stg_olist__category_translations') }}
),

joined as (
    select
        items.order_item_key,
        items.order_id,
        items.product_id,
        items.seller_id,
        items.price,
        items.freight_amount,
        products.product_category_name as category_name_pt,
        -- Missing translations fix
        COALESCE(
            categories.category_name_en,
            case
                when products.product_category_name = 'pc_gamer' then 'pc_gamer'
                when products.product_category_name = 'portateis_cozinha_e_preparadores_de_alimentos' then 'kitchen_portables_and_food_preparators'
                else 'unknown_portuguese_category'
            end 
        ) as category_name_en
    from items
    left join products 
        on items.product_id = products.product_id
    left join categories 
        on products.product_category_name = categories.category_name_pt
)

select * from joined