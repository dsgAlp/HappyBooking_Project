{{ config(materialized='table') }}

SELECT DISTINCT
    country,
    city,
    hotel_name,
    hotel_type,
    star_rating
FROM {{ source('fabric_source', 'hotel_raw_stream') }}
WHERE country IS NOT NULL
