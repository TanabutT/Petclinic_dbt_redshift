with petdetail as (

    SELECT * FROM {{ ref('stg_pets')}}
),

ownerdetail as (

    SELECT * FROM {{ ref('stg_owners')}}
),

final as (

    SELECT 
        ROW_NUMBER() OVER 
            ( 
                ORDER BY petid ASC
                 
            ) AS pet_key
        ,petdetail.petid
        ,petdetail.kind
        ,petdetail.gender
        ,petdetail.age
        ,ownerdetail.ownerid
        ,ownerdetail.ownername
        ,ownerdetail.ownersurname
        ,ownerdetail.streetaddress
        ,ownerdetail.city
        ,ownerdetail.statename
        ,ownerdetail.fullstatename
        ,ownerdetail.zipcode
    FROM petdetail
    LEFT JOIN ownerdetail using (ownerid)

)

SELECT * FROM final