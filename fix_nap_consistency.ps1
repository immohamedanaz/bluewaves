# Fix NAP consistency: match website schema to exact GMB name "Bluewaves Travel & Tourism"

$filesToUpdate = @(
    "index.html",
    "airport-transfer-sri-lanka.html",
    "private-driver-sri-lanka.html",
    "sri-lanka-taxi-service.html",
    "colombo-taxi-service.html",
    "private-taxi-hire-sri-lanka.html",
    "tour-taxi-packages-sri-lanka.html",
    "ella-tour.html",
    "sigiriya-tour.html",
    "kandy-tour.html",
    "galle-tour.html",
    "yala-tour.html",
    "mirissa-tour.html",
    "colombo-city-tour.html",
    "blog/best-places-to-visit-sri-lanka.html",
    "blog/top-beaches-sri-lanka.html"
)

foreach ($file in $filesToUpdate) {
    if (-not (Test-Path $file)) { Write-Host "SKIP: $file"; continue }
    $c = Get-Content $file -Raw -Encoding UTF8
    $changed = $false

    # Update JSON-LD schema name from "Blue Waves Tours" to "Bluewaves Travel & Tourism"
    if ($c -match '"name": "Blue Waves Tours"') {
        $c = $c -replace '"name": "Blue Waves Tours"', '"name": "Bluewaves Travel & Tourism"'
        $changed = $true
    }

    # Update og:site_name
    if ($c -match 'content="Blue Waves Tours"') {
        $c = $c -replace 'content="Blue Waves Tours"', 'content="Bluewaves Travel & Tourism"'
        $changed = $true
    }

    # Update footer copyright
    if ($c -match 'Copyright 2026 Blue Waves Tours') {
        $c = $c -replace 'Copyright 2026 Blue Waves Tours', 'Copyright 2026 Bluewaves Travel & Tourism'
        $changed = $true
    }

    if ($changed) {
        [System.IO.File]::WriteAllText($file, $c, [System.Text.Encoding]::UTF8)
        Write-Host "UPDATED: $file"
    } else {
        Write-Host "NO CHANGE: $file"
    }
}
