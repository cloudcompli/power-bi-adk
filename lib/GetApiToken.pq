(
    connection as record 
) =>

    let
        response = Web.Contents("https://" & connection[Instance] & "/oauth2/token", [
            Headers=[#"Content-Type"="application/x-www-form-urlencoded"],
            Content=Text.ToBinary("grant_type=client_credentials&client_id=" & connection[ClientId] & "&client_secret=" & connection[ClientSecret])
        ]),
        doc = Json.Document(response)
    in
        doc[access_token]