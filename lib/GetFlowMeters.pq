(Connection as record) =>

    "#lib(GetPagedApiResponse)"(
        (limit, offset) => "#lib(GetApiResponse)"( 
            Connection,
            "flow/meters?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset)
        )
    )
