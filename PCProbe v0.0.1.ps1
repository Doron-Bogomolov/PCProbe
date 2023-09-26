<#
    Script Name: PCProbe v0.0.1.ps1
    Author: Doron Bogomolov
    Version: 0.0.1
    Purpose: A tool to collect system information as described.
    Date created: 24.09.2023
	Last update: 26.09.2023
#>

#============# Defining Variables #============#

# ISEPostureCFG.xml Default File location
$isePostureCfgPath = "C:\ProgramData\Cisco\Cisco AnyConnect Secure Mobility Client\ISE Posture\ISEPostureCFG.xml"





#============# Functions #============#


<#
	"Test-FileExists" function Tests if the file path exists or not
	Paramaters: -filePath "$pathToFile" (Without the parentheses)
	If File exists return $true. If not, reutrn $false 
#>

function Test-FileExists {
    param (
        [string]$filePath
    )

    if (Test-Path $filePath) {
        Write-Host "$filePath found!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "$filePath not found!" -ForegroundColor Red
        return $false
    }
}

<#
	"Test-Extension" function tests the file extension provided.
	Paramaters: -filePath "$pathOfTheFile"
				-extensionType ".extension" (include the dot before the extension, like ".xml")
	If file extension is the same, return $true. else return $false
#>

function Test-Extension {
	param (
		[string]$filePath,
		[string]$extensionType
	)
		
	#This part will strip the extension from the file provided
	$strippedExtension = [System.IO.Path]::GetExtension($filePath)
	
	# Compare the extracted extension with the desired extension
	if ($strippedExtension -eq $extensionType) {
		return $true
	}
	else {
		return $false
	}
}
		


<#
    "Parse-XML" function reads and parses the content of an XML file.
    Parameters: -filePath "$pathToXMLFile"
    The function will load the XML content and print the outer XML content to the console.
    You can modify the function to manipulate or analyze the XML as required.
#>


function Set-StealthMode {
    param (
        [string]$filePath,
        [int]$mode
    )
    
    # Read the XML content
    [xml]$xmlContent = Get-Content -Path $filePath

    # Find the StealthMode element and change its value
    $xmlContent.cfg.StealthMode = $mode

    # Save the modified XML back to the file
    $xmlContent.Save($filePath)
	
	# Convert 1 and 0 to Hidden and Visible
	If ($mode -eq 1) {
		#Mode Name
		$mName = "Hidden"
	}
	else {
		$mName = "Visible"
	}
    
    Write-Host "Stealth mode set to $mName"
}









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



