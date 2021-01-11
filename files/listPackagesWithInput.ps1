if (-not $IsCoreCLR) {  # Workaround for Windows PowerShell
  # Only needed once per session.
  Remove-TypeData -ErrorAction Ignore System.Array
}
#
#
#
# I'M SO SORRY FOR ALL THE TRASH
#
# I'LL CLEAN UP SOON, I PROMISE
#
#
#
#$filter = "*Java*"; (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | Export-Csv C:\Temp\detectedJava.csv -Encoding ascii -NoTypeInformation
$registryLocations = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall","HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$jsonOutput = @()
Foreach ($location in $registryLocations)
{
  echo "Running in registry location: $location"
  #$filter = "*Java*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
  $filter = "*Java*"; $arr = ((Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json -Depth 10); $jsonOutput += ,$arr
  #$filter = "*JRE*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
  $filter = "*JRE*"; $arr = ((Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json -Depth 10); $jsonOutput += ,$arr
  #$filter = "*JDK*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
  $filter = "*JDK*"; $arr = ((Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json -Depth 10); $jsonOutput += ,$arr
  #$filter = "*OpenJDK*"; (Get-ChildItem $location).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
}

echo $jsonOutput
$jsonOutput | Out-File -Encoding ASCII -FilePath "{{ generated_path }}detectedJavaConcat.json"

#$newstreamreader = New-Object System.IO.StreamReader("{{ generated_path }}detectedJavaConcat.json")
#$eachlinenumber = 1
#$nonArray = $false;
#while ((($readeachline = $newstreamreader.ReadLine()) -ne $null) -and ($eachlinenumber -eq 1))
#{
#  if ($readeachline.Substring(0,2).Contains('{'))
#  {
#    echo "First char: "
#    echo $readeachline.Substring(0,2)
#    echo "Last char: "
#    echo $readeachline.Substring(($readeachline.length - 2),2)
#    $nonArray = $True;
#  }
#  $eachlinenumber++
#}
#$newstreamreader.Close(); $newstreamreader.Dispose()

#if ($nonArray -eq $True)
#{
  #echo "Tested true"
  #"[" + (Get-Content -Path "{{ generated_path }}detectedJavaConcat.json") + "]" | Out-file -Encoding ASCII -FilePath "{{ generated_path }}detectedJavaConcat.json"
#}

#$filter = "*Java*"; (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJavaWOW.json"
#$filter = "*JRE*"; (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJREWOW.json"
#$filter = "*JDK*"; (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJDKWOW.json"
#$filter = "*OpenJDK*-redhat"; (Get-ChildItem HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedOpenJDKWOW.json"

#$filter = "*Java*"; (Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJava.json"
#$filter = "*JRE*"; (Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJRK.json"
#$filter = "*OpenJDK*"; (Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedOpenJDK.json"
#$filter = "*JDK*"; (Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall).Name | % { $path = "Registry::$_"; Get-ItemProperty $path } | Where-Object { $_.DisplayName -like $filter } | Select-Object -Property DisplayName, PsChildName | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJDK.json"

#$files = "{{ generated_path }}detectedJavaWOW.json","{{ generated_path }}detectedJREWOW.json","{{ generated_path }}detectedJDKWOW.json","{{ generated_path }}detectedOpenJDKWOW.json","{{ generated_path }}detectedJava.json","{{ generated_path }}detectedJRE.json","{{ generated_path }}detectedJDK.json","{{ generated_path }}detectedOpenJDK.json"
#$javaOutput = @()
#Foreach ($file in $files) 
#{
#  if (Test-Path $file)
#  {
#    $javaOutput = $javaOutput + (Get-Content -Raw -Path $file | ConvertFrom-Json)
#  }
#}
#$javaWowOutput = Get-Content -Raw -Path "{{ generated_path }}detectedJavaWOW.json" | ConvertFrom-Json
#$jreWowOutput = Get-Content -Raw -Path "{{ generated_path }}detectedJREWOW.json" | ConvertFrom-Json
#$jdkWowOutput = Get-Content -Raw -Path "{{ generated_path }}detectedJDKWOW.json" | ConvertFrom-Json
#$openJDKWowOutput = Get-Content -Raw -Path "{{ generated_path }}detectedOpenJDKWOW.json" | ConvertFrom-Json
#$javaMainOutput = Get-Content -Raw -Path "{{ generated_path }}detectedJava.json" | ConvertFrom-Json
#$jreMainOutput = Get-Content -Raw -Path "{{ generated_path }}detectedJRE.json" | ConvertFrom-Json
#$jdkMainOutput = Get-Content -Raw -Path "{{ generated_path }}detectedJDK.json" | ConvertFrom-Json
#$openJDKMainOutput = Get-Content -Raw -Path "{{ generated_path }}detectedOpenJDK.json" | ConvertFrom-Json

#$javaWowOutput + $jreWowOutput + $jdkWowOutput + $openJDKWowOutput + $javaMainOutput + $jreMainOutput + $jdkMainOutput + $openJDKMainOutput | ConvertTo-Json -AsArray | Out-file "{{ generated_path }}detectedJavaConcat.json"
#$jsonOutput | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJavaConcat.json"
#$javaOutput | ConvertTo-Json | Add-Content "{{ generated_path }}detectedJavaConcat.json"

$firstLine = (Get-Content -Raw -Encoding UTF8 -Path "{{ generated_path }}detectedJavaConcat.json").SubString(0,1)
echo "Firstline: $firstLine"
#
if ($firstLine -eq "{")
{
  echo "Wrapping object array..."
  #$javaContent = (Get-Content -Path "{{ generated_path }}detectedJavaConcat.json" | Out-String )
  #$javaContent = (Get-Content -Path "{{ generated_path }}detectedJavaConcat.json" | ConvertFrom-Json | ConvertTo-Json -AsArray )
  $javaContent = Get-Content -Path "{{ generated_path }}detectedJavaConcat.json"
  $fLine = "["
  $lLine += "]"
  #$javaContent | Out-file -Encoding ASCII -FilePath "{{ generated_path }}detectedJavaConcat.json"
  $fLine + $javaContent + $lLine | Out-file -Encoding ASCII -FilePath "{{ generated_path }}detectedJavaConcat.json"
  #$fLine + $javaContent + $lLine | ConvertTo-Json | Set-Content "{{ generated_path }}detectedJavaConcat.json"
  #$fLine + $javaContent + $lLine | ConvertTo-Json | Tee-Object "{{ generated_path }}detectedJava.json"
}