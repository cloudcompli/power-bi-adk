(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetMonitoringRecords)"(Connection, options)
    )