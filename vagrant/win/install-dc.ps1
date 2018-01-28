#####################################################################
#   Install Domain Controller                                       #
#####################################################################

# Arguments getting passed from Vagrant File
$ActiveDirectoryFQDN = $args[0]
$ActiveDirectoryNetbios = $args[1]

# Add needed Windows Features
Write-Host "Adding AD-Domain-Services Windows Feature"
Add-WindowsFeature AD-Domain-Services | Out-Null

# Install the Domain Controller
Import-Module ADDSDeployment

$safemodepw = ConvertTo-SecureString "P@ssW0rD!" -AsPlainText -Force

Write-Host "Configuring Active Directory Domain $ActiveDirectoryFQDN($ActiveDirectoryNetbios)"
Install-ADDSForest -SafeModeAdministratorPassword $safemodepw `
  -DomainName $ActiveDirectoryFQDN `
  -DomainNetbiosName $ActiveDirectoryNetbios `
  -Confirm:$false `
  -InstallDns `
  -CreateDnsDelegation:$false `
  -Force | Out-Null
Write-Host "Finished Configure Active Directory Domain, need a Restart"

# Need this Workaround see
# https://github.com/dbroeglin/windows-lab/issues/1
Write-Host "Start sleeping until reboot to prevent vagrant connection failures..."
Start-Sleep 180