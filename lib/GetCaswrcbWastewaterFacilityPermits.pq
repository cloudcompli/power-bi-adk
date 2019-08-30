(
    Connection as record, 
    optional options
) =>

    let

        query = "#lib(Record_SelectFieldsWhereExists)"(options, "#lib(GetCaswrcbWastewaterFacilityPermits_QueryOptionNames)")

    in

        "#lib(GetPagedApiResponse)"(
            (limit, offset) => "#lib(GetApiResponse)"( 
                Connection,
                "data/caswrcb/wastewater-facility-permits?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset),
                [ Query = query ]
            )
        )
