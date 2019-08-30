(
    Connection as record,
    optional options as record
) => 

    "#lib(TransformRecordsToTable)"(
        "#lib(GetEducationInteractions)"(Connection, options),
        [
            Only={"id","name","interaction_type_id","recipient_type_ids","provider_type_ids","created_at","updated_at"},
            IncludeRecord=true
        ]
    )
