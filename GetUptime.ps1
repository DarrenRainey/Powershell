<#
Darren Rainey 2023
https://github.com/DarrenRainey/Powershell
Defaults to the current computer - change $Computer name to remote IP or hostname to get remote uptime.
#>
$Computer = $env:computername
$OS = Get-WmiObject Win32_OperatingSystem -ComputerName $Computer -ErrorAction Stop
$Uptime = (Get-Date) - $OS.ConvertToDateTime($OS.LastBootUpTime)
[PSCustomObject]@{
	ComputerName  = $Computer
	LastBoot      = $OS.ConvertToDateTime($OS.LastBootUpTime)
	Uptime        = ([String]$Uptime.Days + " Days " + $Uptime.Hours + " Hours " + $Uptime.Minutes + " Minutes")
}
