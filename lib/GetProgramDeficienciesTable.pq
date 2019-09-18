(
    optional Connection as record, 
    optional program as text,
    optional options as record
) => let 

    TableColumns = {
        "id",
        "location_id",
        "created_at",
        "deficiency_level_id",
        "name",
        "description",
        "due_by",
        "resolved_by",
        "resolved_at",
        "point",
        "bmp_id",
        "created_by",
        "resolution_notes",
        "resolved_by_email",
        "resolved_by_name",
        "location_name",
        "bmp_name",
        "corrective_action",
        "assigned_to",
        "creator",
        "resolver"
    }

in

    "#lib(TransformPointColumnToCoordinatesColumns)"(
        "#lib(TransformRecordsToTable)"("#lib(GetProgramDeficiencies)"(Connection, program, options), [
            Only=TableColumns
        ])
    )