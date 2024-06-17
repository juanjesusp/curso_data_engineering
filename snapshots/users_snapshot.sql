{% snapshot users_snapshot %}

{{
    config(
      unique_key='NK_user_id',
      strategy='timestamp',
      updated_at='user_updated_at',
      invalidate_hard_deletes=True,
    )
}}


with users as (
    select 
        {{ dbt_utils.generate_surrogate_key(['user_id', 'updated_at']) }} as user_id,
        user_id as NK_user_id,
        first_name,
        last_name,
        replace(phone_number,'-','')::number as phone_number,
        address_id as NK_address_id,
        email,
        year(to_date(created_at))*10000+month(to_date(created_at))*100+day(to_date(created_at)) as user_created_at_date_id,
        to_date(created_at) as user_created_at_date,
        to_time(created_at) as user_created_at,
        updated_at as user_updated_at,
        _fivetran_deleted,
        _fivetran_synced

    from {{ source("sql_server_dbo", "users") }} where _fivetran_deleted = false or _fivetran_deleted is null
)

select * from users

{% endsnapshot %}