(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetUsers)"(Connection),
        [ Only={
            "id",
            "name", 
            "first_name", 
            "last_name", 
            "title", 
            "email", 
            "phone", 
            "created_at", 
            "restricted", 
            "status", 
            "readonly", 
            "locations_tags"
        } ]
    )