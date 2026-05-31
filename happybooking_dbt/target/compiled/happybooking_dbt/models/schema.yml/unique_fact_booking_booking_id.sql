
    
    

select
    booking_id as unique_field,
    count(*) as n_records

from [HappyBooking_Warehouse].[gold].[fact_booking]
where booking_id is not null
group by booking_id
having count(*) > 1


