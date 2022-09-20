<#
.SYNOPSIS
    Removes an email address to the Barracuda ESS Exclusion List
.DESCRIPTION
    Removes an email address to the Barracuda ESS Exclusion List
.NOTES
    
.LINK
    https://api.intronis.com/portal-api.html#
.EXAMPLE
    Get-ESSAuthToken | Remove-ESSExclusion -Company "company" -User "user@emailaddress.com"
    ....
    $OauthToken = Get-ESSAuthToken
    $Exclustions | Foreach-Object { Remove-ESSExclusion -OauthToken $OauthToken -Company "company" -User $_ }
#>
Function Remove-ESSExclusion {
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
        $response = Invoke-WebRequest -Uri "https://api.intronis.com/v2/accounts/$Company/usageaudit/$User" -Headers $Headers2 -method DELETE
        return $response.content | ConvertFrom-Json
    }
}