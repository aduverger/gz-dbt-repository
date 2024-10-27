with
    sales as (select * from {{ ref("stg_crm__sales") }}),

    sales_with_total_revenue as (
        select *, (quantity * revenue) as total_revenue, from sales
    )

select *
from sales_with_total_revenue
