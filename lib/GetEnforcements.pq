﻿(
    Connection as record,
    optional options as record
) =>

    let

        pagedApiResponseOptions = "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetPagedApiResponse_OptionNames)")

    in 

        "#lib(GetPagedApiResponse)"(
            (limit, offset) => "#lib(GetApiResponse)"( 
                Connection,
                "enforcement?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset),
                [ Headers=[ #"X-Include-Data"="entries" ] ]
            ),
            pagedApiResponseOptions
        )