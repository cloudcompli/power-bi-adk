(Connection as record) =>

    "#lib(GetPagedApiResponse)"(
        (limit, offset) => "#lib(GetApiResponse)"( 
            Connection,
            "weather/hydstra/obs?limit=" & Number.ToText(limit) & "&offset=" & Number.ToText(offset)
        )
    )
