# Get all instances of cmd.exe
$cmdProcesses = Get-Process cmd -ErrorAction SilentlyContinue

# Close each instance
foreach ($process in $cmdProcesses) {
    # Safely close the process
    $process.CloseMainWindow() | Out-Null
    # If the process does not close in a timely manner, force it to close
    if (!$process.WaitForExit(2000)) { # Waits for 2 seconds
        $process.Kill()
    }
}
Start-Sleep -Seconds 5
Write-Host "All cmd instances have been closed."

# Define the dynamic download folder path
$downloadsPath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\green-screen-server-client"
# Create subfolders for server and client
$serverPath = Join-Path -Path $downloadsPath -ChildPath "server"
Write-Host "Server variable defined"

# delete everything except this one file
# Define the file to keep
$fileToKeep = "tk4-_v1.00.zip"

# Get all items in the folder
$items = Get-ChildItem -Path $serverPath

# Iterate through each item
foreach ($item in $items) {
    # Check if the item is not the file to keep
    if ($item.Name -ne $fileToKeep) {
        # Delete the item
        # Use Remove-Item -LiteralPath $item.FullName -Force -Recurse for folders
        Remove-Item -LiteralPath $item.FullName -Force -Recurse -Confirm:$false
    }
}
Write-Host "All files except for '$fileToKeep' have been deleted from '$folderPath'."

$zipFilePath = Join-Path -Path $serverPath -ChildPath "tk4-_v1.00.zip"
Expand-Archive -Path $zipFilePath -DestinationPath $serverPath -Force
Write-Host "Server zip file downloaded and unzipped."

# Run the 'mvs' file inside the server path
$mvsFilePath = Join-Path -Path $serverPath -ChildPath "mvs"
if (Test-Path $mvsFilePath) {
    Start-Process cmd.exe -ArgumentList "/k", "`"cd $serverPath & .\mvs`""
    Write-Host "started server in a new cmd window."
} else {
    Write-Host "'mvs' file not found in server path."
}
