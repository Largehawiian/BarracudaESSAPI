<#
.SYNOPSIS
    Gets a list of all accounts associated with the partner and their usage.
.DESCRIPTION
    Gets a list of all accounts associated with the partner and their usage.
.NOTES
    
.LINK
    https://api.intronis.com/portal-api.html#
.EXAMPLE
    Get-ESSAuthToken | Get-ESSPartnerConsumption
#>
function Get-ESSPartnerConsumption {
    param (
        [Parameter(ValueFromPipeline = $true)][String]$OauthToken,
        [Parameter(Mandatory = $true)][String]$PartnerName
    )
    process {
        $Headers2 = @{
            "accept"        = "application/json"
            "Authorization" = "Oauth $OauthToken"
        }
        $partnerusage = Invoke-WebRequest -Uri "https://api.intronis.com/v2/partners/$PartnerName/consumptionusage" -Headers $Headers2 -method GET | Convertfrom-json
        return $partnerusage
    }
}