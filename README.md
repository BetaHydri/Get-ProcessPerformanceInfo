# Get-ProcessPerformanceInfo

## Overview
GetProcessPerformance is a PowerShell script designed to retrieve and summarize memory usage statistics for specified processes on a Windows system. The script provides detailed information about various memory metrics, including Working Set, Private Bytes, Virtual Memory Size, Paged Memory Size, and Processor Time.

## Features
- Retrieve memory usage statistics for any running process by name.
- Summarize total memory usage across all instances of the specified process.
- Optionally export the results to a CSV file for further analysis.

## Installation
To use the script, simply download the `Get-ProcessGroupMemoryUsage.ps1` file and ensure you have PowerShell installed on your Windows machine.

## Usage
To run the script, open PowerShell and execute the following command:

```powershell
Get-ProcessGroupMemoryUsage -ProcessName "<ProcessName>"
```

Replace `<ProcessName>` with the name of the process you want to analyze (e.g., `msedge`).

### Example
To retrieve memory usage statistics for Microsoft Edge, you can run:

```powershell
Get-ProcessGroupMemoryUsage -ProcessName "msedge"
```

To export the results to a CSV file, use the `-ExportCsvPath` parameter:

```powershell
Get-ProcessGroupMemoryUsage -ProcessName "msedge" -ExportCsvPath "C:\Temp\msedge.csv"
```

## Contributions
Contributions to this project are welcome! If you have suggestions for improvements or additional features, please feel free to submit a pull request.

## Support
For any issues or questions regarding the script, please open an issue in the repository.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
