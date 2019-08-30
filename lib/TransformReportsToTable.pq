(reports) => 

    let 
        ExpansionColumns = {
            "id", 
            "program_class",
            "report_type_key",
            "report_definition_id",
            "report_definition_name",
            "location_id", 
            "created_at",
            "updated_at"
        }
    in 
        if List.Count(reports) > 0 then

            Table.ExpandRecordColumn(
                Table.RenameColumns(
                    Table.DuplicateColumn(
                        Table.FromList(reports, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
                        "Column1",
                        "Data"
                    ),
                    {
                        {"Column1", "Record"}
                    }
                ),
                "Data",
                ExpansionColumns
            )

        else

            #table(
                List.Combine({
                    {"Record"},
                    ExpansionColumns
                }),
                {}
            )