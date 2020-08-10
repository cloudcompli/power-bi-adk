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

        draft = if options <> null then
                if Record.HasFields(options, "draft") then 
                    "#lib(Text_FromAny)"(options[draft])
                else
                    "0"
            else
                "0"
        ,

        published = if options <> null then
                if Record.HasFields(options, "published") then 
                    "#lib(Text_FromAny)"(options[published])
                else
                    "1"
            else
                "1"
        ,

        query = if report_definition_ids <> null then
            if location_ids <> null then 
                [ #"report_definition_ids" = report_definition_ids, #"location_ids" = location_ids, #"published" = published, #"draft" = draft ]
            else
                [ #"report_definition_ids" = report_definition_ids, #"published" = published, #"draft" = draft ]
        else
            if location_ids <> null then 
                [ #"location_ids" = location_ids, #"published" = published, #"draft" = draft ]
            else
                [ #"published" = published, #"draft" = draft ]
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