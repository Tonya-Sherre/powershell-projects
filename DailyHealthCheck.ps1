$date = Get-date

$computer = $env:COMPUTERNAME

$disk = Get-CimInstance Win32_LogicalDisk  -Filter "DeviceID= 'C:'"

$output = @"
==== Daily PC Health Check ====
Date: $date
Computer Name: $computer
Free Space: $([math]::Round($disk.FreeSpace / 1GB, 2)) GB
Total Space: $([math]::Round($disk.Size / 1GB, 2)) GB
===============================
"@
$output |  Out-File  "C:\Users\User\Documents\IT Projects\HealthCheck.txt" -Append