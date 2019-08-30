(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetEnforcementLevels)"(Connection),
        [ Only={"id","name","order"} ]
    )