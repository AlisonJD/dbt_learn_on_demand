with dbt_customers as (
SELECT
    id as customer_id,
    first_name,
    last_name 

FROM `crested-timer-319112.dbt_adavey.customers`
)
select * from dbt_customers