with dbt_customers as (
    SELECT * FROM {{ref("stg_customers")}}
),

dbt_orders as (
    SELECT * FROM {{ref("fct_orders")}}
),

dbt_customer_orders as (
    SELECT 
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value
    FROM dbt_orders
    GROUP BY 1
),

final as (
    SELECT 
        dbt_customers.customer_id,
        dbt_customers.first_name,
        dbt_customers.last_name,
        dbt_customer_orders.first_order_date,
        dbt_customer_orders.most_recent_order_date,
        coalesce(dbt_customer_orders.number_of_orders, 0) as number_of_orders 
    FROM dbt_customers 
    
    LEFT JOIN dbt_customer_orders using (customer_id)
)
select * from final