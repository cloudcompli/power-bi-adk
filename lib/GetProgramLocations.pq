(
    optional Connection as record, 
    optional program as text,
    optional options as record
) => 

    let

        pagedApiResponseOptions = "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetPagedApiResponse_OptionNames)")

    in 

        "#lib(GetPagedApiResponse)"(
            (limit, offset) => "#lib(GetApiResponse)"( 
                Connection,
                program & "?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset), 
                [ Headers = [ #"X-Include-Data" = "location_info program_location_info" ] ]
            ),
            pagedApiResponseOptions
        )