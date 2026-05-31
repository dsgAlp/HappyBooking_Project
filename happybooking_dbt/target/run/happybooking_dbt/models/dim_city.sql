
  
    
    
    USE [HappyBooking_Warehouse];
    
    

    EXEC('create view [gold].[dim_city__dbt_temp__dbt_tmp_vw] as 

SELECT DISTINCT
    country,
    city,
    hotel_name,
    hotel_type,
    star_rating
FROM [HappyBooking_Lakehouse].[dbo].[hotel_raw_stream]
WHERE country IS NOT NULL;');




    
    

    
    
            EXEC('CREATE TABLE [HappyBooking_Warehouse].[gold].[dim_city__dbt_temp]  AS SELECT * FROM [HappyBooking_Warehouse].[gold].[dim_city__dbt_temp__dbt_tmp_vw] 
    OPTION (LABEL = ''dbt-fabric-dw'');
');
        
    


  
  