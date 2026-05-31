

SELECT
    hotel_name,
    city,
    country,
    COUNT(*) as total_bookings,
    SUM(CASE WHEN is_cancelled = 'False' THEN 1 ELSE 0 END) as confirmed_bookings,
    SUM(CASE WHEN is_cancelled = 'True' THEN 1 ELSE 0 END) as cancelled_bookings,
    ROUND(AVG(TRY_CAST(total_price AS FLOAT)), 2) as avg_total_price,
    ROUND(SUM(CASE WHEN is_cancelled = 'False' THEN TRY_CAST(total_price AS FLOAT) ELSE 0 END), 2) as total_revenue,
    ROUND(AVG(TRY_CAST(nights AS FLOAT)), 1) as avg_nights
FROM [HappyBooking_Lakehouse].[dbo].[hotel_raw_stream]
GROUP BY hotel_name, city, country