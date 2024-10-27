with
    sales as (select * from {{ ref("stg_crm__sales") }}),

    products as (select * from {{ ref("stg_crm__products") }}),

    sales_with_product_prices as (
        select date_date, orders_id, revenue, product_id, quantity, purchase_price as product_price, (quantity * purchase_price) as total_products_price
        from sales
        left join products on sales.pdt_id = products.product_id
    )

select *
from sales_with_product_prices
