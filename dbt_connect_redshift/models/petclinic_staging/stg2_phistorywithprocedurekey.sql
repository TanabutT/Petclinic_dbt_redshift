with stg_phistory as (

    SELECT * FROM {{ ref('stg_phistory')}}
),

dimprocedure as (

    SELECT * FROM {{ ref('dimprocedure')}}
),

final as (

    SELECT 
        historynokey.petid
        ,historynokey.date_treated
        ,historynokey.proceduretype
        ,historynokey.proceduresubcode
        ,dimprocedure.procedure_key
    FROM stg_phistory
    LEFT JOIN dimprocedure using (proceduretype,proceduresubcode)

)

SELECT * FROM final