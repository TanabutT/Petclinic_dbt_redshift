with stg2_phistory as (

    SELECT * FROM {{ ref('stg2_phistory')}}
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
        
    FROM stg2_phistory
    
)

SELECT * FROM final