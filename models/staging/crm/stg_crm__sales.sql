with 

source as (

    select * from {{ source('crm', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id,
        quantity,
        CAST(REPLACE(revenue, ',', '.') AS FLOAT64) AS revenue,
    from source

)

select * from renamed
