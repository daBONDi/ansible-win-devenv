$dns = $($args[0])
$ip = $($args[1])

Write-Host "Setup DNS: $($dns)"
Write-Host "Private Network Address: $($ip)"

# Find Private Network
$VMAdapterIfIndex = (Get-NetIPAddress | Where-Object IPAddress -eq $ip).InterfaceIndex
$VMAdapter = Get-NetAdapter -InterfaceIndex $VMAdapterIfIndex
$VagrantAdapter = Get-NetAdapter | Where-Object ifIndex -ne $VMAdapterIfIndex

$VagrantAdapterIfIndex = $VagrantAdapter.ifIndex
$VMAdapterIfIndex =  $VMAdapter.ifIndex

# Disable DNS Registration on Vagrant Adapter
Write-Host "Disable DNS Self Registration on Vagrant Adapter"
Get-DNSClient -InterfaceIndex $VagrantAdapterIfIndex | Set-DNSClient -RegisterThisConnectionsAddress $false

# Setup DNS on Vagrant Adapter
Write-Host "Setup DNS Server on Vagrant Adapter"
Set-DnsClientServerAddress -InterfaceIndex $VagrantAdapterIfIndex -ServerAddresses $dns

# Setup DNS on VM Adapter
Write-Host "Setup DNS Server on VM Adapter"
Set-DnsClientServerAddress -InterfaceIndex $VMAdapterIfIndex -ServerAddresses $dns