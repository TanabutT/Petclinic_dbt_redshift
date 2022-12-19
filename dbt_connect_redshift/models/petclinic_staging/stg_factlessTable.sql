with dimdate as (

    SELECT * FROM {{ ref('dimdate')}}
),

dimpet as (

    SELECT * FROM {{ ref('dimpet')}}
),

dimprocedure as (

    SELECT * FROM {{ ref('dimprocedure')}}
),

history as (

    SELECT * FROM {{ ref('stg_phistory')}}
),



final as (
    SELECT 
        dimdate.date_key
        ,dimdate.date_treated

        ,dimpet.pet_key
        ,dimpet.petid
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

        ,dimprocedure.procedure_key
        ,dimprocedure.proceduretype
        ,dimprocedure.proceduresubcode
        ,dimprocedure.procedure_description
        ,dimprocedure.price

        
    FROM history
    JOIN dimpet using (pet_key)
    JOIN dimdate using (date_key)
    JOIN dimprocedure using (procedure_key)

)

SELECT * FROM final
