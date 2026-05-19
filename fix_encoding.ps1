$f = 'index.html'
$bytes = [System.IO.File]::ReadAllBytes($f)
$s = [System.Text.Encoding]::UTF8.GetString($bytes)

# Build mojibake strings from byte arrays (avoids encoding corruption in script file)
$emdash = [System.Text.Encoding]::UTF8.GetString([byte[]](0xE2,0x80,0x94))
$rarr   = [System.Text.Encoding]::UTF8.GetString([byte[]](0xE2,0x86,0x92))

# Fix em-dash and right arrow
$s = $s.Replace($emdash, '&mdash;')
$s = $s.Replace($rarr, '&rarr;')

# Build lookup for Services icons (2.5rem) keyed by text in nearby h3
$i25 = [ordered]@{}
$i25['Airport Transfer Service']  = '<i class="fas fa-plane-arrival" style="font-size:2.5rem;color:#0ea5e9;"></i>'
$i25['Private Chauffeur Service'] = '<i class="fas fa-car" style="font-size:2.5rem;color:#d4a017;"></i>'
$i25['Sri Lanka Tour Packages']   = '<i class="fas fa-map-marked-alt" style="font-size:2.5rem;color:#10b981;"></i>'
$i25['Wildlife Safari']           = '<i class="fas fa-paw" style="font-size:2.5rem;color:#f59e0b;"></i>'
$i25['Beach Holiday']             = '<i class="fas fa-umbrella-beach" style="font-size:2.5rem;color:#3b82f6;"></i>'
$i25['Taxi Service']              = '<i class="fas fa-taxi" style="font-size:2.5rem;color:#f59e0b;"></i>'
$i25['Cultural']                  = '<i class="fas fa-landmark" style="font-size:2.5rem;color:#8b5cf6;"></i>'

# Build lookup for Why Choose Us icons (2rem)
$i20 = [ordered]@{}
$i20['5,750']        = '<i class="fas fa-trophy" style="font-size:2rem;color:#f0c040;"></i>'
$i20['Licensed']     = '<i class="fas fa-shield-alt" style="font-size:2rem;color:#f0c040;"></i>'
$i20['Transparent']  = '<i class="fas fa-tag" style="font-size:2rem;color:#f0c040;"></i>'
$i20['Island-Wide']  = '<i class="fas fa-map-marker-alt" style="font-size:2rem;color:#f0c040;"></i>'
$i20['24/7 Airport'] = '<i class="fas fa-clock" style="font-size:2rem;color:#f0c040;"></i>'
$i20['Customized']   = '<i class="fas fa-bullseye" style="font-size:2rem;color:#f0c040;"></i>'

$lines = $s -split "`r`n"

for ($idx = 0; $idx -lt $lines.Count; $idx++) {
    $line = $lines[$idx]
    # Only target icon divs that have no fa- class yet (broken emoji divs)
    if ($line -match 'margin-bottom:1rem' -and $line -notmatch 'fa-' -and $line -notmatch '<i ') {
        $found = $false
        # Look ahead up to 5 lines for matching h3 text
        $limit = [Math]::Min($idx + 6, $lines.Count)
        for ($j = $idx + 1; $j -lt $limit -and -not $found; $j++) {
            $next = $lines[$j]
            foreach ($key in $i25.Keys) {
                if ($next -match [regex]::Escape($key)) {
                    $lines[$idx] = '                        <div style="margin-bottom:1rem;">' + $i25[$key] + '</div>'
                    $found = $true; break
                }
            }
            if (-not $found) {
                foreach ($key in $i20.Keys) {
                    if ($next -match [regex]::Escape($key)) {
                        $lines[$idx] = '                    <div style="margin-bottom:1rem;">' + $i20[$key] + '</div>'
                        $found = $true; break
                    }
                }
            }
        }
        if (-not $found) {
            Write-Host ("UNMATCHED icon div at line " + ($idx + 1) + ": " + $line.Trim())
        }
    }
}

$s = $lines -join "`r`n"
[System.IO.File]::WriteAllText($f, $s, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: All icons and encoding fixed in index.html"
