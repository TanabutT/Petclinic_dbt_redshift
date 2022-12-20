with stg_factlesstable as (

    SELECT * FROM {{ ref('stg_factlesstable')}}
),

final as (

    SELECT
        date_key
        ,pet_key
        ,treatmentcase_key

    FROM stg_factlesstable
        
)

SELECT * FROM final