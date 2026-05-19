$f = 'index.html'
$lines = [System.IO.File]::ReadAllLines($f, [System.Text.Encoding]::UTF8)

# Build the broken arrow string from char codes (Windows-1252 mojibake of right arrow ->)
# â = U+00E2, † = U+2020, ' = U+2019
$brokenArrow = [string][char]0x00E2 + [string][char]0x2020 + [string][char]0x2019

# Build the broken em-dash from char codes
# â = U+00E2, € = U+20AC, " = U+201C  (Windows-1252 mojibake of em-dash)
$brokenDash = [string][char]0x00E2 + [string][char]0x20AC + [string][char]0x201C

Write-Host "Searching for broken arrow: found $(($lines | Where-Object { $_ -match [regex]::Escape($brokenArrow) }).Count) lines"
Write-Host "Searching for broken dash: found $(($lines | Where-Object { $_ -match [regex]::Escape($brokenDash) }).Count) lines"

$fixed = 0
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i].Contains($brokenArrow)) {
        $lines[$i] = $lines[$i].Replace($brokenArrow, '&rarr;')
        $fixed++
    }
    if ($lines[$i].Contains($brokenDash)) {
        $lines[$i] = $lines[$i].Replace($brokenDash, '&mdash;')
        $fixed++
    }
}

[System.IO.File]::WriteAllLines($f, $lines, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: Fixed $fixed lines with broken arrows/dashes"
