(
    Connection as record,
    attribute as text
) =>

    "#lib(GetApiResponse)"(Connection, "data/caswrcb/wastewater-facility-permits/" & attribute)