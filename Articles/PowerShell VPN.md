#vpn #powershell 

Example
```powershell
Add-VpnConnection -Name "[VPNConnectionName]" -ServerAddress "[ServerNameOrIP]" -TunnelType [VPNType] -AuthenticationMethod [AuthMethod] -RememberCredential -AllUserConnection -PassThru
Add-VpnConnectionRoute
Set-VpnConnection
Set-VpnConnectionIPsecConfiguration
Get-VpnConnection
```

## L2TP
```powershell
Add-VpnConnection -Name "VPN" -ServerAddress 176.16.1.2 -TunnelType "L2tp"
```

## IKEv2
```powershell
Add-VpnConnection -Name "VPN" -ServerAddress 176.16.1.2 -TunnelType "Ikev2"

Set-VpnConnectionIPsecConfiguration -ConnectionName "VPN" -AuthenticationTransformConstants None -CipherTransformConstants AES256 -EncryptionMethod AES256 -IntegrityCheckMethod SHA384 -PfsGroup None -DHGroup ECP384 -PassThru -Force
Set-VpnConnectionIPsecConfiguration -ConnectionName "VPN" -AuthenticationTransformConstants GCMAES256 -CipherTransformConstants None -EncryptionMethod AES256 -IntegrityCheckMethod SHA384 -PfsGroup None -DHGroup ECP384 -PassThru -Force
```

