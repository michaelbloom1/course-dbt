{{
    config(
        materialized = 'table'
    )
}}

with source as (
    select * from {{ source('postgres', 'events') }}
)

, renamed_recast as (
    select 
        event_id
        , session_id
        , user_id
        , event_type
        , page_url
        , created_at
        , order_id
        , product_id
    from source
)

select * from renamed_recast