$Data = Import-Csv ".\Input\Input.csv"
$Counter = 1
$Data | ForEach-Object{
    $Server = $_.Server
    $perc=[math]::round(($Counter/($Data).Count)*100)
    Write-progress -id 1 -percent $perc -activity "Looking up $($Server)"    
    Start-Sleep -Milliseconds 500
    $Counter++
    
}