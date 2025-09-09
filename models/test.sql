SELECT * FROM {{ ref('my_second_dbt_model') }}
LIMIT 10