(
    Connection as record,
    optional options as record
) =>

    let 

        query = "#lib(Record_MapFields)"(
            "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetLocationTags_QueryOptionNames)"),
            "#lib(Text_FromAny)"
        )

    in

    "#lib(GetApiResponse)"(
        Connection, 
        "locations-tags",
        [ Query = query ]
    )