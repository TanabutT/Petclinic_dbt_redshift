with stg2_phistorywithprocedurekey as (

    SELECT * FROM {{ ref('stg2_phistorywithprocedurekey')}}
),



final as (

    SELECT 
        ROW_NUMBER() OVER 
            ( 
                ORDER BY date_treated,petid ASC
                 
            ) AS treatmentcase_key
         
        ,petid
        ,date_treated
        ,proceduretype
        ,proceduresubcode
        ,procedure_key
        
    FROM stg2_phistorywithprocedurekey
    
)

SELECT * FROM final