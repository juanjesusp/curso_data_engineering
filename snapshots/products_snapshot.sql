{% snapshot products_snapshot %}

{{
    config(
        strategy='check',
        unique_key='NK_product_id',
        check_cols=['product_name', 'product_price'],
        invalidate_hard_deletes=True,
    )
}}

with products as (
    select 
        {{ dbt_utils.generate_surrogate_key(['product_id', 'inventory','price']) }} as product_id,
        product_id as NK_product_id,
        name,
        price,
        _fivetran_synced

    
    from {{ source("sql_server_dbo", "products") }} where _fivetran_deleted = false or _fivetran_deleted is null
)

select * from products

{% endsnapshot %}
