function New-ConfigJson {
    param(
        [parameter(Mandatory)]
            [string] $ConfigFilePath,
        [parameter(Mandatory)]
            [string] $Name,
        [parameter(Mandatory)]
            [string] $MountName,
        [parameter(Mandatory)]
            [string] $GuestCred,
        [parameter(Mandatory)]
            [ipaddress] $TestIp,
        [parameter(Mandatory)]
            [string] $TestNetwork,
        [parameter(Mandatory)]
            [ipaddress] $TestGateway,
        [parameter(Mandatory)]
            [string[]] $Tasks
    )

    if (-not (Test-FolderStructure -Config)) {
        $null = New-Item -Path './config' -ItemType Directory
    }

    [pscustomobject]$MyInvocation.BoundParameters |
    ConvertTo-Json -Depth 3 | 
    Set-Content -Path (Join-Path './config' $ConfigFilePath)
}