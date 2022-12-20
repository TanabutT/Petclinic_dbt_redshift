with stg_factlesstable as (

    SELECT * FROM {{ ref('stg_factlesstable')}}
),

final as (

    SELECT
        date_key
        ,pet_key
        ,procedure_key

    FROM stg_factlessTable
        
)

SELECT * FROM final