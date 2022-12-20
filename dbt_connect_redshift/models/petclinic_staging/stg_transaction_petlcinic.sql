{{
  config(
    materialized = "view"
  
  )
}}

with stg_factlesstable (

    SELECT * FROM {{ref('stg_factlesstable')}}
),

final as (
    SELECT
        *
    FROM stg_factlesstable

)

SELECT * FROM final