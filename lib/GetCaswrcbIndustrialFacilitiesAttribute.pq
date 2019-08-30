(
    Connection as record,
    attribute as text
) =>

    "#lib(GetApiResponse)"(Connection, "data/caswrcb/industrial-facilities/" & attribute)