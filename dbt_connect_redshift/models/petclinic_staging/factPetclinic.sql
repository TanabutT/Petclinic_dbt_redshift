with facttable as (

    SELECT * FROM {{ ref('stg_factlesstable')}}
),

final as (

    SELECT
        date_key
        ,pet_key
        ,procedure_key

    FROM facttable
        
)

SELECT * FROM final