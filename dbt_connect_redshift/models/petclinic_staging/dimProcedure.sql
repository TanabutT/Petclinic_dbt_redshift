with dimProcedure as (

    select 
        ROW_NUMBER() OVER 
            ( 
                ORDER BY proceduretype,proceduresubcode ASC
                 
            ) AS procedure_key
        ,* 

    from {{ref('stg_pdetail')}}
    ORDER BY procedure_key

),

final as (
    SELECT
        procedure_key
        ,proceduretype
        ,proceduresubcode
        ,procedure_description
        ,price

    FROM dimProcedure
)


SELECT * from final 

