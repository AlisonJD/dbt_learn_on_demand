with dbt_orders as (
    SELECT 
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    FROM `crested-timer-319112.dbt_adavey.orders`
)

SELECT * FROM dbt_orders