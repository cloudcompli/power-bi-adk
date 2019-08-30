(enforcements) => let

    RecordToColumnExpansion = {
        "id",
        "name",
        "case_type_id",
        "case_level_id",
        "created_at",
        "closed_at",
        "closed_by_user_id",
        "description",
        "enforcement_level_id",
        "enforcement_level",
        "entries"
    },
    table = Table.DuplicateColumn(
        Table.FromList(enforcements, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
        "Column1",
        "Record"
    )

in

    Table.TransformColumns(
        Table.RenameColumns(
            Table.ExpandRecordColumn(
                table, 
                "Column1", 
                RecordToColumnExpansion
            ),
            {"enforcement_level", "enforcement_level_name"}
        ),
        {
            {"enforcement_level_name", (l) => if Value.Is(l, type record ) then l[name] else null }
        }
    )