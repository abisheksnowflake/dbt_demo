WITH cte AS (
    SELECT  
        TO_TIMESTAMP(started_at) AS started_at,
        DATE(TO_TIMESTAMP(started_at)) AS date_started_at,
        HOUR(TO_TIMESTAMP(started_at)) AS hour_started_at,
        {{get_daytype('STARTED_AT')}} AS day_type,
        {{get_season('STARTED_AT')}} AS season 
     FROM {{ source('demo', 'bike') }}
    WHERE started_at != 'started_at'
)
SELECT * FROM cte
