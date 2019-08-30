(Connection as record) => 

    "#lib(TransformPointColumnToCoordinatesColumns)"(
        "#lib(TransformRecordsToTable)"(
            "#lib(GetWeatherHydstraObsStations)"(Connection)
        )
    )