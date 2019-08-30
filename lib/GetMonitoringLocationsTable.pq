(Connection as record) => 

    "#lib(TransformPointColumnToCoordinatesColumns)"(
        "#lib(TransformRecordsToTable)"(
            "#lib(GetMonitoringLocations)"(Connection),
            [ 
                Only={"id","identifier","name","created_at","active","source_type","continuous","point"},
                IncludeRecord=true
            ]
        )
    )