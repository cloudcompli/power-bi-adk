(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetInvestigations)"(Connection, options),
        [
            Only={"id","name","investigation_type_id","event_type_ids","outcome_type_ids","created_at","updated_at"},
            IncludeRecord=true
        ]
    )
