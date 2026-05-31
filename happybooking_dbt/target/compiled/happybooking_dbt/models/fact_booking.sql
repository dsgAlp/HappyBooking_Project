

SELECT
    booking_id,
    hotel_name,
    hotel_type,
    city,
    country,
    customer_id,
    full_name,
    checkin_date,
    checkout_date,
    TRY_CAST(nights AS INT) as nights,
    TRY_CAST(adults AS INT) as adults,
    TRY_CAST(children AS INT) as children,
    room_type,
    TRY_CAST(total_price AS FLOAT) as total_price,
    TRY_CAST(room_price AS FLOAT) as room_price,
    TRY_CAST(tax_amount AS FLOAT) as tax_amount,
    payment_status,
    payment_method,
    is_cancelled,
    booking_status,
    booking_date,
    booking_channel
FROM [HappyBooking_Lakehouse].[dbo].[hotel_raw_stream]
WHERE TRY_CAST(adults AS INT) > 0