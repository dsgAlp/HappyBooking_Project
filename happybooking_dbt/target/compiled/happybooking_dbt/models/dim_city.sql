

SELECT DISTINCT
    country,
    city,
    hotel_name,
    hotel_type,
    star_rating
FROM [HappyBooking_Lakehouse].[dbo].[hotel_raw_stream]
WHERE country IS NOT NULL