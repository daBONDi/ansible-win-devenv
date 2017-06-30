$ActiveDirectoryFQDN = $args[0]
$ActiveDirectoryNetbios = $args[1]

Add-WindowsFeature AD-Domain-Services

Import-Module ADDSDeployment

Install-ADDsDomain -CreateDnsDelegation:$false `
 -DatabasePath "C:\Windows\NTDS" `
 -DomainMode "Win2012R2" `
 -DomainName $ActiveDirectoryFQDN `
 -DomainNetbiosName $ActiveDirectoryNetbios `
 -InstallDns:$true `
 -LogPath "C:\Windows\NTDS" `
 -NoRebootOnCompletion:$true `
 -SysvolPath "C:\Windows\SYSVOL" `
 -Force:$true