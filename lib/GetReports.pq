(
    optional Connection as record, 
    optional options as record
) => 

    let

        pagedApiResponseOptions = "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetPagedApiResponse_OptionNames)"),

        report_definition_ids = if options <> null then
                if Record.HasFields(options, "report_definition_id") then 
                    "#lib(Text_FromAny)"(options[report_definition_id])
                else if Record.HasFields(options, "report_definition_ids") then 
                    "#lib(Text_FromAny)"(options[report_definition_ids], [Separator=","])
                else
                    null
            else
                null
        ,

        location_ids = if options <> null then
                if Record.HasFields(options, "location_id") then 
                    "#lib(Text_FromAny)"(options[location_id])
                else if Record.HasFields(options, "location_ids") then 
                    "#lib(Text_FromAny)"(options[location_ids], [Separator=","])
                else
                    null
            else
                null
        ,

        query = if report_definition_ids <> null then
            if location_ids <> null then 
                [ #"report_definition_ids" = report_definition_ids, #"location_ids" = location_ids ]
            else
                [ #"report_definition_ids" = report_definition_ids ]
        else
            if location_ids <> null then 
                [#"location_ids" = location_ids ]
            else
                [ ]
        ,

        headers =  [ #"X-Omit-Data"="xfjson xfxml output images" ]

    in 

        "#lib(GetPagedApiResponse)"(
            (limit, offset) => "#lib(GetApiResponse)"( 
                Connection,
                "report-contents?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset), 
                [ 
                    Headers = headers,
                    Query = query
                ]
            ),
            pagedApiResponseOptions
        )