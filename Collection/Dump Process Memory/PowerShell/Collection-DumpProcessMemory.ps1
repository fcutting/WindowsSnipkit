param (
    [Parameter(Mandatory = $true)]
    [Int]
    $ProcessPID,

    [Parameter(Mandatory = $true)]
    [String]
    $OutFile
)

$process = Get-Process -Id $processPID
$processHandle = $process.Handle

$MemberDefinition = @'
[DllImport("Dbghelp.dll", CharSet = CharSet.Unicode)]
public static extern bool MiniDumpWriteDump(IntPtr hProcess, uint ProcessId, IntPtr hFile, int DumpType, IntPtr ExceptionParam, IntPtr UserStreamParam, IntPtr CallbackParam);
'@

$Dbghelp = Add-Type -MemberDefinition $MemberDefinition -Name 'Dbghelp' -Namespace 'newnamespace' -PassThru

$path = Join-Path $PSScriptRoot $OutFile
$fileStream = [System.IO.File]::Create($path)

$ret = $Dbghelp::MiniDumpWriteDump($processHandle, $ProcessPID, $fileStream.Handle, 0x00061907, [IntPtr]::Zero, [IntPtr]::Zero, [IntPtr]::Zero)

$fileStream.Close()

if ($ret) {
    Write-Host "Process memory dump successful"
}
else {
    Write-Host "Process memory dump not failed"
}