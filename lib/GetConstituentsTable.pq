(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetConstituents)"(Connection),
        [ Only={"id","name", "units", "scale", "monitoring_class", "analysis_methods"} ]
    )