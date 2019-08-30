(optional options, optional retain) => 
    if options <> null 
    then 
        if retain <> null
        then
            Record.SelectFields(options, List.Intersect({Record.FieldNames(options), retain}))
        else
            options
    else
        []