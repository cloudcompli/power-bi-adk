(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetBmps)"(Connection),
        [ Only={"id","name", "weight", "description", "bmp_categories"} ]
    )
