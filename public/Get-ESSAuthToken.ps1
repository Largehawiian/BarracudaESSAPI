<#
.SYNOPSIS
    Gets OAuth token from Barracuda ESS API
.DESCRIPTION
    Gets OAuth token from Barracuda ESS API
.NOTES
    
.LINK
    https://api.intronis.com/portal-api.html#
.EXAMPLE
    Get-ESSAuthToken -ClientID "1234567890" -ClientSecret "1234567890"
#>
Function Get-ESSAuthToken {
    param(
        [parameter(Mandatory=$true)][String]$ClientID,
        [parameter(Mandatory=$true)][String]$ClientSecret
    )
    $Body = @{
        client_id     = $ClientID
        client_secret = $ClientSecret
        grant_type    = "none"
        scope         = "partners_read+accounts_read+accounts_write"
    }
    $Headers = @{
        "accept" = "application/json"
    }
    $Token = (Invoke-RestMethod -Method POST -Headers $Headers -Body $Body -Uri "https://auth.intronis.com/oauth2/token" -ContentType "application/x-www-form-urlencoded").access_token
    $Body = $Null
    return $Token
}