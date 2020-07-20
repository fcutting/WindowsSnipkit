$ErrorActionPreference = "SilentlyContinue"
$installedSoftware = Get-ItemProperty -Path "HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"

Foreach ($software in $installedSoftware) {
    $softwareName = $software | Select-Object -ExpandProperty DisplayName
    $softwareVersion = $software | Select-Object -ExpandProperty DisplayVersion
    $softwarePublisher = $software | Select-Object -ExpandProperty Publisher

    if (!([String]::IsNullOrEmpty($softwareName))) {
        Write-Host "$($softwareName) ($($softwarePublisher)) v$($softwareVersion)"
    }
}