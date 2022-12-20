with dimdate as (

    SELECT * FROM {{ ref('dimdate')}}
),

dimpet as (

    SELECT * FROM {{ ref('dimpet')}}
),

dimprocedure as (

    SELECT * FROM {{ ref('dimprocedure')}}
),

stg3_phistorywithprocedurekey as (

    SELECT * FROM {{ ref('stg3_phistorywithprocedurekey')}}
),



final as (
    SELECT 
        stg3_phistorywithkey.date_key
        ,stg3_phistorywithkey.date_treated

        ,stg3_phistorywithkey.pet_key
        ,stg3_phistorywithkey.petid
        ,stg3_phistorywithkey.kind
        ,stg3_phistorywithkey.gender
        ,stg3_phistorywithkey.age
        ,stg3_phistorywithkey.ownerid
        ,stg3_phistorywithkey.ownername
        ,stg3_phistorywithkey.ownersurname
        ,stg3_phistorywithkey.streetaddress
        ,stg3_phistorywithkey.city
        ,stg3_phistorywithkey.statename
        ,stg3_phistorywithkey.fullstatename
        ,stg3_phistorywithkey.zipcode

        ,stg3_phistorywithkey.procedure_key
        ,stg3_phistorywithkey.proceduretype
        ,stg3_phistorywithkey.proceduresubcode
        ,stg3_phistorywithkey.procedure_description
        ,stg3_phistorywithkey.price

        
    FROM stg3_phistorywithkey
    JOIN dimpet using (pet_id)
    JOIN dimdate using (date_treated)
    JOIN dimprocedure using (procedure_key)

)

SELECT * FROM final
