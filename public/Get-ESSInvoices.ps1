<#
.SYNOPSIS
    Returns invoices from Barracuda ESS API for the given Account Name.
.DESCRIPTION
    Returns invoices from Barracuda ESS API for the given Account Name.
.NOTES
    
.LINK
    https://api.intronis.com/portal-api.html#   
.EXAMPLE
    Get-ESSAuthToken | Get-ESSInvoices -User <ESS UserName> | Format-Table -AutoSize
#>
Function Get-ESSInvoices {
    param (
        [Parameter(ValueFromPipeline = $true)][String]$OauthToken,
        [Parameter(Mandatory = $true)][String]$User
    )
    process {
        $Headers2 = @{
            "accept"        = "application/json"
            "Authorization" = "Oauth $OauthToken"
        }
        $invoices = Invoke-RestMethod -Uri ("https://api.intronis.com/v2/accounts/{0}/invoices" -f $User) -method GET -Headers $Headers2
        return $invoices.data.invoices
    }
}