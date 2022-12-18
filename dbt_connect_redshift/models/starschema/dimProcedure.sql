--{{ config(materialized='table') }}

with dimProcedure as (

    select 
        ROW_NUMBER() OVER 
            ( 
                ORDER BY proceduretype,proceduresubcode ASC
                 
            ) AS procedure_key
        ,* 

    from pdetail
    ORDER BY procedure_key

)



SELECT * from dimProcedure 

