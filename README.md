# Find-aFile

`Find-aFile` is a utility designed to search for files on a specified drive based on the filename pattern and file type. The tool is available both as a PowerShell script and a standalone executable (`.exe`).

## Overview

The `Find-aFile` tool offers a graphical user interface (GUI) to facilitate file searches. You can use it as a PowerShell script or run the standalone executable directly on your Windows system.

## Features

- **Search by Drive**: Specify the drive letter (e.g., `C:`, `D:`).
- **Search by File Name**: Enter the file name or pattern to search for.
- **Search by File Type**: Select from a variety of file types (e.g., `.txt`, `.jpg`, `.pdf`).
- **GUI Interface**: Both the PowerShell script and `.exe` offer a user-friendly interface for ease of use.

## Installation

### Using the PowerShell Script

1. **Download the Script**: Obtain the `Find-aFile.ps1` file from the repository.
2. **Open PowerShell**: Ensure you are using PowerShell 5.1 or later.
3. **Run the Script**:
   ```powershell
   .\Find-aFile.ps1
   ```
4. **Follow the GUI Prompts**: The GUI will allow you to input search criteria and display results.

### Using the Executable

1. **Download the Executable**: Obtain the `Find-aFile.exe` file from the repository.
2. **Run the Executable**: Double-click `Find-aFile.exe` to launch the application.
3. **Follow the GUI Prompts**: The GUI will allow you to input search criteria and display results.

## Usage

### Parameters for PowerShell Script

- **Drive**: (Mandatory) The drive letter to search on (e.g., `C:`, `D:`).
- **FileName**: (Mandatory) The name or pattern of the file to search for.
- **FileType**: (Mandatory) The file extension or type to search for (e.g., `txt`, `pdf`, `jpg`).

### Example Execution for PowerShell Script

```powershell
.\Find-aFile.ps1
```

Follow the GUI to select the drive, file type, and enter the file name.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT). You are free to modify and distribute the code as long as you include the original license and attribution.

## Contact

For questions or support, please add it to the issues area on this repo.

## Acknowledgments

- **PowerShell**: The script uses PowerShell for search functionality and GUI creation.
- **Windows Forms**: Used for the GUI in both the PowerShell script and the standalone executable.

```
