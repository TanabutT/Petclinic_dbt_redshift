with stg4_phistorywithdatekey as (

    SELECT * FROM {{ ref('stg4_phistorywithdatekey')}}
),

final as (

    select * from stg4_phistorywithdatekey
)

select * from final