(Connection as record) =>

    "#lib(GetPagedApiResponse)"(
        (limit, offset) => "#lib(GetApiResponse)"( 
            Connection,
            "monitoring/locations?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset)
        )
    )
