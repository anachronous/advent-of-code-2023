# Take input
$inp = Get-Content -Path .\input.txt
$inp | ForEach-Object { Write-Host "Original Line: $_" }


$words = @{
    "zero" = 0; "one" = 1; "two" = 2; "three" = 3; "four" = 4;
    "five" = 5; "six" = 6; "seven" = 7; "eight" = 8; "nine" = 9
}

function Replace-WordsWithDigits {
    param([string]$line)

    $result = ""
    while ($line.Length -gt 0) {
        $foundMatch = $false
        foreach ($word in $words.Keys) {
            if ($line.StartsWith($word)) {
                $result += $words[$word]
                $line = $line.Substring($word.Length)
                $foundMatch = $true
                break
            }
        }
        if (-not $foundMatch) {
            $result += $line[0]
            $line = $line.Substring(1)
        }
    }
    return $result
}


$processedInput = $inp | ForEach-Object {
    Replace-WordsWithDigits $_
}


$firstNumbers = $processedInput | ForEach-Object {
    if ($_ -match "\d") {
        $matches[0]
    }
}


$lastNumbers = $processedInput | ForEach-Object {
    if ($_ -match "(\d)\D*$") {
        $matches[1]
    }
}

$output = 0
$flen = $firstNumbers.Length
$llen = $lastNumbers.Length
# now add them all together
for ($i = 0; $i -lt $firstNumbers.Length; $i++) {
    $curInput = $processedInput[$i]
    $ogInput = $inp[$i]
    Write-Host "Current: $output, Processed Input: $curInput, Original Input: $ogInput"
    $line = $firstNumbers[$i] + $lastNumbers[$i]

    $output += $line
    Write-Host "after adding at: $output, with the line being $line"
}

Write-Host "The answer to task 2 is: $output"
Write-Host "flen: $flen, llen: $llen"