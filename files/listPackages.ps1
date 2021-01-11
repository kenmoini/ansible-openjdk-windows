#$filter = "*Java*"; (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | Export-Csv C:\Temp\detectedJava.csv -Encoding ascii -NoTypeInformation
$registryLocations = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall","HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
Foreach ($location in $registryLocations)
{
  echo "Running in registry location: $location"
  $filter = "*Java*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
  $filter = "*JDK*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
  $filter = "*JRE*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
  $filter = "*OpenJDK*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
}

$firstLine = Get-Content -Path "{{ generated_path }}detectedJava.json" -First 1

if ($firstLine -eq "{")
{
  $javaContent = Get-Content -Path "{{ generated_path }}detectedJava.json"
  $fLine = "["
  $lLine += "]"
  $fLine + $javaContent + $lLine | Out-file -Encoding ASCII -FilePath "{{ generated_path }}detectedJava.json"
}