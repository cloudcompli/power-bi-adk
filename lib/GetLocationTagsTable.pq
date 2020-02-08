(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetLocationTags)"(Connection, options),
        [ Only={"id","name","tag_category_ids"} ]
    )