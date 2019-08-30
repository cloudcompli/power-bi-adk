(
    value, 
    optional options
) => 

    if Value.Is(value, type number) then 
        Number.ToText(value) 
    else 
    if Value.Is(value, type list) then 
        Text.Combine(value, if options <> null and Record.HasFields(options, "Separator") then options[Separator] else ", ")
    else
        value