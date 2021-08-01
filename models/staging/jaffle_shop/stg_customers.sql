with dbt_customers as (
SELECT
    id as customer_id,
    first_name,
    last_name 

FROM {{ source('dbt_adavey', 'customers') }}
)
select * from dbt_customers