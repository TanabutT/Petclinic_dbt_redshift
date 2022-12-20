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
        
        ,stg4_phistorywithdatekey.treatmentcase_key

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
        ,dimprocedure.proceduretype
        ,dimprocedure.proceduresubcode
        ,dimprocedure.procedure_description
        ,dimprocedure.price

        
    FROM stg4_phistorywithdatekey
    JOIN dimpet using (petid)
    JOIN dimdate using (date_treated)
    JOIN dimprocedure using (procedure_key)

)

SELECT * FROM final
