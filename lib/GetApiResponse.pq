(
    optional Connection as record, 
    optional query as text, 
    optional options as record
) => 
    
    Json.Document(
        "#lib(GetRawApiResponse)"(Connection, query, options)
    )