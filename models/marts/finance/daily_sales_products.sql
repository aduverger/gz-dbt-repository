with

    sales_products as (select * from {{ ref("int_sales_products") }}),

    daily_sales_products as (
        select
            date_date,
            count(quantity) as daily_quantity,
            sum(total_purchase_price) as daily_purchase_price,
            sum(revenue) as daily_revenue,
            sum(margin) as daily_margin,
        from sales_products
        group by 1
        order by 1
    )

select *
from daily_sales_products
