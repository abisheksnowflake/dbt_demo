WITH daily_weather AS (
    SELECT clouds, humidity, pressure, temp, time, weather FROM {{ source('demo', 'weather') }}
),
agg_weather AS (
    SELECT AVG(humidity) OVER (PARTITION BY TO_DATE(time)) AS hum
    FROM daily_weather
)
SELECT * FROM agg_weather