# PCProbe - PowerShell-based System Diagnostics and Network Admin Tool

## Version
0.0.1

## Date Created
24.09.2023

## Last Update
26.09.2023

## Author
Doron Bogomolov

## Description
PCProbe is a comprehensive tool designed to perform a wide range of system diagnostics and network administrative tasks on Windows 10 and higher systems. Developed in PowerShell, this CLI-based utility aims to centralize multiple functionalities, making it a Swiss army knife for system administrators and tech-savvy users.

## Goals
1. Collect crucial system information including, but not limited to, AV status, Windows version, and specific service statuses.
2. Query Active Directory to check if a PC is a member of the "ISE_GpoGrp".
3. Standalone and portable across Windows 10+ systems.
4. CLI-based for maximum compatibility.
5. In-house use, with a focus on manual data transfer and minimal security risks.

## Functions Implemented
- `Test-FileExists`: Checks if a given file path exists.
- `Test-Extension`: Validates the file extension of a given file.
- `Set-StealthMode`: Sets the StealthMode in the ISEPostureCFG.xml for Cisco AnyConnect.

## Upcoming Features
- Additional system information collection.
- Enhanced Active Directory queries.
- Service management functionalities.
- AnyConnect Agent status check.
- SCCM installation status.
- And much more...

## Security
The script is intended for in-house use only. Data pulled will either stay in the CLI or be exported to a CSV/txt file. The code will undergo a security review by a senior developer.

## How to Use
1. Clone the repository.
2. Navigate to the directory where the script is located.
3. Run the PowerShell script with administrative privileges.

