(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetLocationTags)"(Connection),
        [ Only={"id","name"} ]
    )