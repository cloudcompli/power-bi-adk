(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetPrograms)"(Connection),
        [ Only={"name","type"} ]
    )