with stg3_phistorywithtreatmentcasekey as (

    SELECT * FROM {{ ref('stg3_phistorywithtreatmentcasekey')}}
),

dimdate as (

    SELECT * FROM {{ ref('dimdate')}}
),


final as (

    SELECT 
        treatmentcase_key         
        ,petid
        ,date_treated
        ,date_key
        ,proceduretype
        ,proceduresubcode
        ,procedure_key
        
    FROM stg3_phistorywithtreatmentcasekey
    Left join dimdate using (date_treated)
    
)

SELECT * FROM final