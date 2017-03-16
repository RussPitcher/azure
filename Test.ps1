$DownloadObj = New-Object System.Net.Webclient
$DestinationPath = "C:\MARSAgent.exe"
$SourcePath = "http://aka.ms/azurebackup_agent"
$DownloadObj.DownloadFile($SourcePath, $DestinationPath)

try {
    if (Test-Path $DestinationPath) {
           $InstallString = "$DestinationPath /q /nu"
           Invoke-Expression -Command $InstallString
    } else {
        "ERROR: Could not find $DestinationPath"
    }
} catch [System.Exception] {
    "ERROR: It's all gone wrong!"
    $_
}
