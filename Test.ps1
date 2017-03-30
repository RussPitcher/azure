"----- Downloading MARSAgent.exe"
#$DownloadObj = New-Object System.Net.Webclient
$DestinationPath = "C:\MARSAgent.exe"
$SourcePath = "http://aka.ms/azurebackup_agent"
#$DownloadObj.DownloadFile($SourcePath, $DestinationPath)

Write-Verbose "----- Unnecessary verbose message"
try {
    "----- Checking for downloaded file"
    if (Test-Path $DestinationPath) {
        "----- File found - installing agent"
           $InstallString = "$DestinationPath /q /nu"
           Invoke-Expression -Command $InstallString
        "----- Installation Complete"
        Write-Error "----- Unnecessary Error"
    } else {
        "----- OUT: Could not find $DestinationPath"
        Write-Error "ERROR: Could not find $DestinationPath"
    }
} catch [System.Exception] {
    Write-Error "ERROR: It's all gone wrong!"
    $_
}
