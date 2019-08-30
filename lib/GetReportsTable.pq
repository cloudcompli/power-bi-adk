(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformReportsToTable)"(
        "#lib(GetReports)"(Connection, options)
    )
