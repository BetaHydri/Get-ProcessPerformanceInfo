function Get-ProcessGroupMemoryUsage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$ProcessName,

        [Parameter(Mandatory = $false)]
        [string]$ExportCsvPath
    )

    # Get all instances of the process
    $processes = Get-Process -Name $ProcessName

    # Initialize counters
    $totalWorkingSet = 0
    $totalPrivateBytes = 0
    $totalPagedMemorySize = 0
    $TotalProcessorTime = 0
    $totalVirtualMemorySize = 0

    # Create an array to store process objects
    $processObjects = @()

    # Loop through each process and sum the counters
    foreach ($process in $processes) {
        # Create a PSObject for the process
        $processObject = New-Object PSObject -Property @{
            ProcessName              = $process.ProcessName
            Id                       = $process.Id
            "WorkingSet (MB)"        = [math]::Round($process.WorkingSet64 / 1MB, 2)
            "PrivateBytes (MB)"      = [math]::Round($process.PrivateMemorySize64 / 1MB, 2)
            "VirtualMemorySize (MB)" = [math]::Round($process.VirtualMemorySize64 / 1MB, 2)
            "PagedMemorySize (MB)"   = [math]::Round($process.PagedMemorySize64 / 1MB, 2)
            "ProcessorTime (%)"      = [math]::Round($process.CPU / 8, 2)
        }

        # Add the PSObject to the array
        $processObjects += $processObject
        # Update the total counters
        $totalWorkingSet += $processObject."WorkingSet (MB)"
        $totalPrivateBytes += $processObject."PrivateBytes (MB)"
        $totalPagedMemorySize += $processObject."PagedMemorySize (MB)"
        $TotalProcessorTime += $processObject."ProcessorTime (%)"
    }

    # Output the process objects
    $processObjects | Format-Table -AutoSize

    # Export to CSV if ExportCsvPath is provided
    if ($ExportCsvPath) {
        $processObjects | Export-Csv -Path $ExportCsvPath -NoTypeInformation
        Write-Output "Results exported to $ExportCsvPath"
    }

    # Output the results
    Write-Output "Total $ProcessName WorkingSet: $totalWorkingSet MB"
    Write-Output "Total $ProcessName PrivateBytes: $totalPrivateBytes MB"
    Write-Output "Total $ProcessName Pagedmemory: $totalPagedMemorySize MB"
    Write-Output "Total $ProcessName ProcessorTime: $TotalProcessorTime %"
}