(
    optional Connection as record, 
    optional program as text,
    optional options as record
) => "#lib(TransformRecordsToTable)"("#lib(GetProgramCurrentBmpIneffectivenessScores)"(Connection, program, options))