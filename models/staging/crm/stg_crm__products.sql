with 

source as (

    select * from {{ source('crm', 'products') }}

),

renamed as (

    select
        products_id as product_id,
        purch_se_price as purchase_price

    from source

)

select * from renamed
