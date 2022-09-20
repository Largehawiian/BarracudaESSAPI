<#
.SYNOPSIS
    Adds an email address to the Barracuda ESS Exclusion List
.DESCRIPTION
    Adds an email address to the Barracuda ESS Exclusion List
.NOTES
    
.LINK
    https://api.intronis.com/portal-api.html#
.EXAMPLE
    Get-ESSAuthToken | Add-ESSExclusion -Company "company" -User "user@emailaddress.com"
    ....
    $OauthToken = Get-ESSAuthToken
    $Exclustions | Foreach-Object { Add-ESSExclusion -OauthToken $OauthToken -Company "company" -User $_ }
#>
Function Add-ESSExclusion {
    param (
        [Parameter(ValueFromPipeline = $true)][String]$OauthToken,
        [Parameter(Mandatory = $true)][String]$Company,
        [Parameter(Mandatory = $true, ValueFromPipeline)][String]$User
    )
    process {
        $Headers2 = @{
            "accept"        = "application/json"
            "Authorization" = "Oauth $OauthToken"
        }
        $Body = @{
            user = $User
        } | Convertto-Json
        $response = Invoke-WebRequest -Uri "https://api.intronis.com/v2/accounts/$Company/usageaudit" -Headers $Headers2 -method POST -Body $Body
        return $response.content | ConvertFrom-Json
    }
}
