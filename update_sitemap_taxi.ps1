$file = "sitemap.xml"
$xml = @'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

  <!-- Homepage -->
  <url><loc>https://www.bluewaves.lk/</loc><lastmod>2026-05-19</lastmod><changefreq>weekly</changefreq><priority>1.0</priority></url>

  <!-- Core Service Pages -->
  <url><loc>https://www.bluewaves.lk/airport-transfer-sri-lanka.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.9</priority></url>
  <url><loc>https://www.bluewaves.lk/private-driver-sri-lanka.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.9</priority></url>

  <!-- Taxi Service Pages -->
  <url><loc>https://www.bluewaves.lk/sri-lanka-taxi-service.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.9</priority></url>
  <url><loc>https://www.bluewaves.lk/colombo-taxi-service.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/private-taxi-hire-sri-lanka.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/tour-taxi-packages-sri-lanka.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>

  <!-- Destination Tour Pages -->
  <url><loc>https://www.bluewaves.lk/sigiriya-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/kandy-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/ella-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/galle-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/yala-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/mirissa-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>
  <url><loc>https://www.bluewaves.lk/colombo-city-tour.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.8</priority></url>

  <!-- Blog Posts -->
  <url><loc>https://www.bluewaves.lk/blog/best-places-to-visit-sri-lanka.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.7</priority></url>
  <url><loc>https://www.bluewaves.lk/blog/top-beaches-sri-lanka.html</loc><lastmod>2026-05-19</lastmod><changefreq>monthly</changefreq><priority>0.7</priority></url>

</urlset>
'@
[System.IO.File]::WriteAllText($file, $xml, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: sitemap.xml updated with all taxi pages"

# Also add taxi service link to homepage services section
$index = Get-Content "index.html" -Raw -Encoding UTF8
$oldLink = '<a href="kandy-tour.html" style="text-decoration:none;">'
$taxiLink = @'
                <a href="sri-lanka-taxi-service.html" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-1" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #f59e0b;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">🚖</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Taxi Service Sri Lanka</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">Professional tourist taxi service across Sri Lanka. Airport taxi, Colombo taxi, private taxi hire, and taxi tour packages. Fixed rates, 24/7, no hidden charges.</p>
                        <span style="color:#f59e0b;font-weight:600;font-size:0.9rem;">Book Taxi Now →</span>
                    </div>
                </a>
'@
if ($index -notlike "*sri-lanka-taxi-service.html*") {
    $index = $index.Replace($oldLink, $taxiLink + "`n                " + $oldLink)
    [System.IO.File]::WriteAllText("index.html", $index, [System.Text.Encoding]::UTF8)
    Write-Host "SUCCESS: Taxi service card added to homepage services section"
} else {
    Write-Host "INFO: Taxi link already in homepage"
}
