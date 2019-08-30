(Connection as record) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetDeficiencyLevels)"(Connection),
        [ Only={"id","name","resolution_days","deficiency_level_categories"} ]
    )