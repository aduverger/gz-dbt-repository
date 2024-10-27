with 

source as (

    select * from {{ source('crm', 'sales') }}

),

renamed as (

    select
        _line,
        date_date,
        orders_id,
        pdt_id,
        quantity,
        CAST(REPLACE(revenue, ',', '.') AS FLOAT64) AS revenue,
    from source

)

select * from renamed
