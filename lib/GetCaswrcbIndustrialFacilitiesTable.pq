(
    Connection as record, 
    optional options
) => 

    "#lib(TransformPointColumnToCoordinatesColumns)"(
        "#lib(TransformRecordsToTable)"(
            "#lib(GetCaswrcbIndustrialFacilities)"(Connection, options)
        )
    )