with stg_phistory as (

    SELECT * FROM {{ ref('stg_phistory')}}
),

final as (
    select distinct date_treated from stg_phistory

    -- SELECT
    --     -- ROW_NUMBER() OVER 
    --     --     ( 
    --     --         ORDER BY date_treated ASC
                 
    --     --     ) AS date_key
    --     ,DISTINCT date_treated

    -- FROM stg_phistory
)
-- 1The last argument of CONVERT seems to determine the format used for parsing. Consult MSDN docs for CONVERT.

-- 111 - the one you are using is Japan yy/mm/dd.

-- I guess the one you are looking for is 103, that is dd/mm/yyyy
-- 23	ISO8601	yyyy-mm-dd
-- ref: https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles

SELECT * FROM final