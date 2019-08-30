(
    Connection as record,
    optional options as record
) =>

    let

        pagedApiResponseOptions = "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetPagedApiResponse_OptionNames)"),
        query = "#lib(Record_MapFields)"(
            "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetFlowRecords_QueryOptionNames)"),
            "#lib(Text_FromAny)"
        )

    in 

        "#lib(GetPagedApiResponse)"(
            (limit, offset) => "#lib(GetApiResponse)"( 
                Connection,
                "flow/records?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset),
                [ Query = query ]
            ),
            pagedApiResponseOptions
        )