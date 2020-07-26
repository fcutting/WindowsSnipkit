param (
    [Parameter(Mandatory = $true)]
    [String]
    $path
)

Get-Content -Path $path
