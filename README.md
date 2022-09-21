# BarracudaESSAPI
Barracuda ESS Spam Filter API PowerShell Module

```
Install-Module BarracudaESSAPI
Import-Module BarracudaESSAPI
```

# Get OAthtoken
```
$Oath = Get-ESSAuthToken -ClientID "YourID" -ClientSecret "YourSecret"
```

# Get all partner tenant usage
```
Get-ESSPartnerConsumption -OauthToken $Oath -PartnerName "PartnerUserName"
```

# Get individual tenant email addresses and exclusions
```
Get-ESSCompanyConsumption -OathToken $Oath -Company "CompanyUserName"
```

# Add email address to exclusion list
```
Add-ESSExclusion -OauthToken $Oath -Company "CompanyUserName" -User "Email@ToExclude.com"
```

# Remove email address from exclusion list

```
Remove-ESSExclusion -OauthToken $Oath -Company "CompanyUserName" -User "Email@ToExclude.com"
```
