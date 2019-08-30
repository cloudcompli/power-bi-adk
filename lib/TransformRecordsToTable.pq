(
    optional RecordList as list, 
    optional options as record
) =>

    let
        table = if(options <> null and Record.HasFields(options, "IncludeRecord") and options[IncludeRecord] = true) then 
            Table.DuplicateColumn(
                Table.FromList(RecordList, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
                "Column1",
                "Record"
            )
        else 
            Table.FromList(RecordList, Splitter.SplitByNothing(), null, null, ExtraValues.Error)
    in
        Table.ExpandRecordColumn(
            table,
            "Column1", 
            if(options <> null and Record.HasFields(options, "Only")) then options[Only] else Record.FieldNames(List.First(RecordList))
        )