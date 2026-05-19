$file = "index.html"
$c = Get-Content $file -Raw -Encoding UTF8

# Add LocalBusiness schema block matching GMB exactly — insert after </head> opening TravelAgency schema
$localBizSchema = @'

    <!-- LocalBusiness Schema — matches Google My Business listing exactly for entity linking -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": ["LocalBusiness", "TravelAgency"],
      "name": "Bluewaves Travel & Tourism",
      "alternateName": ["Blue Waves Tours", "Bluewaves Tours", "Blue Waves Sri Lanka"],
      "url": "https://www.bluewaves.lk",
      "logo": "https://www.bluewaves.lk/logo.png",
      "image": "https://www.bluewaves.lk/Main_pic.png",
      "description": "Sri Lanka travel agency and taxi service offering airport transfers, private chauffeur service, customized tour packages, beach holidays, wildlife safaris, and cultural tours.",
      "telephone": "+94758088087",
      "priceRange": "$$",
      "areaServed": "Sri Lanka",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "24/4 Mattawa Road, Warakamura",
        "addressLocality": "Ukuwela",
        "addressRegion": "Central Province",
        "addressCountry": "LK"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": "7.4675",
        "longitude": "80.6234"
      },
      "openingHoursSpecification": {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],
        "opens": "00:00",
        "closes": "23:59"
      },
      "sameAs": [
        "https://www.facebook.com/share/1CCptfN8FA/",
        "https://www.instagram.com/bluewavestoutism",
        "https://maps.app.goo.gl/Zcaj2KFtNTgRWywB8"
      ],
      "hasMap": "https://maps.app.goo.gl/Zcaj2KFtNTgRWywB8",
      "serviceType": ["Airport Transfer", "Taxi Service", "Private Driver", "Tour Operator", "Travel Agency"]
    }
    </script>

'@

# Insert before the closing </head> tag
$c = $c.Replace('    <link rel="preconnect" href="https://fonts.googleapis.com">', $localBizSchema + '    <link rel="preconnect" href="https://fonts.googleapis.com">')

[System.IO.File]::WriteAllText($file, $c, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: LocalBusiness schema added to index.html"
