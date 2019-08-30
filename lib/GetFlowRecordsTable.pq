(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetFlowRecords)"(Connection, options)
    )