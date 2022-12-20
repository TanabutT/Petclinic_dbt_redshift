with stg3_phistorywithprocedurekey as (

    SELECT * FROM {{ ref('stg3_phistorywithprocedurekey')}}
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
        
    FROM stg3_phistorywithprocedurekey
    Left join dimdate using (date_treated)
    
)

SELECT * FROM final