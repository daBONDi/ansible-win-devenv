$dns = $($args[0])

Write-Host "Setup DNS: $($dns)"

# TODO: Automatic Detect Internal Adapter, Use Defined IP Address
$VagrantAdapter = Get-NetAdapter "Ethernet"
$VMAdapter = Get-NetAdapter "Ethernet 2"

$VagrantAdapterIfIndex = $VagrantAdapter.ifIndex
$VMAdapterIfIndex =  $VMAdapter.ifIndex

# Disable DNS Registration on Vagrant Adapter
Write-Host "Disable DNS Self Registration on Vagrant Adapter"
Get-DNSClient -InterfaceIndex $VagrantAdapterIfIndex | Set-DNSClient -RegisterThisConnectionsAddress $false

# Setup DNS on VM Adapter
Write-Host "Setup DNS Server on VM Adapter"
Set-DnsClientServerAddress -InterfaceIndex $VMAdapterIfIndex -ServerAddresses $dns