(
    record, 
    callback
) =>

    let 
        fieldNames  = Record.FieldNames(record),
        transformations = List.Transform(
            List.Generate(()=>List.Count(fieldNames), each _ > 0, each _ - 1),
            (idx) => { 
                fieldNames{idx-1}, 
                (value) =>
                    try // try to send field name with value
                        callback(value, fieldNames{idx-1})
                    otherwise // just send the value if callback doesn't support 2 params
                        callback(value)
            }
        )
    in 
        Record.TransformFields(record, transformations)