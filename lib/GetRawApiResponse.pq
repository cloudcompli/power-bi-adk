(
    optional Connection as record, 
    optional query as text, 
    optional options as record
) => 

    Web.Contents("https://" & Connection[Instance] & "/api/" & query, [
        Headers = Record.Combine({
            if options<>null and Record.HasFields(options, "Headers") then options[Headers] else [],
            [ Authorization="Bearer " & Connection[Token] ]
        }),
        Query = if options<>null and Record.HasFields(options, "Query") then options[Query] else []
    ])