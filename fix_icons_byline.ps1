$f = 'index.html'
$lines = [System.IO.File]::ReadAllLines($f, [System.Text.Encoding]::UTF8)

# Direct line-number replacements (1-indexed, convert to 0-indexed)
# Services section (2.5rem icons)
$lines[531] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-plane-arrival" style="font-size:2.5rem;color:#0ea5e9;"></i></div>'
$lines[540] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-car" style="font-size:2.5rem;color:#d4a017;"></i></div>'
$lines[549] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-map-marked-alt" style="font-size:2.5rem;color:#10b981;"></i></div>'
$lines[558] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-paw" style="font-size:2.5rem;color:#f59e0b;"></i></div>'
$lines[567] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-umbrella-beach" style="font-size:2.5rem;color:#3b82f6;"></i></div>'
$lines[576] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-taxi" style="font-size:2.5rem;color:#f59e0b;"></i></div>'
$lines[584] = '                        <div style="margin-bottom:1rem;"><i class="fas fa-landmark" style="font-size:2.5rem;color:#8b5cf6;"></i></div>'

# Why Choose Us section (2rem icons)
$lines[603] = '                    <div style="margin-bottom:1rem;"><i class="fas fa-trophy" style="font-size:2rem;color:#f0c040;"></i></div>'
$lines[608] = '                    <div style="margin-bottom:1rem;"><i class="fas fa-shield-alt" style="font-size:2rem;color:#f0c040;"></i></div>'
$lines[613] = '                    <div style="margin-bottom:1rem;"><i class="fas fa-tag" style="font-size:2rem;color:#f0c040;"></i></div>'
$lines[618] = '                    <div style="margin-bottom:1rem;"><i class="fas fa-map-marker-alt" style="font-size:2rem;color:#f0c040;"></i></div>'
$lines[623] = '                    <div style="margin-bottom:1rem;"><i class="fas fa-clock" style="font-size:2rem;color:#f0c040;"></i></div>'
$lines[628] = '                    <div style="margin-bottom:1rem;"><i class="fas fa-bullseye" style="font-size:2rem;color:#f0c040;"></i></div>'

# Also fix span arrows and p em-dashes in Services section
$arrowFix = @(534, 543, 552, 561, 570, 579, 587)
foreach ($ln in $arrowFix) {
    if ($lines[$ln] -match 'â') {
        $lines[$ln] = $lines[$ln] -replace 'â\S+', '&rarr;'
    }
}
$dashFix = @(542, 586, 610, 615, 620, 625, 630)
foreach ($ln in $dashFix) {
    if ($lines[$ln] -match 'â') {
        $lines[$ln] = $lines[$ln] -replace 'â\S+\s?\S*', '&mdash;'
    }
}

[System.IO.File]::WriteAllLines($f, $lines, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: Icons replaced by line number"

# Verify
$check = Select-String -Path $f -Pattern 'fas fa-' | Measure-Object
Write-Host ("Font Awesome icons found: " + $check.Count)
