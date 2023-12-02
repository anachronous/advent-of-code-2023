# Take input
$inp = Get-Content -Path .\input.txt
$inp | ForEach-Object { Write-Host "Original Line: $_" }

# get first numbers
$firstNumbers = $inp | ForEach-Object {
    if ($_ -match "\d") {
        $matches[0]
    }
}

# get last numbers
$lastNumbers = $inp | ForEach-Object {
    if ($_ -match "(\d)\D*$") {
        [int]$matches[1]
    }
}

$output = 0
# now add them all together
for ($i = 0; $i -lt $firstNumbers.Length; $i++) {
    $line = $firstNumbers[$i] + $lastNumbers[$i]

    $output += $line
    Write-Host "currently at: $output, with the line being $line"
}

Write-Host "The answer to task 1 is: $output"