with

    sales_products as (select * from {{ ref("int_sales_products") }}),

    sales_per_product as (
        select
            product_id,
            count(quantity) as quantity,
            round(sum(total_purchase_price), 2) as purchase_price,
            round(sum(revenue), 2) as revenue,
            round(sum(margin), 2) as margin,
        from sales_products
        group by 1
        order by 1
    )

select *
from sales_per_product
