(
    optional Connection as record, 
    optional program as text,
    optional options as record
) => 
    "#lib(TransformLocationRecordsToTable)"(
        program,
        "#lib(GetProgramLocations)"(Connection, program, options)
    )