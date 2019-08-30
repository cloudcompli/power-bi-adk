(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformEnforcementsToTable)"(
        "#lib(GetEnforcements)"(Connection, options)
    )
