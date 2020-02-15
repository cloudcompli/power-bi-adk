/**
 * CloudCompli Power BI Analytics Development Kit (ADK)
 *
 * This custom connector for Power BI is designed to provide two mechanisms for connecting with
 * customer data stored on CloudCompli:
 *
 *      (1) Get Data > CloudCompli - Through the user interface, a series of datasets are
 *          made available for selection. An additional JSON options parameter is provided
 *          to allow users to scope their dataset query to a subset of all the data tracked
 *          within CloudCompli.
 *
 *      (2) Power Query Builder - Through the Power Query Builder, the ADK makes available
 *          a series of methods that may be called directly with a connection object when
 *          doing more sophisticated queries than possible through the Get Data interface.
 *
 * The CloudCompli.mez file may be installed at:
 *
 *      Documents\Power BI Desktop\Custom Connectors
 *
 * To get an API token, you must first issue:
 *
 *      CloudCompli.GetApiToken([
 *          Instance = "YOUR_INSTANCE.compli.cloud",
 *          ClientId = "YOUR_CLIENT_ID",
 *          ClientSecret = "YOUR_CLIENT_SECRET"
 *      ])
 *
 * For the Get Data > CloudCompli, you will enter this token, along with your instance, in
 * order to connect to the dataset.
 *
 * For Power Query Builder, you should set up a query named Connection that is just:
 *
 *      = [
 *          Instance = "YOUR_INSTANCE.compli.cloud",
 *          Token = "YOUR_TOKEN
 *      ]
 *
 * You can then send Connection as the first parameter to every CoudCompli ADK function in 
 * the Query BUilder.
 *
 * CloudCompli Power BI ADK is open source software licensed under the MIT License:
 *
 *      MIT LICENSE
 * 
 *      Copyright (c) 2019 CloudCompli, Inc.
 *      All Rights Reserved.
 *
 *      MIT License
 *      Permission is hereby granted, free of charge, to any person obtaining a copy
 *      of this software and associated documentation files (the "Software"), to deal
 *      in the Software without restriction, including without limitation the rights
 *      to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *      copies of the Software, and to permit persons to whom the Software is
 *      furnished to do so, subject to the following conditions:
 *
 *      The above copyright notice and this permission notice shall be included in all
 *      copies or substantial portions of the Software.

 *      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *      IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *      FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *      AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *      LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *      OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *      SOFTWARE.
 *
 */

section CloudCompli;

/*
 * @TODO: add better error handling when an endpoint isn't enabled for a customer
 * @TODO: add better error handling for required `program` attribute in options for program locations/deficiencies calls
 */

/**
 * Connection is a global variable used in the custom connector to define the Instance and Token used by
 * GetRawApiResponse to compute the API route and set the Bearer for OAuth2 mediation.
 */

Connection = [
    Instance = Extension.CurrentCredential()[Username],
    Token = Extension.CurrentCredential()[Password]
];

/**
 * Exposed API of functions that can be called when writing custom queries in the Power Query Editor.
 * All functions in this API require a parameter Connection that is a Record containing the fields 
 * Instance and Token.
 *
 * For example:
 *
 *      CloudCompli.GetBmps([Instance="sandbox.compli.cloud",Token="XXXXXXXXXXX"])
 *
 * returns a list of records of all BMPs turned on for sandbox.compli.cloud.
 */

shared CloudCompli.GetApiToken = "#lib(GetApiToken)";

shared CloudCompli.GetBmps = "#lib(GetBmps)";

shared CloudCompli.GetBmpsTable = "#lib(GetBmpsTable)";

shared CloudCompli.GetCaswrcbIndustrialFacilities = (Connection, optional options) 
    => "#lib(GetCaswrcbIndustrialFacilities)"(Connection, options);

shared CloudCompli.GetCaswrcbIndustrialFacilitiesTable = (Connection, optional options) 
    => "#lib(GetCaswrcbIndustrialFacilitiesTable)"(Connection, options);

shared CloudCompli.GetCaswrcbIndustrialFacilitiesAttribute = "#lib(GetCaswrcbIndustrialFacilitiesAttribute)";

shared CloudCompli.GetCaswrcbIndustrialFacilitiesCounties = (Connection) 
    => "#lib(GetCaswrcbIndustrialFacilitiesAttribute)"(Connection, "facility-counties");

shared CloudCompli.GetCaswrcbIndustrialFacilitiesCities = (Connection) 
    => "#lib(GetCaswrcbIndustrialFacilitiesAttribute)"(Connection, "facility-cities");

shared CloudCompli.GetCaswrcbIndustrialFacilitiesRegionBoards = (Connection) 
    => "#lib(GetCaswrcbIndustrialFacilitiesAttribute)"(Connection, "region-boards");

shared CloudCompli.GetCaswrcbIndustrialFacilitiesSics = (Connection) 
    => "#lib(GetCaswrcbIndustrialFacilitiesAttribute)"(Connection, "sics");

shared CloudCompli.GetCaswrcbIndustrialFacilitiesReceivingWaters = (Connection) 
    => "#lib(GetCaswrcbIndustrialFacilitiesAttribute)"(Connection, "receiving-water-names");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermits = (Connection, optional options) 
    => "#lib(GetCaswrcbWastewaterFacilityPermits)"(Connection, options);

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsAttribute = "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)";

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsTable = (Connection, optional options) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsTable)"(Connection, options);

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsCounties = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "facility-counties");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsCities = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "facility-cities");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsTypes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "facility-types");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsWasteTypes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "waste-types");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsThreatCodes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "threat-codes");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsComplexityCodes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "complexity-codes");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsFeeCodes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "fee-codes");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsPretreatmentCodes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "pretreatment-codes");

shared CloudCompli.GetCaswrcbWastewaterFacilityPermitsReclamationCodes = (Connection) 
    => "#lib(GetCaswrcbWastewaterFacilityPermitsAttribute)"(Connection, "reclamation-codes");

shared CloudCompli.GetConstituents = "#lib(GetConstituents)";

shared CloudCompli.GetConstituentsTable = "#lib(GetConstituentsTable)";

shared CloudCompli.GetConstructionCurrentBmpIneffectivenessScores = (Connection, optional options) 
    => "#lib(GetProgramCurrentBmpIneffectivenessScores)"(Connection, "construction", options);

shared CloudCompli.GetConstructionCurrentBmpIneffectivenessScoresTable = (Connection, optional options) 
    => "#lib(GetProgramCurrentBmpIneffectivenessScoresTable)"(Connection, "construction", options);

shared CloudCompli.GetConstructionDeficiencies = (Connection, optional options) 
    => "#lib(GetProgramDeficiencies)"(Connection, "construction", options);

shared CloudCompli.GetConstructionDeficienciesTable = (Connection, optional options) 
    => "#lib(GetProgramDeficienciesTable)"(Connection, "construction", options);

shared CloudCompli.GetConstructionLocations = (Connection, optional options)
    => "#lib(GetProgramLocations)"(Connection, "construction", options);

shared CloudCompli.GetConstructionLocationsTable = (Connection, optional options) 
    => "#lib(GetProgramLocationsTable)"(Connection, "construction", options);

shared CloudCompli.GetDeficiencyLevels = "#lib(GetDeficiencyLevels)";

shared CloudCompli.GetDeficiencyLevelsTable = "#lib(GetDeficiencyLevelsTable)";

shared CloudCompli.GetEducationInteractions = (Connection, optional options) 
    => "#lib(GetEducationInteractions)"(Connection, options);

shared CloudCompli.GetEducationInteractionsTable = (Connection, optional options) 
    => "#lib(GetEducationInteractionsTable)"(Connection, options);

shared CloudCompli.GetEnforcementLevels = "#lib(GetEnforcementLevels)";

shared CloudCompli.GetEnforcementLevelsTable = "#lib(GetEnforcementLevelsTable)";

shared CloudCompli.GetEnforcements = (Connection, optional options) 
    => "#lib(GetEnforcements)"(Connection, options);

shared CloudCompli.GetEnforcementsTable = (Connection, optional options) 
    => "#lib(GetEnforcementsTable)"(Connection, options);

shared CloudCompli.GetFlowMeters = "#lib(GetFlowMeters)";

shared CloudCompli.GetFlowMetersTable = "#lib(GetFlowMetersTable)";

shared CloudCompli.GetFlowRecords = (Connection, optional options) 
    => "#lib(GetFlowRecords)"(Connection, options);

shared CloudCompli.GetFlowRecordsTable = (Connection, optional options) 
    => "#lib(GetFlowRecordsTable)"(Connection, options);

shared CloudCompli.GetIndustrialDeficiencies = (Connection, optional options)
    => "#lib(GetProgramDeficiencies)"(Connection, "industrial", options);

shared CloudCompli.GetIndustrialDeficienciesTable = (Connection, optional options) 
    => "#lib(GetProgramDeficienciesTable)"(Connection, "industrial", options);

shared CloudCompli.GetIndustrialLocations = (Connection, optional options) 
    => "#lib(GetProgramLocations)"(Connection, "industrial", options);

shared CloudCompli.GetIndustrialLocationsTable = (Connection, optional options) 
    => "#lib(GetProgramLocationsTable)"(Connection, "industrial", options);

shared CloudCompli.GetInvestigations = (Connection, optional options) 
    => "#lib(GetInvestigations)"(Connection, options);

shared CloudCompli.GetInvestigationsTable = (Connection, optional options) 
    => "#lib(GetInvestigationsTable)"(Connection, options);

shared CloudCompli.GetLocationTags = (Connection, optional options) 
    => "#lib(GetLocationTags)"(Connection, options);

shared CloudCompli.GetLocationTagsTable = (Connection, optional options) 
    => "#lib(GetLocationTagsTable)"(Connection, options);

shared CloudCompli.GetMonitoringLocations = "#lib(GetMonitoringLocations)";

shared CloudCompli.GetMonitoringLocationsTable = "#lib(GetMonitoringLocationsTable)";

shared CloudCompli.GetMonitoringRecords = (Connection, optional options) 
    => "#lib(GetMonitoringRecords)"(Connection, options);

shared CloudCompli.GetMonitoringRecordsTable = (Connection, optional options) 
    => "#lib(GetMonitoringRecordsTable)"(Connection, options);

shared CloudCompli.GetMunicipalFixedAssetDeficiencies = (Connection, optional options) 
    => "#lib(GetProgramDeficiencies)"(Connection, "municipal-fixed-assets", options);

shared CloudCompli.GetMunicipalFixedAssetDeficienciesTable = (Connection, optional options) 
    => "#lib(GetProgramDeficienciesTable)"(Connection, "municipal-fixed-assets", options);

shared CloudCompli.GetMunicipalFixedAssetLocations = (Connection, optional options) 
    => "#lib(GetProgramLocations)"(Connection, "municipal-fixed-assets", options);

shared CloudCompli.GetMunicipalFixedAssetLocationsTable = (Connection, optional options) 
    => "#lib(GetProgramLocationsTable)"(Connection, "municipal-fixed-assets", options);

shared CloudCompli.GetMunicipalFieldActivityDeficiencies = (Connection, optional options) 
    => "#lib(GetProgramDeficiencies)"(Connection, "municipal-field-activities", options);

shared CloudCompli.GetMunicipalFieldActivityDeficienciesTable = (Connection, optional options) 
    => "#lib(GetProgramDeficienciesTable)"(Connection, "municipal-field-activities", options);

shared CloudCompli.GetMunicipalFieldActivityLocations = (Connection, optional options) 
    => "#lib(GetProgramLocations)"(Connection, "municipal-field-activities", options);

shared CloudCompli.GetMunicipalFieldActivityLocationsTable = (Connection, optional options) 
    => "#lib(GetProgramLocationsTable)"(Connection, "municipal-field-activities", options);

shared CloudCompli.GetPostconstructionDeficiencies = (Connection, optional options) 
    => "#lib(GetProgramDeficiencies)"(Connection, "postconstruction", options);

shared CloudCompli.GetPostconstructionDeficienciesTable = (Connection, optional options) 
    => "#lib(GetProgramDeficienciesTable)"(Connection, "postconstruction", options);

shared CloudCompli.GetPostconstructionLocations = (Connection, optional options) 
    => "#lib(GetProgramLocations)"(Connection, "postconstruction", options);

shared CloudCompli.GetPostconstructionLocationsTable = (Connection, optional options) 
    => "#lib(GetProgramLocationsTable)"(Connection, "postconstruction", options);

shared CloudCompli.GetPrograms = "#lib(GetPrograms)";

shared CloudCompli.GetProgramsTable = "#lib(GetProgramsTable)";

shared CloudCompli.GetProgramDeficiencies = "#lib(GetProgramDeficiencies)";

shared CloudCompli.GetProgramDeficienciesTable = "#lib(GetProgramDeficienciesTable)";

shared CloudCompli.GetProgramLocations = "#lib(GetProgramLocations)";

shared CloudCompli.GetProgramLocationsTable = "#lib(GetProgramLocationsTable)";

shared CloudCompli.GetReportDefinitions = "#lib(GetReportDefinitions)";

shared CloudCompli.GetReportDefinitionsTable = "#lib(GetReportDefinitionsTable)";

shared CloudCompli.GetReports = "#lib(GetReports)";

shared CloudCompli.GetReportsTable = "#lib(GetReportsTable)";

shared CloudCompli.GetUsers = "#lib(GetUsers)";

shared CloudCompli.GetUsersTable = "#lib(GetUsersTable)";

shared CloudCompli.GetWeatherHydstraObsStations = "#lib(GetWeatherHydstraObsStations)";

shared CloudCompli.GetWeatherHydstraObsStationsTable = "#lib(GetWeatherHydstraObsStationsTable)";

shared CloudCompli.Lib.GetApiResponse = "#lib(GetApiResponse)";

shared CloudCompli.Lib.GetPagedApiResponse = "#lib(GetPagedApiResponse)";

shared CloudCompli.Lib.Record.MapFields = "#lib(Record_MapFields)";

shared CloudCompli.Lib.Record.SelectFieldsWhereExists = "#lib(Record_SelectFieldsWhereExists)";

shared CloudCompli.Lib.TransformPointColumnToCoordinatesColumns = "#lib(TransformPointColumnToCoordinatesColumns)";

shared CloudCompli.Lib.TransformRecordsToTable = "#lib(TransformRecordsToTable)";

/**
 * Published datasets when a user select the CloudCompli data product from Get Data > CloudCompli.
 */

Datasets = [
    BMPs = () => CloudCompli.GetBmpsTable(Connection),
    CaswrcbIndustrialFacilities = (optional options) => CloudCompli.GetCaswrcbIndustrialFacilitiesTable(Connection, options),
    CaswrcbIndustrialFacilitiesCounties = () => CloudCompli.GetCaswrcbIndustrialFacilitiesCounties(Connection),
    CaswrcbIndustrialFacilitiesCities = () => CloudCompli.GetCaswrcbIndustrialFacilitiesCities(Connection),
    CaswrcbIndustrialFacilitiesRegionBoards = () => CloudCompli.GetCaswrcbIndustrialFacilitiesRegionBoards(Connection),
    CaswrcbIndustrialFacilitiesSics = () => CloudCompli.GetCaswrcbIndustrialFacilitiesSics(Connection),
    CaswrcbIndustrialFacilitiesReceivingWaters = () => CloudCompli.GetCaswrcbIndustrialFacilitiesReceivingWaters(Connection),
    CaswrcbWastewaterFacilityPermits = (optional options) => CloudCompli.GetCaswrcbWastewaterFacilityPermitsTable(Connection, options),
    CaswrcbWastewaterFacilityPermitsCounties = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsCounties(Connection),
    CaswrcbWastewaterFacilityPermitsCities = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsCities(Connection),
    CaswrcbWastewaterFacilityPermitsTypes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsTypes(Connection),
    CaswrcbWastewaterFacilityPermitsWasteTypes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsWasteTypes(Connection),
    CaswrcbWastewaterFacilityPermitsThreatCodes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsThreatCodes(Connection),
    CaswrcbWastewaterFacilityPermitsComplexityCodes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsComplexityCodes(Connection),
    CaswrcbWastewaterFacilityPermitsFeeCodes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsFeeCodes(Connection),
    CaswrcbWastewaterFacilityPermitsPretreatmentCodes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsPretreatmentCodes(Connection),
    CaswrcbWastewaterFacilityPermitsReclamationCodes = () => CloudCompli.GetCaswrcbWastewaterFacilityPermitsReclamationCodes(Connection),
    Constituents = () => CloudCompli.GetConstituentsTable(Connection),
    ConstructionCurrentBmpIneffectivenessScores = (optional options) => CloudCompli.GetConstructionCurrentBmpIneffectivenessScoresTable(Connection, options),
    ConstructionDeficiencies = (optional options) => CloudCompli.GetConstructionDeficienciesTable(Connection, options),
    ConstructionLocations = (optional options) => CloudCompli.GetConstructionLocationsTable(Connection, options),
    DeficiencyLevels = () => CloudCompli.GetDeficiencyLevelsTable(Connection),
    EducationInteractions = (optional options) => CloudCompli.GetEducationInteractionsTable(Connection, options),
    EnforcementLevels = () => CloudCompli.GetEnforcementLevelsTable(Connection),
    Enforcements = (optional options) => CloudCompli.GetEnforcementsTable(Connection, options),
    FlowMeters = () => CloudCompli.GetFlowMetersTable(Connection),
    FlowRecords = (optional options) => CloudCompli.GetFlowRecordsTable(Connection, options),
    IndustrialDeficiencies = (optional options) => CloudCompli.GetIndustrialDeficienciesTable(Connection, options),
    IndustrialLocations = (optional options) => CloudCompli.GetIndustrialLocationsTable(Connection, options),
    Investigations = (optional options) => CloudCompli.GetInvestigationsTable(Connection, options),
    LocationTags = (optional options) => CloudCompli.GetLocationTagsTable(Connection, options),
    MonitoringLocations = () => CloudCompli.GetMonitoringLocationsTable(Connection),
    MonitoringRecords = (optional options) => CloudCompli.GetMonitoringRecordsTable(Connection, options),
    MunicipalFixedAssetDeficiencies = (optional options) => CloudCompli.GetMunicipalFixedAssetDeficienciesTable(Connection, options),
    MunicipalFixedAssetLocations = (optional options) => CloudCompli.GetMunicipalFixedAssetLocationsTable(Connection, options),
    MunicipalFieldActivityDeficiencies = (optional options) => CloudCompli.GetMunicipalFieldActivityDeficienciesTable(Connection, options),
    MunicipalFieldActivityLocations = (optional options) => CloudCompli.GetMunicipalFieldActivityLocationsTable(Connection, options),
    PostconstructionDeficiencies = (optional options) => CloudCompli.GetPostconstructionDeficienciesTable(Connection, options),
    PostconstructionLocations = (optional options) => CloudCompli.GetPostconstructionLocationsTable(Connection, options),
    Programs = () => CloudCompli.GetProgramsTable(Connection),
    ProgramDeficiencies = (options) => CloudCompli.GetProgramDeficienciesTable(Connection, options[program], options),
    ProgramLocations = (options) => CloudCompli.GetProgramLocationsTable(Connection, options[program], options),
    ReportDefinitions = () => CloudCompli.GetReportDefinitionsTable(Connection),
    Reports = (options) => CloudCompli.GetReportsTable(Connection, options),
    Users = () => CloudCompli.GetUsersTable(Connection),
    WeatherHydstraObsStations = () => CloudCompli.GetWeatherHydstraObsStationsTable(Connection)
];

/**
 * Custom labels for published datasets in the list of dataset options when a user selects
 * Get Data > CloudCompli. If a label is not set here, then the field name from Datasets will
 * be used.
 */

DatasetsLabels = [
    CaswrcbIndustrialFacilities = "CASWRCB Industrial Facilities (has options, ex: {""facility_county"":""Orange""})",
    CaswrcbIndustrialFacilitiesCounties = "CASWRCB Industrial Facilities - Counties",
    CaswrcbIndustrialFacilitiesCities = "CASWRCB Industrial Facilities - Cities",
    CaswrcbIndustrialFacilitiesRegionBoards = "CASWRCB Industrial Facilities - Region Boards",
    CaswrcbIndustrialFacilitiesSics = "CASWRCB Industrial Facilities - SICs",
    CaswrcbIndustrialFacilitiesReceivingWaters = "CASWRCB Industrial Facilities - Receiving Waters",
    CaswrcbWastewaterFacilityPermits = "CASWRCB Wastewater Facility Permits (has options, ex: {""facility_county"":""Orange""})",
    CaswrcbWastewaterFacilityPermitsCounties = "CASWRCB Wastewater Facility Permits - Counties",
    CaswrcbWastewaterFacilityPermitsCities = "CASWRCB Wastewater Facility Permits - Cities",
    CaswrcbWastewaterFacilityPermitsTypes = "CASWRCB Wastewater Facility Permits - Types",
    CaswrcbWastewaterFacilityPermitsWasteTypes = "CASWRCB Wastewater Facility Permits - Waste Types",
    CaswrcbWastewaterFacilityPermitsThreatCodes = "CASWRCB Wastewater Facility Permits - Threat Codes",
    CaswrcbWastewaterFacilityPermitsComplexityCodes = "CASWRCB Wastewater Facility Permits - Complexity Codes",
    CaswrcbWastewaterFacilityPermitsFeeCodes = "CASWRCB Wastewater Facility Permits - Fee Codes",
    CaswrcbWastewaterFacilityPermitsPretreatmentCodes = "CASWRCB Wastewater Facility Permits - Pretreatment Codes",
    CaswrcbWastewaterFacilityPermitsReclamationCodes = "CASWRCB Wastewater Facility Permits - Reclamation Codes",
    ConstructionCurrentBmpIneffectivenessScores = "Construction BMP Ineffectiveness Scores (Current)",
    ConstructionDeficiencies = "Construction Deficiencies",
    ConstructionLocations = "Construction Locations",
    DeficiencyLevels = "Deficiency Levels",
    EducationInteractions = "Education Interactions",
    EnforcementLevels = "Enforcement Levels",
    FlowMeters = "Flow Meters",
    FlowRecords = "Flow Records",
    IndustrialDeficiencies = "Industrial Deficiencies",
    IndustrialLocations = "Industrial Locations",
    LocationTags = "Location Tags",
    MonitoringLocations = "Monitoring Locations",
    MonitoringRecords = "Monitoring Records",
    MunicipalFixedAssetDeficiencies = "Municipal Fixed Deficiencies",
    MunicipalFixedAssetLocations = "Municipal Fixed Assets",
    MunicipalFieldActivityDeficiencies = "Municipal Field Activities Deficiencies",
    MunicipalFieldActivityLocations = "Municipal Field Activities",
    ProgramDeficiencies = "Program Deficiencies (has options, ex: {""program"":""PROGRAM_TYPE_KEY""})",
    ProgramLocations = "Program Locations (has options, ex: {""program"":""PROGRAM_TYPE_KEY""})",
    PostconstructionDeficiencies = "Post-Construction Deficiencies",
    PostconstructionLocations = "Post-Construction Locations",
    ReportDefinitions = "Report Definitions",
    Reports = "Reports (has options, ex: {""report_definition_id"":1})",
    WeatherHydstraObsStations = "Weather Hydstra Observation Stations"
];

/**
 * Documentation shown for the published datasets when a user selects Get Data > CloudCompli.
 * Specifically, this presents the user with a dropdown where the AllowedValues are all of the
 * datasets in Datasets (labeled optionally by DatasetsLabels if specified there), as well as
 * a JSON field where they can specify additional options such as {"facility_county":"Orange"}
 * to provide more specificity for a specific dataset query.
 */

DatasetType = type function (
    message as (type text meta [
        DataSource.Path = false,
        Documentation.FieldCaption = "Dataset",
        Documentation.FieldDescription = "Dataset to pull in as a table",
        Documentation.AllowedValues = List.Transform(
            Record.FieldNames(Datasets),
            (key) => if Record.HasFields(DatasetsLabels, key) then Record.Field(DatasetsLabels, key) else key
        )
    ]),
    optional json as (type text meta [
        DataSource.Path = false,
        Documentation.FieldCaption = "Query properties (JSON)",
        Documentation.FieldDescription = "Extra query properties if required for specific datasets",
        Documentation.SampleValues = {"{""id"":10}"}
    ]))
    as any meta [
        Documentation.Name = "CloudCompli Datasets",
        Documentation.LongDescription = "Basic datasets as tables retrieved from the CloudCompli API. For building more advanced custom queries, see examples in the CloudCompli PowerBI Application Development Toolkit."
    ];

/**
 * The dataset demux-er which accepts a dataset as text (maybe a label as a field value from
 * DatasetsLabels or a raw field name from Datasets) and invokes the field value from Datasets,
 * which is assumed to be a callback.
 *
 * This call-forward will send 0 or 1 arguments to the dataset callback it invokes. This is based
 * on whether JSON data is specified in the optional json field or not. Callbacks in Datasets are 
 * responsible for managing if and how they accept this argument. 
 */

DatasetImpl = (
    dataset as text, 
    optional json as text
) as any => 

    let

        // Decodes optional json variable to an object as the first parameter iff defined. Otherwise, ends no arguments.
        props = if json <> null then
                try 
                    {Json.Document(json)} 
                otherwise 
                    {}
            else
                {},
        
        // Used to map a label back to an actual dataset method to invoke. Default to dataset name if no matching label exists.
        labelRow = Table.SelectRows(Record.ToTable(DatasetsLabels), (row) => row[Value] = dataset),
        method = if Table.RowCount(labelRow) > 0 then labelRow{0}[Name] else dataset,
        callback = try Expression.Evaluate(method, Datasets) otherwise error "Dataset does not exist: " & dataset

    in
        Function.Invoke(callback, props)
;

/**
 * Publish the data product out to be selectable as Get Data > CloudCompli.
 */

[DataSource.Kind="CloudCompli", Publish="CloudCompli.Publish"]
shared CloudCompli.GetDataset = Value.ReplaceType(DatasetImpl, DatasetType);

/**
 * Data source kind definition. The key portion of this is that it labels Username as "Instance Base URL"
 * and Password as "API Token" to make it intelligible when a user is inputting these values. These 
 * authentication values are then loaded into Connection and sent to our Datasets callbacks.
 */

CloudCompli = [
    Authentication = [
        UsernamePassword = [
            UsernameLabel = "Instance Base URL",
            PasswordLabel = "API Token"
        ]
    ],
    Label = "CloudCompli"
];

/**
 * Data source UI publishing description.
 */

CloudCompli.Publish = [
    Beta = true,
    Category = "Online Services",
    ButtonText = { "CloudCompli", "Provides connectivity with CloudCompli through its API." },
    SourceImage = CloudCompli.Icons,
    SourceTypeImage = CloudCompli.Icons
];

CloudCompli.Icons = [
    Icon16 = { Extension.Contents("CloudCompli16.png"), Extension.Contents("CloudCompli20.png"), Extension.Contents("CloudCompli24.png"), Extension.Contents("CloudCompli32.png") },
    Icon32 = { Extension.Contents("CloudCompli32.png"), Extension.Contents("CloudCompli40.png"), Extension.Contents("CloudCompli48.png"), Extension.Contents("CloudCompli64.png") }
];
