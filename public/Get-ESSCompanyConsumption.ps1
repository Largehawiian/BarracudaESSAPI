<#
.SYNOPSIS
    Gets Barracuda ESS usage information for a given company.
.DESCRIPTION
    Gets Barracuda ESS usage information for a given company.
.NOTES
    
.LINK
    https://api.intronis.com/portal-api.html#
.EXAMPLE
    Get-ESSAuthtoken | Get-ESSCompanyConsumption -Company <ESS UserName>
#>

function Get-ESSCompanyConsumption {
    param (
        [Parameter(ValueFromPipeline = $true)][String]$OauthToken,
        [Parameter(Mandatory = $true)][String]$Company
    )
    process {
        $Headers2 = @{
            "accept"        = "application/json"
            "Authorization" = "Oauth $OauthToken"
        }
        $partnerusage = Invoke-WebRequest -Uri "https://api.intronis.com/v2/accounts/$Company/usageaudit" -Headers $Headers2 -method GET | Convertfrom-json
        return $partnerusage.audit_users
    }
}