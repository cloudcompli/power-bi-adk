(
    Connection as record, 
    optional options
) =>

    let

        query = "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetCaswrcbIndustrialFacilities_QueryOptionNames)")

    in 
        
        "#lib(GetPagedApiResponse)"(
            (limit, offset) => "#lib(GetApiResponse)"( 
                Connection,
                "data/caswrcb/industrial-facilities?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset),
                [ Query = query ]
            )
        )
