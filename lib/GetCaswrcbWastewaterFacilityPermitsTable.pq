(
    Connection as record, 
    optional options
) => 

    "#lib(TransformPointColumnToCoordinatesColumns)"(
        "#lib(TransformRecordsToTable)"(
            "#lib(GetCaswrcbWastewaterFacilityPermits)"(Connection, options)
        )
    )