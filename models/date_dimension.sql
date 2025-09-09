WITH cte AS (
    SELECT  
        TO_TIMESTAMP(started_at) AS started_at,
        DATE(TO_TIMESTAMP(started_at)) AS date_started_at,
        HOUR(TO_TIMESTAMP(started_at)) AS hour_started_at,
        CASE WHEN DAYNAME(TO_TIMESTAMP(started_at)) IN ('Sat', 'Sun') THEN 'weekend' ELSE 'businessday' END AS day_type,
        CASE WHEN MONTH(TO_TIMESTAMP(started_at)) IN (12, 1, 2) THEN 'winter' WHEN MONTH(TO_TIMESTAMP(started_at)) IN (3, 4, 5) THEN 'spring' WHEN MONTH(TO_TIMESTAMP(started_at)) IN (6, 7, 8) THEN 'summer' ELSE 'autumn' END AS season  
     FROM {{ source('demo', 'bike') }}
    WHERE started_at != 'started_at'
)
SELECT * FROM cte
