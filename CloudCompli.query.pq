// Use this file to write queries to test your data connector
let

    connection = [
        Instance="INSTANCE.compli.cloud",
        Token="TOKEN"
    ],

    result = CloudCompli.GetApiToken([
        Instance = "INSTANCE.compli.cloud",
        ClientId = "CLIENT_ID",
        ClientSecret = "CLIENT_SECRET"
    ])


    //result = CloudCompli.GetDataset("Constituents")
    //result = CloudCompli.GetDataset("ProgramLocations", "{""program"":""construction""}")
    //result = CloudCompli.GetDataset("ProgramLocations", "{""program"":""construction"", ""MaxQueries"":2,""RecordsPerQuery"":100}")
    //result = CloudCompli.GetDataset("ConstructionLocations")
    //result = CloudCompli.GetDataset("ConstructionLocations", "{""MaxQueries"":2,""RecordsPerQuery"":100}")
    //result = CloudCompli.GetConstructionLocationsTable(connection)
    //result = CloudCompli.GetConstructionLocations(connection)
    //result = CloudCompli.GetDataset("FlowMeters")
    //result = CloudCompli.GetDataset("FlowRecords")
    //result = CloudCompli.GetDataset("FlowRecords", "{""MaxQueries"":2,""RecordsPerQuery"":2}")
    //result = CloudCompli.GetDataset("Users")
    //result = CloudCompli.GetDataset("ProgramDeficiencies", "{""program"":""construction""}")
    //result = CloudCompli.GetDataset("ProgramDeficiencies", "{""program"":""construction"", ""MaxQueries"":1,""RecordsPerQuery"":2, ""ErrorOnAdditionalRecords"": false}")
    //result = CloudCompli.GetConstructionDeficienciesTable(connection)
    //result = CloudCompli.GetConstructionDeficiencies(connection)
    //result = CloudCompli.GetDataset("ConstructionDeficiencies", "{""MaxQueries"":2,""RecordsPerQuery"":1000}")
    //result = CloudCompli.GetCaswrcbIndustrialFacilitiesAttributes(connection, "facility-counties")
    //result = CloudCompli.GetDataset("CaswrcbIndustrialFacilities", "{""receiving_water_name"":""Aliso Creek""}")
    //result = CloudCompli.GetDataset("CaswrcbIndustrialFacilitiesReceivingWaters")
    //result = CloudCompli.GetDataset("CASWRCB Industrial Facilities - Counties")
    //result = CloudCompli.GetDataset("MonitoringLocations")
    //result = CloudCompli.GetDataset("MonitoringRecords")
    //result = CloudCompli.GetDataset("MonitoringRecords", "{""MaxQueries"":2,""RecordsPerQuery"":2, ""ErrorOnAdditionalRecords"": false}")
    //result = CloudCompli.GetDataset("CaswrcbWastewaterFacilityPermits", "{""wdid"":""5A459002001""}")
    //result = CloudCompli.GetDataset("CaswrcbWastewaterFacilityPermitsPretreatmentCodes")
    //result = CloudCompli.GetDataset("WeatherHydstraObsStations")
    //result = CloudCompli.GetDataset("FlowRecords", "{""MaxQueries"":2,""RecordsPerQuery"":2, ""start"": ""2016-04-06"", ""end"": ""2016-04-08"", ""meter_ids"":2}")
    //result = CloudCompli.GetDataset("MonitoringRecords", "{""MaxQueries"":2,""RecordsPerQuery"":2, ""start"": ""2019-05-01"", ""end"": ""2019-05-05"", ""constituent_id"":38,""location_ids"":127}")
    //result = CloudCompli.GetDataset("ReportDefinitions")
    //result = CloudCompli.GetDeficiencyLevelsTable(connection)
    //result = CloudCompli.GetDataset("DeficiencyLevels")
    //result = CloudCompli.GetDataset("EnforcementLevels")
    //result = CloudCompli.GetDataset("LocationTags")
    //result = CloudCompli.GetDataset("EducationInteractions", "{""MaxQueries"":2,""RecordsPerQuery"":2, ""ErrorOnAdditionalRecords"": false}")
    //result = CloudCompli.GetDataset("Investigations", "{""MaxQueries"":2,""RecordsPerQuery"":2, ""ErrorOnAdditionalRecords"": false}")
    //result = CloudCompli.GetDataset("Enforcements", "{""MaxQueries"":2,""RecordsPerQuery"":2, ""ErrorOnAdditionalRecords"": false}")
    //result = CloudCompli.GetDataset("Reports", "{""report_definition_id"":273,""location_ids"":""14420,35576"", ""MaxQueries"":2,""RecordsPerQuery"":2, ""ErrorOnAdditionalRecords"": false}")
    //result = CloudCompli.GetReportsTable(connection, [#"report_definition_id"=273,MaxQueries=3,RecordsPerQuery=3,ErrorOnAdditionalRecords=false])\
    //result = CloudCompli.GetReportsTable(connection, [MaxQueries=3,RecordsPerQuery=3,ErrorOnAdditionalRecords=false])
    //result = CloudCompli.GetReportsTable(connection, [location_ids={"14420","35576"}])

in
    result