(
    optional callback, 
    optional options as record
) => 

    let
        limit = if(options <> null and Record.HasFields(options, "RecordsPerQuery")) then options[RecordsPerQuery] else 1000,
        maxQueries = if(options <> null and Record.HasFields(options, "MaxQueries")) then options[MaxQueries] else 20,
        recursor = (recursor, page) => 
            if maxQueries < page then 
                 {} // fail silently (this case is only reached it options[ErrorOnAdditionalRecords] = false)
            else
                let 
                    newList = try Function.Invoke(callback, {limit, page*limit}) otherwise {}
                in
                    if
                        List.Count(newList) > 0 // this page returned results, and the next page might have more results
                    then
                        if maxQueries <= page and (
                            options = null 
                            or Record.HasFields(options, "ErrorOnAdditionalRecords") = false 
                            or options[ErrorOnAdditionalRecords] <> false
                        ) then 
                            // we have received more records than options[RecordsPerQuery] and options[MaxQueries] allow
                            error "Maximum query limit reached for data set. Tighten filter options or use GetPagedApiResponse directly with larger RecordsPerQuery/MaxQueries options."
                        else
                            // recusirvely merge this list with the next page
                            List.Combine({
                                newList,
                                recursor(recursor, page+1)
                            })
                    else
                        // no records for limit/offset of this page, so terminate recursion by sending back empty list
                        {}
    in
        recursor(recursor, 0)