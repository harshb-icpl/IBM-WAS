param(
    [Parameter(Mandatory=$true)]
    [int]$PortNumber
)

# Get process ID using the provided port number
#Write-Host "Looking for process listening on port $PortNumber..."
$procId = Get-NetTCPConnection -LocalPort $PortNumber | Where-Object { $_.State -eq 'Listen' } | Select-Object -ExpandProperty OwningProcess

# If process ID found
if ($procId) {
   # Write-Host "Process found with ID: $procId"
    # Get command line of the process
    $cmdLine = (Get-WmiObject Win32_Process -Filter "ProcessID=$procId").CommandLine
#    Write-Host "Command line of process: $cmdLine"

    # Use regex to extract path
    $matchResult = [System.Text.RegularExpressions.Regex]::Match($cmdLine, '"(.*?)"')
   # Write-Host "Matching regex for extracting path..."

    # If match found
    if ($matchResult.Success) {
        # Output the path 
	$path = $matchResult.Groups[1].Value 
#	Write-Host "Match found. Path with bin directory:" 
#	Write-Host $path 
	# Remove the \bin part from the path 
	$pathWithoutBin = $path -replace '\\bin\\.*$', '' 
#	Write-Host "Path without bin directory:" 
	Write-Host $pathWithoutBin\webapps\ROOT\WEB-INF\web.xml
    }

 else {
        Write-Host "Unable to determine Tomcat installation path."
    }
} else {
    Write-Host "No process listening on port $PortNumber."
}