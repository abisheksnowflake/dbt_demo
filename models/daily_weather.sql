WITH daily_weather AS
(SELECT 
    TO_DATE(time) AS weather_date,
    weather,
    COUNT(weather) AS counts
 FROM {{ source('demo', 'weather')}}
 GROUP BY TO_DATE(time), weather),
prominant_weather AS
(SELECT 
    weather_date,
    weather
FROM daily_weather
    QUALIFY ROW_NUMBER() OVER(PARTITION BY weather_date ORDER BY counts desc) = 1
),
weather_info AS
(SELECT
    TO_DATE(time) AS weather_date,
    round(AVG(clouds),2) AS avg_clouds,
    round(AVG(humidity),2) AS avg_humidity,
    round(AVG(pressure),2) AS avg_pressure,
    round(AVG(temp),2) AS avg_temp 
FROM {{ source('demo', 'weather') }}
GROUP BY TO_DATE(time))
SELECT p.weather_date, weather, avg_clouds, avg_humidity, avg_pressure, avg_temp FROM weather_info w JOIN prominant_weather p ON w.weather_date = p.weather_date
ORDER BY w.weather_date
