(
    records as record
) =>

    Table.ExpandRecordColumn(
        Table.RenameColumns(
            Record.ToTable(records),
            {
                {"Name", "id"},
                {"Value", "Data"}
            }
        ),
        "Data",
        {"name"}
    )