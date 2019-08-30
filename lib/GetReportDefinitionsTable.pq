(Connection as record) => 

    "#lib(TransformReportDefinitionsToTable)"(
        "#lib(GetReportDefinitions)"(Connection)
    )
