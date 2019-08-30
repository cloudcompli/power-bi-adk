(
    optional SourceTable as table, 
    optional pointColumnName as text, 
    optional latitudeColumName as text, 
    optional longitudeColumName as text
) => 
    
    let 
        LatitudeColumnName = if latitudeColumName <> null then latitudeColumName else "latitude",
        LongitudeColumnName = if longitudeColumName <> null then longitudeColumName else "longitude",
        PointColumnName = if pointColumnName <> null then pointColumnName else "point"
    in
        Table.TransformColumns(
            Table.RenameColumns(
                Table.DuplicateColumn(
                    Table.ExpandRecordColumn(
                        SourceTable,
                        PointColumnName,
                        {"coordinates"}
                    ),
                    "coordinates",
                    LatitudeColumnName
                ),
                {
                    { "coordinates", LongitudeColumnName }
                }
            ),
            {
                {LongitudeColumnName, (l) => if Value.Is(l, type list ) and l{0} <> 0 and l{1} <> 0 then l{0} else null },
                {LatitudeColumnName, (l) => if Value.Is(l, type list ) and l{0} <> 0 and l{1} <> 0 then l{1} else null }
            }
        )