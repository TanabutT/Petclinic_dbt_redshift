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

        ,dimpet.pet_key
        ,stg4_phistorywithdatekey.petid
        ,dimpet.kind
        ,dimpet.gender
        ,dimpet.age
        ,dimpet.ownerid
        ,dimpet.ownername
        ,dimpet.ownersurname
        ,dimpet.streetaddress
        ,dimpet.city
        ,dimpet.statename
        ,dimpet.fullstatename
        ,dimpet.zipcode

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
