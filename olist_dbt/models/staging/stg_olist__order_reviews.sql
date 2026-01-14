with source as (
    select * from {{ source('olist_raw', 'order_reviews') }}
),

renamed as (
    select
        review_id,
        order_id,
        review_score,
        review_comment_title,
        review_comment_message,
        review_creation_date as reviewed_at,
        review_answer_timestamp as review_answered_at
    from source
)

select * from renamed