with
    sales as (select * from {{ ref("int_sales_with_product_prices") }}),

    daily_sales as (
        select
            date_date,
            sum(quantity) as quantity,
            cast(sum(total_products_price) as int64) as total_products_price,
            cast(sum(revenue) as int64) as total_revenue
        from sales
        group by 1
        order by 1
    )

select *
from daily_sales
