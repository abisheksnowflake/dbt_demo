WITH trips AS (
    SELECT 
    ride_id,
    rideable_type,
    DATE(TO_TIMESTAMP(started_at)) AS trip_date,
    start_statio_id AS start_station_id,
    end_station_id,
    member_csual AS member_casual,
    TIMESTAMPDIFF(second, TO_TIMESTAMP(started_at), TO_TIMESTAMP(ended_at)) AS trip_duration_seconds
    FROM {{ source('demo', 'bike') }}
    WHERE ride_id != 'ride_id'
    LIMIT 10
)
SELECT * FROM trips