with 

products as (

    select * from {{ ref('stg_crm__products') }}

),

sales as (
    select * from {{ ref('stg_crm__sales')}}
),

sales_products as (
    select 
        date_date,
        pdt_id as product_id,
        orders_id,
        revenue,
        quantity,
        purchase_price,
        (quantity * purchase_price) as total_purchase_price,
        ROUND(revenue - quantity * purchase_price, 2) as margin,
    from products
    left join sales on products.products_id = sales.pdt_id
)

select * from sales_products