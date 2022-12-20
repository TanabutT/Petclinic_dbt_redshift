with stg_phistory as (

    SELECT * FROM {{ ref('stg_phistory')}}
),

dimprocedure as (

    SELECT * FROM {{ ref('dimprocedure')}}
),

final as (

    SELECT 
        stg_phistory.petid
        ,stg_phistory.date_treated
        ,stg_phistory.proceduretype
        ,stg_phistory.proceduresubcode
        ,dimprocedure.procedure_key
    FROM stg_phistory
    LEFT JOIN dimprocedure using (proceduretype,proceduresubcode)

)

SELECT * FROM final