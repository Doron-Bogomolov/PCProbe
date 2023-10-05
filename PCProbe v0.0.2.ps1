<#
    Script Name: PCProbe v0.0.2.ps1
    Author: Doron Bogomolov
    Version: 0.0.2
    Purpose: A tool to collect system information as described.
    Date created: 20.08.2023
    Last update: 26.09.2023
#>

#============# Defining Variables #============#

# ISEPostureCFG.xml Default File location
$isePostureCfgPath = "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\ISE Posture\ISEPostureCFG.xml"





#============# Functions #============#


<#
    The "Test-FileExists" function checks if a given file path exists or not.
    Parameters: 
        -filePath "$pathToFile"  : The full path to the file whose existence is to be checked. (Without the parentheses)
    
    Returns:
        Returns $true if the file exists, otherwise returns $false.
    
    Behavior:
        - Takes the provided file path as a parameter.
        - Checks if the file at the specified path exists.
        - Returns a boolean value based on the file's existence.
    
    Intended Use:
        This function is used for basic file existence verification and is intended to be a building block in a modular script structure.
#>


function Test-FileExists {
    # Declare function parameters
    param (
        [string]$filePath
    )

    # Use Test-Path cmdlet to check if the file exists at the given path
    if (Test-Path $filePath) {
        # File exists, print message and return true
        Write-Host "$filePath found!" -ForegroundColor Green
        return $true
    } else {
        # File does not exist, print message and return false
        Write-Host "$filePath not found!" -ForegroundColor Red
        return $false
    }
}

#############################################################

<#
    The "Test-Extension" function validates the file extension of a given file against the specified extension type.
    Parameters: 
        -filePath "$pathOfTheFile" : The full path of the file whose extension needs to be checked.
        -extensionType ".extension" : The expected file extension, including the preceding dot (e.g., ".xml").
    
    Returns:
        - $true if the file extension matches the specified extension type.
        - $false if the file extension does not match.
    
    The function compares the file extension with the provided extension type and returns a boolean value accordingly.
    Intended for internal use and modular development to provide file type validation support for future tools and functions.
#>


function Test-Extension {
    # Declare function parameters
    param (
        [string]$filePath,
        [string]$extensionType
    )
    # This part will strip the extension from the file provided
    $strippedExtension = [System.IO.Path]::GetExtension($filePath)
    # Compare the extracted extension with the desired extension
    if ($strippedExtension -eq $extensionType) {
        Write-Host "The file has the correct extension."
        return $true
    } else {
        Write-Host "The file does not have the correct extension."
        return $false
    }
}
		
#############################################################

<#
    The "Set-StealthMode" function modifies the 'StealthMode' value in a given XML configuration file.
    Parameters: 
        -filePath "$filePath"      : The full path to the XML file to be modified.
        -mode "$mode"              : The new mode to set. Accepts either 1 for "Hidden" or 0 for "Visible".
    
    Returns:
        Prints a message indicating the new state of the 'StealthMode' (either "Hidden" or "Visible").
    
    Behavior:
        - Reads the XML content from the specified file path.
        - Modifies the 'StealthMode' value based on the 'mode' parameter.
        - Saves the modified XML content back to the same file.
        - Prints a message to inform the user of the change.
    
    Intended Use:
        This function is part of a modular toolset aimed at easing the management of XML-based configurations.
        It is particularly focused on the 'StealthMode' setting, toggling its state based on user input.
#>


function Set-StealthMode {
    # Declare function parameters
    param (
        [string]$filePath,
        [int]$mode
    )
    
    # Read the XML content from the specified file path
    [xml]$xmlContent = Get-Content -Path $filePath

    # Update the StealthMode element in the XML content
    $xmlContent.cfg.StealthMode = $mode

    # Save the modified XML content back to the original file
    $xmlContent.Save($filePath)
	
    # Convert integer mode to string for user-friendly message
    if ($mode -eq 1) {
        # Convert 1 to "Hidden"
        $mName = "Hidden"
    }
    else {
        # Convert 0 to "Visible"
        $mName = "Visible"
    }
    
    # Print a message to indicate the new Stealth Mode setting
    Write-Host "Stealth mode set to $mName"
}

#############################################################

# Function for showing submenu related to 'Test File Extension'
function TestExtensionMenu {
    $filePath = Read-Host "Enter the file path"
    $extensionType = Read-Host "Enter the extension (e.g. .txt)"
    Test-Extension -filePath $filePath -extensionType $extensionType
    Pause
}


#############################################################

function Menu-Options {
	
	
	
}









# Main menu function
function Show-MainMenu {
    Clear-Host
    Write-Host "Main Menu"
    Write-Host "1) Test File Extension"
    Write-Host "2) Quit"
    $choice = Read-Host "Please enter your choice"

    switch ($choice) {
        "1" { TestExtensionMenu; Show-MainMenu }
        "2" { Write-Host "Exiting..."; return }
        default { Write-Host "Invalid choice, please select a valid option."; Pause; Show-MainMenu }
    }
}





#============# Execution  #============#




# Entry point - invoke main menu
Show-MainMenu





#============# Debugging #============#




<#
	$fileExists = Test-FileExists -filePath $isePostureCfgPath


	# Calling the function for testing
	$result = Test-Extension -filePath $isePostureCfgPath -extensionType ".xml"

	# Print the result
	Write-Host "Extension test result: $result"

	# Inserting a breakpoint
	Read-Host "Press Enter to continue..."

	# Continue with the rest of the script...
#>

# Test the function
Parse-XML -filePath $isePostureCfgPath

# Inserting a breakpoint
Read-Host "Press Enter to continue..."



