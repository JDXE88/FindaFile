# Find-aFile.exe or PowerShell Script

## Overview

The `Find-aFile` PowerShell script is designed to search for files on a specified drive with a given filename pattern and file type. The search results are displayed in a graphical user interface (GUI) for easy viewing.

## Features

- **Search by Drive:** Specify the drive to search (e.g., `C:`, `D:`).
- **Search by File Name:** Input the file name or pattern to search for.
- **Search by File Type:** Choose from a list of file types (e.g., `.txt`, `.jpg`, `.pdf`).
- **Graphical User Interface:** A Windows Form GUI to simplify input and execution.

## Usage

### Parameters

- **Drive**: (Mandatory) The drive letter to search on. Options include `A:`, `B:`, `C:`, etc.
- **FileName**: (Mandatory) The name or pattern of the file to search for.
- **FileType**: (Mandatory) The file extension or type to search for (e.g., `txt`, `pdf`, `jpg`).

### Example Execution

1. **Open PowerShell**: Run the script in a PowerShell environment with appropriate permissions.

2. **Run the Script**: Execute the script to open the GUI:

   ```powershell
   .\Find-aFile.ps1
   ```

3. **Enter Search Criteria**:
   - Select a drive from the dropdown list.
   - Select a file type from the dropdown list.
   - Enter the file name or pattern in the text box.
   - Click "OK" to start the search, or "Cancel" to abort.

4. **View Results**: If files matching your criteria are found, they will be displayed in a grid view. If no files are found, a message will be shown in the PowerShell console.

## Script Details

### `Find-aFile` Function

The `Find-aFile` function performs the file search based on the provided parameters:
- Searches recursively in the specified drive.
- Filters files based on the filename and file type.
- Displays the results using `Out-GridView` or a message if no files are found.

### GUI Creation

The script creates a Windows Form with:
- Two dropdowns for selecting the drive and file type.
- A text input for entering the file name.
- OK and Cancel buttons for submitting or aborting the search.

## Requirements

- **PowerShell**: Ensure you are running PowerShell 5.1 or later.
- **.NET Framework**: Required for Windows Forms.

## License

This script is provided as-is. You are free to modify and use it according to your needs.

## Contact

For questions or support, please add it to the issues section on this repo

```

Feel free to adjust the contact information or any other specifics according to your needs.
