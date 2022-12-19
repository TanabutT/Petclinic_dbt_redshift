with dimDate as (

    SELECT * FROM {{ ref('dimDate')}}
),

with dimPet as (

    SELECT * FROM {{ ref('dimPet')}}
),

with dimProcedure as (

    SELECT * FROM {{ ref('dimProcedure')}}
),

with history as (

    SELECT * FROM {{ ref('stg_phistory')}}
),



final as (
    SELECT 
        dimDate.date_key
        ,dimDate.date_treated

        ,dimPet.pet_key
        ,dimPet.petid
        ,dimPet.kind
        ,dimPet.gender
        ,dimPet.age
        ,dimPet.ownerid
        ,dimPet.ownername
        ,dimPet.ownersurname
        ,dimPet.streetaddress
        ,dimPet.city
        ,dimPet.statename
        ,dimPet.fullstatename
        ,dimPet.zipcode

        ,dimProcedure.procedure_key
        ,dimProcedure.proceduretype
        ,dimProcedure.proceduresubcode
        ,dimProcedure.procedure_description
        ,dimProcedure.price

        
    FROM history
    JOIN dimPet using (pet_key)
    JOIN dimDate using (date_key)
    JOIN dimProcedure using (procedure_key)

)

SELECT * FROM final
