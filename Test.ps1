Write-Output "Downloading MARSAgent.exe"
$DownloadObj = New-Object System.Net.Webclient
$DestinationPath = "C:\MARSAgent.exe"
$SourcePath = "http://aka.ms/azurebackup_agent"
$DownloadObj.DownloadFile($SourcePath, $DestinationPath)

Write-Verbose "Unnecessary verbose message"
try {
    Write-Output "Checking for downloaded file"
    if (Test-Path $DestinationPath) {
        Write-Output "File found - installing agent"
           $InstallString = "$DestinationPath /q /nu"
           Invoke-Expression -Command $InstallString
        Write-Output "Installation Complete"
        Write-Error "Unnecessary Error"
    } else {
        Write-Output "OUT: Could not find $DestinationPath"
        Write-Error "ERROR: Could not find $DestinationPath"
    }
} catch [System.Exception] {
    Write-Error "ERROR: It's all gone wrong!"
    Write-Output $_
}
