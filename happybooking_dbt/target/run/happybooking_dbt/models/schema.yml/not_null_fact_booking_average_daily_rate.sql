
    
    with test_main_sql as (
  
    
    
    



select average_daily_rate
from [HappyBooking_Warehouse].[gold].[fact_booking]
where average_daily_rate is null



  
  ),
  dbt_internal_test as (
    select  * from test_main_sql
  )
  select
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from dbt_internal_test