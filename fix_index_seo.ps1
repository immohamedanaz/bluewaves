$file = "index.html"
$content = Get-Content -Path $file -Raw -Encoding UTF8

$newHead = @"
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Primary SEO Meta Tags -->
    <title>Blue Waves Tours | Best Sri Lanka Tour Packages &amp; Travel Agency</title>
    <meta name="description" content="Discover Sri Lanka with Blue Waves Tours. We offer customized tour packages, beach holidays, wildlife safaris, airport transfers, cultural tours, and luxury travel experiences across Sri Lanka.">
    <meta name="keywords" content="Sri Lanka Tours, Sri Lanka Tour Packages, Travel Agency Sri Lanka, Sri Lanka Tourism, Beach Holidays Sri Lanka, Sri Lanka Safari Tours, Sri Lanka Travel Guide, Sri Lanka Airport Transfers, Luxury Tours Sri Lanka, Best Travel Agency Sri Lanka">
    <meta name="robots" content="index, follow">
    <meta name="author" content="Blue Waves Tours">
    <link rel="canonical" href="https://www.bluewaves.lk/">
    <link rel="icon" type="image/png" href="/favicon.png">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.bluewaves.lk/">
    <meta property="og:title" content="Blue Waves Tours | Best Sri Lanka Tour Packages &amp; Travel Agency">
    <meta property="og:description" content="Discover Sri Lanka with Blue Waves Tours. Customized tour packages, beach holidays, wildlife safaris, airport transfers, and luxury travel experiences across Sri Lanka.">
    <meta property="og:image" content="https://www.bluewaves.lk/Main_pic.png">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="630">
    <meta property="og:site_name" content="Blue Waves Tours">
    <meta property="og:locale" content="en_US">

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="Blue Waves Tours | Best Sri Lanka Tour Packages">
    <meta name="twitter:description" content="Explore Sri Lanka with customized holiday packages and travel experiences. Book airport transfers, safaris, beach tours &amp; more.">
    <meta name="twitter:image" content="https://www.bluewaves.lk/Main_pic.png">

    <!-- Schema Markup - TravelAgency -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "TravelAgency",
      "name": "Blue Waves Tours",
      "url": "https://www.bluewaves.lk",
      "logo": "https://www.bluewaves.lk/logo.png",
      "image": "https://www.bluewaves.lk/Main_pic.png",
      "description": "Sri Lankan travel agency offering tours, safaris, beach holidays, cultural experiences, and airport transfers.",
      "areaServed": "Sri Lanka",
      "priceRange": "$$",
      "telephone": "+94758088087",
      "address": {
        "@type": "PostalAddress",
        "streetAddress": "24/4 Mattawa Road, Warakamura",
        "addressLocality": "Ukuwela",
        "addressCountry": "LK"
      },
      "sameAs": [
        "https://www.facebook.com/share/1CCptfN8FA/",
        "https://www.instagram.com/bluewavestoutism"
      ],
      "keywords": "Sri Lanka Tourism, Travel Sri Lanka, Tour Packages Sri Lanka, Sri Lanka Safari, Beach Tours",
      "serviceType": ["Airport Transfer", "Private Driver", "Sri Lanka Day Tours", "Safari Tours", "Beach Holidays", "Cultural Tours"]
    }
    </script>

    <!-- Schema - WebSite with SearchAction -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "Blue Waves Tours",
      "url": "https://www.bluewaves.lk",
      "potentialAction": {
        "@type": "SearchAction",
        "target": "https://www.bluewaves.lk/?s={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }
    </script>

    <!-- Schema - BreadcrumbList -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://www.bluewaves.lk/" },
        { "@type": "ListItem", "position": 2, "name": "Tours", "item": "https://www.bluewaves.lk/#destinations" },
        { "@type": "ListItem", "position": 3, "name": "Airport Transfers", "item": "https://www.bluewaves.lk/airport-transfer-sri-lanka.html" }
      ]
    }
    </script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="style.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Intl Tel Input CSS for flags -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <style>
        .iti {
            width: 100%;
            display: block;
        }

        /* Ensure flag dropdown takes full width */
    </style>
</head>
"@

# Find the position of <head> and </head> to replace the entire block
$headStart = $content.IndexOf("<head>")
$headEnd = $content.IndexOf("</head>") + "</head>".Length

if ($headStart -ge 0 -and $headEnd -gt $headStart) {
    $before = $content.Substring(0, $headStart)
    $after = $content.Substring($headEnd)
    $newContent = $before + $newHead.TrimEnd() + $after
    [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
    Write-Host "SUCCESS: index.html head updated with full SEO content"
} else {
    Write-Host "ERROR: Could not find head tags"
}
