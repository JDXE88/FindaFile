function Find-aFile {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("A:", "B:", "C:","D:", "E:", "F:", "G:", "H:", "I:", "J:", "K:", "L:", "M:", "N:", "O:", "P:", "Q:", "R:", "S:", "T:", "U:", "V:", "W:", "X:", "Y:", "Z:")]
        [string]$Drive,

        [Parameter(Mandatory=$true)]
        [string]$FileName,

        [Parameter(Mandatory=$true)]
        [ValidateSet(
            "txt", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "pdf",
            "jpg", "jpeg", "png", "gif", "bmp", "mp3", "mp4", "avi",
            "zip", "rar", "7z", "exe", "msi", "bat", "ps1", "csv",
            "html", "xml", "json", "log", "ini", "yaml", "sql",
            "tmp", "asd", "bak", "bak1", "bak2", "backup", "old", "log",
            "psd", "java", "cpp", "dll", "config", "conf", "tmp", "bak",
            "sql", "bak", "cfg", "ini", "tmp", "bak", "db", "mdb"
            )]
        [string]$FileType
    )
    begin {}
    process{
        $files = Get-ChildItem -Path "$Drive\" -Filter "*$FileName*$FileType" -File -ErrorAction SilentlyContinue -Recurse
        $filesArray = @()
        foreach ($file in $files) {
            $foundItem = $file | Select @{name="Found File(s)";expression={$_.FullName}}
            $filesArray += $foundItem
        }
        if ($filesArray)
        {
            $filesArray | Out-GridView -Title "Found File(s)"
        }
        else {
            Write-Host "No files found for $FileName.$FileType in $Drive"
        }
    }
}


Add-Type -AssemblyName System.Windows.Forms

# Create a form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Search for a File"
$form.Size = New-Object System.Drawing.Size(400, 200)
$form.StartPosition = "CenterScreen"

# Create a label for the first dropdown
$labelDropdown1 = New-Object System.Windows.Forms.Label
$labelDropdown1.Location = New-Object System.Drawing.Point(10, 20)
$labelDropdown1.Size = New-Object System.Drawing.Size(100, 20)
$labelDropdown1.Text = "Drive:"

# Create the first dropdown
$dropdown1 = New-Object System.Windows.Forms.ComboBox
$dropdown1.Location = New-Object System.Drawing.Point(120, 20)
$dropdown1.Size = New-Object System.Drawing.Size(200, 20)
$dropdown1.Items.AddRange(@("A:", "B:", "C:","D:", "E:", "F:", "G:", "H:", "I:", "J:", "K:", "L:", "M:", "N:", "O:", "P:", "Q:", "R:", "S:", "T:", "U:", "V:", "W:", "X:", "Y:", "Z:"))

# Create a label for the second dropdown
$labelDropdown2 = New-Object System.Windows.Forms.Label
$labelDropdown2.Location = New-Object System.Drawing.Point(10, 50)
$labelDropdown2.Size = New-Object System.Drawing.Size(100, 20)
$labelDropdown2.Text = "File Type:"

# Create the second dropdown
$dropdown2 = New-Object System.Windows.Forms.ComboBox
$dropdown2.Location = New-Object System.Drawing.Point(120, 50)
$dropdown2.Size = New-Object System.Drawing.Size(200, 20)
$dropdown2.Items.AddRange(@(
            "txt", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "pdf",
            "jpg", "jpeg", "png", "gif", "bmp", "mp3", "mp4", "avi",
            "zip", "rar", "7z", "exe", "msi", "bat", "ps1", "csv",
            "html", "xml", "json", "log", "ini", "yaml", "sql",
            "tmp", "asd", "bak", "bak1", "bak2", "backup", "old", "log",
            "psd", "java", "cpp", "dll", "config", "conf", "tmp", "bak",
            "sql", "bak", "cfg", "ini", "tmp", "bak", "db", "mdb"
            ))

# Create a label for the text input
$labelText = New-Object System.Windows.Forms.Label
$labelText.Location = New-Object System.Drawing.Point(10, 80)
$labelText.Size = New-Object System.Drawing.Size(100, 20)
$labelText.Text = "File Name:"

# Create the text input
$textInput = New-Object System.Windows.Forms.TextBox
$textInput.Location = New-Object System.Drawing.Point(120, 80)
$textInput.Size = New-Object System.Drawing.Size(200, 20)

# Create an OK button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(10, 120)
$okButton.Size = New-Object System.Drawing.Size(75, 23)
$okButton.Text = "OK"
$okButton.Add_Click({
    $script:dropdown1Value = $dropdown1.SelectedItem
    $script:dropdown2Value = $dropdown2.SelectedItem
    $script:textInputValue = $textInput.Text
    $form.DialogResult = "OK"
})

# Create a Cancel button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(95, 120)
$cancelButton.Size = New-Object System.Drawing.Size(75, 23)
$cancelButton.Text = "Cancel"
$cancelButton.Add_Click({
    $form.DialogResult = "Cancel"
})

# Add controls to the form
$form.Controls.Add($labelDropdown1)
$form.Controls.Add($dropdown1)
$form.Controls.Add($labelDropdown2)
$form.Controls.Add($dropdown2)
$form.Controls.Add($labelText)
$form.Controls.Add($textInput)
$form.Controls.Add($okButton)
$form.Controls.Add($cancelButton)

# Show the form and get the result
$result = $form.ShowDialog()

# Check the result
if ($result -eq "OK") {
    Write-Host "Staring search... This may take a while, but it will run in the background"
    Find-aFile -Drive $dropdown1Value -FileName $textInputValue -FileType $dropdown2Value
} else {
    Write-Host "You have cancelled the search."
}

