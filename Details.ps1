$details = @()
foreach ($computer in (Get-Content 'computers.txt')) {
    $sn = gwmi -Class win32_bios -ComputerName $computer | select -ExpandProperty serialNumber
    $model = gwmi -Class win32_computersystem -ComputerName $computer | select -ExpandProperty model
    $detail = New-Object psObject -Property @{'SerialNumber'=$sn;'Model'=$model}
    $details += $detail
    } # end foreach
$details | Export-Csv -Path 'ComputerDetails.csv' -NoTypeInformation