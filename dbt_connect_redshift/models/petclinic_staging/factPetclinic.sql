with stg_factlessTable as (

    SELECT * FROM {{ ref('stg_factlessTable')}}
),

final as (

    SELECT
        date_key
        ,pet_key
        ,procedure_key

    FROM stg_factlessTable
        
)

SELECT * FROM final