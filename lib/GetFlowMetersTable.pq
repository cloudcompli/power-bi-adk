(Connection as record) => 

    "#lib(TransformPointColumnToCoordinatesColumns)"(
        "#lib(TransformRecordsToTable)"(
            "#lib(GetFlowMeters)"(Connection),
            [
                Only={"id","identifier", "name", "active", "created_at", "updated_at", "point", "first_record", "last_record" }, 
                IncludeRecord=true 
            ]
        )
    )
