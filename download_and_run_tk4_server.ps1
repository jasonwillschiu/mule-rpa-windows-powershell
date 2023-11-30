# Define the dynamic download folder path
$downloadsPath = Join-Path -Path $env:USERPROFILE -ChildPath "Downloads\green-screen-server-client"
Write-Host "Dynamic download folder path defined."

# Create the main folder
New-Item -Path $downloadsPath -ItemType Directory -Force
Write-Host "Main folder created or verified in the specified directory."

# Create subfolders for server and client
$serverPath = Join-Path -Path $downloadsPath -ChildPath "server"
$clientPath = Join-Path -Path $downloadsPath -ChildPath "client"
New-Item -Path $serverPath -ItemType Directory -Force
New-Item -Path $clientPath -ItemType Directory -Force
Write-Host "Server and Client subfolders created."

# Define the server file download URL and path
$url = "https://peppe8o.com/download/python/mainframe/tk4-_v1.00.zip"
$zipFilePath = Join-Path -Path $serverPath -ChildPath "tk4-_v1.00.zip"
Write-Host "Server file download URL and path defined."

# Download the server zip file
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $url -OutFile $zipFilePath -ErrorAction Stop

# Verify download and unzip the server file
if (Test-Path $zipFilePath) {
    Expand-Archive -Path $zipFilePath -DestinationPath $serverPath -Force
    Write-Host "Server zip file downloaded and unzipped."
} else {
    Write-Host "Download of server zip file failed."
}

# Cleanup (optional): Remove the downloaded server zip file
#Remove-Item -Path $zipFilePath
#Write-Host "Downloaded server zip file removed."

# Define the client file download URL and path
$url1 = "http://x3270.bgp.nu/download/04.03/wc3270-4.3ga4-setup.exe"
$filePath1 = Join-Path -Path $clientPath -ChildPath "wc3270-setup.exe"
Write-Host "Client file download URL and path defined."

# Download the client file
Invoke-WebRequest -Uri $url1 -OutFile $filePath1 -ErrorAction Stop

# Verify download of the client file
if (Test-Path $filePath1) {
    Write-Host "Client file downloaded."
} else {
    Write-Host "Download of client file failed."
}

# Run the 'mvs' file inside the server path
$mvsFilePath = Join-Path -Path $serverPath -ChildPath "mvs"
if (Test-Path $mvsFilePath) {
    Start-Process cmd.exe -ArgumentList "/k", "`"cd $serverPath & .\mvs`""
    Write-Host "started server in a new cmd window."
} else {
    Write-Host "'mvs' file not found in server path."
}