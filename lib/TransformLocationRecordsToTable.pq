(
    optional program as text,
    optional RecordList as list
) =>

    let
        ProgramLocationColName = Text.Replace(program, "-", "_") & "__location_type__data",
        ProgramLocationTypeColName = Text.Replace(program, "-", "_") & "__location_type_key",
        RecordToColumnExpansion = {
            "id",
            "name",
            "address_street",
            "address_city",
            "address_state",
            "address_zip",
            "point",
            "owner_name",
            "owner_email",
            "owner_phone",
            "owner_address_street",
            "owner_address_city",
            "owner_address_state",
            "owner_address_zip",
            "location_status_id",
            "location_status_name",
            "tag_ids",
            ProgramLocationTypeColName,
            ProgramLocationColName,
            bmp_effectiveness
        }
    in
        Table.TransformColumns(
            Table.RenameColumns(
                Table.DuplicateColumn(
                    Table.ExpandRecordColumn(
                        Table.ExpandRecordColumn(
                            Table.FromList(RecordList, Splitter.SplitByNothing(), null, null, ExtraValues.Error), 
                            "Column1", 
                            RecordToColumnExpansion
                        ),
                        "point",
                        {"coordinates"}
                    ), 
                    "coordinates",
                    "latitude"
                ),
                {
                    { "coordinates", "longitude" },
                    { ProgramLocationColName, "location_type_data" },
                    { ProgramLocationTypeColName, "location_type_key" }
                }
            ), 
            {
                {"longitude", (l) => if Value.Is(l, type list ) and l{0} <> 0 and l{1} <> 0 then l{0} else null },
                {"latitude", (l) => if Value.Is(l, type list ) and l{0} <> 0 and l{1} <> 0 then l{1} else null }
            }
        )