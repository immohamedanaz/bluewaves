# Phase 1: Update homepage schema to include Taxi Service keywords
$file = "index.html"
$content = Get-Content -Path $file -Raw -Encoding UTF8

# Update serviceType to include taxi services
$oldServiceType = '"serviceType": ["Airport Transfer", "Private Driver", "Sri Lanka Day Tours", "Safari Tours", "Beach Holidays", "Cultural Tours"]'
$newServiceType = '"serviceType": ["Airport Transfer", "Private Driver", "Taxi Service", "Sri Lanka Day Tours", "Safari Tours", "Beach Holidays", "Cultural Tours", "Online Taxi Booking"]'
$content = $content.Replace($oldServiceType, $newServiceType)

# Update keywords in schema
$oldKeywords = '"keywords": "Sri Lanka Tourism, Travel Sri Lanka, Tour Packages Sri Lanka, Sri Lanka Safari, Beach Tours"'
$newKeywords = '"keywords": "Sri Lanka Tourism, Travel Sri Lanka, Tour Packages Sri Lanka, Sri Lanka Safari, Beach Tours, Taxi Service Sri Lanka, Airport Taxi Sri Lanka, Private Taxi Hire Sri Lanka"'
$content = $content.Replace($oldKeywords, $newKeywords)

# Add taxi service to meta keywords
$oldMetaKeywords = 'content="Sri Lanka Tours, Sri Lanka Tour Packages, Travel Agency Sri Lanka, Sri Lanka Tourism, Beach Holidays Sri Lanka, Sri Lanka Safari Tours, Sri Lanka Travel Guide, Sri Lanka Airport Transfers, Luxury Tours Sri Lanka, Best Travel Agency Sri Lanka"'
$newMetaKeywords = 'content="Sri Lanka Tours, Sri Lanka Tour Packages, Travel Agency Sri Lanka, Sri Lanka Tourism, Beach Holidays Sri Lanka, Sri Lanka Safari Tours, Sri Lanka Travel Guide, Sri Lanka Airport Transfers, Taxi Service Sri Lanka, Airport Taxi Sri Lanka, Tourist Taxi Sri Lanka, Private Taxi Hire Sri Lanka, Luxury Tours Sri Lanka, Best Travel Agency Sri Lanka"'
$content = $content.Replace($oldMetaKeywords, $newMetaKeywords)

[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: Homepage schema and meta keywords updated with taxi service keywords"
