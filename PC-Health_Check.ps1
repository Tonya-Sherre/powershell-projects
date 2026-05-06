Write-Host "=== PC Health Check ==="

$computerName = $env:COMPUTERNAME # Dynamically retrieves the computer name
$userName = $env:USERNAME # Dynamically retrieves the current user's name
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$disk = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3 AND DeviceID='C:'"

Write-Host "Computer Name: $computerName"
Write-Host "Current User: $userName"
Write-Host "Operating System: $($os.Caption)"
Write-Host "OS Version: $($os.Version)"
Write-Host "Free Space on C: Drive: $([math]::Round($disk.FreeSpace / 1GB, 2)) GB"
Write-Host "Total Space on C: Drive: $([math]::Round($disk.Size / 1GB, 2)) GB"

Write-Host "=== PC Health Check Completed ==="