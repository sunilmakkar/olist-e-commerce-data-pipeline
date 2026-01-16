with products as (
    select * from {{ ref('stg_olist__products') }}
),

translations as (
    select * from {{ ref('stg_olist__category_translations') }}
),

final as (
    select
        products.product_id,
        products.product_category_name as category_name_pt,
        coalesce(translations.category_name_en, 'unknown_category') as category_name_en,
        products.product_name_length,
        products.product_description_length,
        products.product_photos_qty,
        products.product_weight_g,
        products.product_length_cm,
        products.product_height_cm,
        products.product_width_cm
    from products
    left join translations 
        on products.product_category_name = translations.category_name_pt
)

select * from final