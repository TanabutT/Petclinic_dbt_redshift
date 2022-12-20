with dimdate as (

    SELECT * FROM {{ ref('dimdate')}}
),

dimpet as (

    SELECT * FROM {{ ref('dimpet')}}
),

dimprocedure as (

    SELECT * FROM {{ ref('dimprocedure')}}
),

stg4_phistorywithdatekey as (

    SELECT * FROM {{ ref('stg4_phistorywithdatekey')}}
),



final as (
    SELECT 
        stg4_phistorywithdatekey.date_key
        ,stg4_phistorywithdatekey.date_treated

        ,stg4_phistorywithdatekey.pet_key
        ,stg4_phistorywithdatekey.petid
        ,stg4_phistorywithdatekey.kind
        ,stg4_phistorywithdatekey.gender
        ,stg4_phistorywithdatekey.age
        ,stg4_phistorywithdatekey.ownerid
        ,stg4_phistorywithdatekey.ownername
        ,stg4_phistorywithdatekey.ownersurname
        ,stg4_phistorywithdatekey.streetaddress
        ,stg4_phistorywithdatekey.city
        ,stg4_phistorywithdatekey.statename
        ,stg4_phistorywithdatekey.fullstatename
        ,stg4_phistorywithdatekey.zipcode

        ,stg4_phistorywithdatekey.procedure_key
        ,stg4_phistorywithdatekey.proceduretype
        ,stg4_phistorywithdatekey.proceduresubcode
        ,stg4_phistorywithdatekey.procedure_description
        ,stg4_phistorywithdatekey.price

        
    FROM stg4_phistorywithdatekey
    JOIN dimpet using (petid)
    JOIN dimdate using (date_treated)
    JOIN dimprocedure using (procedure_key)

)

SELECT * FROM final
