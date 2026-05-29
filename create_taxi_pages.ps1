function Make-Page($file, $title, $desc, $keys, $canonical, $h1, $sub, $sections) {
    $nav = @'
<header class="header scrolled"><div class="nav-container"><a href="index.html" class="logo"><img src="logo.png" alt="Blue Waves Tours" class="brand-logo"></a><nav class="nav-links"><a href="index.html">Home</a><a href="sri-lanka-taxi-service.html">Taxi Service</a><a href="airport-transfer-sri-lanka.html">Airport Transfer</a><a href="private-driver-sri-lanka.html">Private Driver</a><a href="blog/index.html">Blog</a><a href="index.html#contact">Contact</a></nav><div class="header-actions"><a href="index.html#book-taxi" class="btn btn-primary sticky-book-btn">Book Now</a></div></div></header>
'@
    $footer = @'
<footer id="contact" class="footer-modern"><div class="footer-main"><div class="footer-brand"><div class="footer-logo"><img src="logo.png" alt="Blue Waves Tours" style="height:100px;filter:brightness(0) invert(1);"></div><p style="max-width:280px;">Your trusted taxi and travel partner across Sri Lanka.</p><div class="footer-socials"><a href="https://www.facebook.com/share/1CCptfN8FA/" target="_blank"><i class="fab fa-facebook-f"></i></a><a href="https://wa.me/94758088087" target="_blank"><i class="fab fa-whatsapp"></i></a><a href="https://www.instagram.com/bluewavestoutism" target="_blank"><i class="fab fa-instagram"></i></a></div></div><div class="footer-widget"><h4>Taxi Services</h4><ul class="footer-links"><li><a href="airport-transfer-sri-lanka.html"><i class="fas fa-chevron-right"></i> Airport Taxi</a></li><li><a href="colombo-taxi-service.html"><i class="fas fa-chevron-right"></i> Colombo Taxi</a></li><li><a href="private-driver-sri-lanka.html"><i class="fas fa-chevron-right"></i> Private Chauffeur</a></li><li><a href="private-taxi-hire-sri-lanka.html"><i class="fas fa-chevron-right"></i> Private Taxi Hire</a></li><li><a href="tour-taxi-packages-sri-lanka.html"><i class="fas fa-chevron-right"></i> Tour Taxi Packages</a></li><li><a href="blog/index.html"><i class="fas fa-chevron-right"></i> Blog</a></li></ul></div><div class="footer-widget"><h4>Contact</h4><ul class="footer-address"><li><div class="icon-wrapper"><i class="fas fa-phone-alt"></i></div><div><span>+94 75 808 8087</span></div></li><li><div class="icon-wrapper"><i class="fas fa-map-marker-alt"></i></div><div><span>24/4 Mattawa Road, Warakamura, Ukuwela</span></div></li></ul></div></div><div class="footer-bottom"><div class="footer-bottom-content"><p>Copyright 2026 Blue Waves Tours. All Rights Reserved.</p></div></div></footer>
'@

    $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$title</title>
<meta name="description" content="$desc">
<meta name="keywords" content="$keys">
<meta name="robots" content="index, follow">
<meta name="author" content="Blue Waves Tours">
<link rel="canonical" href="$canonical">
<link rel="icon" type="image/png" href="/favicon.png">
<meta property="og:type" content="website"><meta property="og:url" content="$canonical">
<meta property="og:title" content="$title"><meta property="og:description" content="$desc">
<meta property="og:image" content="https://www.bluewaves.lk/Main_pic.png">
<meta property="og:site_name" content="Blue Waves Tours">
<meta name="twitter:card" content="summary_large_image"><meta name="twitter:title" content="$title"><meta name="twitter:description" content="$desc"><meta name="twitter:image" content="https://www.bluewaves.lk/Main_pic.png">
<script type="application/ld+json">{"@context":"https://schema.org","@type":"TaxiService","name":"Blue Waves Tours - $h1","url":"$canonical","telephone":"+94758088087","areaServed":"Sri Lanka","provider":{"@type":"TravelAgency","name":"Blue Waves Tours","url":"https://www.bluewaves.lk"}}</script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,600;0,700&display=swap" rel="stylesheet">
<style>.page-hero{padding:9rem 0 5rem;background:linear-gradient(135deg,#0b2e59,#1565c0);color:#fff;text-align:center;}.card-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:1.5rem;margin:2rem 0;}.card-box{background:#fff;border-radius:14px;padding:2rem;box-shadow:0 4px 20px rgba(0,0,0,0.08);border-top:4px solid #0ea5e9;}.card-box h3{color:#0b2e59;margin-bottom:0.7rem;}.card-box p{color:#555;font-size:0.93rem;line-height:1.7;}.faq-item{background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;margin-bottom:1rem;}.faq-btn{width:100%;text-align:left;padding:1.2rem 1.5rem;background:none;border:none;font-size:1rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;font-family:inherit;}.faq-panel{max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.5rem;}.faq-panel p{color:#444;line-height:1.8;padding-bottom:1.2rem;font-size:0.93rem;}.cta-strip{background:#0b2e59;color:#fff;padding:3rem;text-align:center;border-radius:16px;margin:3rem 0;}.cta-strip h2{color:#f0c040;margin-bottom:1rem;}.cta-strip a{display:inline-block;background:#f0c040;color:#0b2e59;padding:0.9rem 2.2rem;border-radius:30px;font-weight:700;text-decoration:none;margin:0.4rem;}</style>
</head>
<body>
$nav
<section class="page-hero"><div class="container"><h1 style="font-size:2.6rem;font-family:'Playfair Display',serif;margin-bottom:1rem;">$h1</h1><p style="font-size:1.1rem;opacity:0.85;max-width:650px;margin:0 auto 2rem;">$sub</p><a href="index.html#book-taxi" style="display:inline-block;background:#f0c040;color:#0b2e59;padding:0.9rem 2.2rem;border-radius:30px;font-weight:700;text-decoration:none;margin:0.4rem;">Book Now</a><a href="https://wa.me/94758088087" target="_blank" style="display:inline-block;border:2px solid #fff;color:#fff;padding:0.9rem 2.2rem;border-radius:30px;font-weight:600;text-decoration:none;margin:0.4rem;"><i class="fab fa-whatsapp"></i> WhatsApp</a></div></section>
$sections
$footer
<a href="https://wa.me/94758088087" target="_blank" class="whatsapp-float"><i class="fab fa-whatsapp"></i></a>
<script src="script.js"></script>
<script>function toggleFaq(b){var p=b.nextElementSibling,i=b.querySelector('span');if(p.style.maxHeight&&p.style.maxHeight!=='0px'){p.style.maxHeight='0';i.style.transform='rotate(0deg)';}else{document.querySelectorAll('.faq-panel').forEach(function(x){x.style.maxHeight='0';});document.querySelectorAll('.faq-btn span').forEach(function(x){x.style.transform='rotate(0deg)';});p.style.maxHeight=p.scrollHeight+'px';i.style.transform='rotate(45deg)';}}</script>
</body></html>
"@
    [System.IO.File]::WriteAllText($file, $html, [System.Text.Encoding]::UTF8)
    Write-Host "SUCCESS: $file"
}

# ── PAGE 1: Colombo Taxi Service ──
$s1 = @'
<section class="section" style="background:#f7f9fc;"><div class="container">
<h2 class="section-title" style="text-align:center;color:#0b2e59;margin-bottom:0.8rem;">Colombo Taxi Services</h2>
<p style="text-align:center;color:#718096;max-width:650px;margin:0 auto 2.5rem;">Reliable, affordable taxi service in Colombo for hotel transfers, city sightseeing, airport pickups, and intercity travel across Sri Lanka.</p>
<div class="card-grid">
<div class="card-box"><h3>Colombo Airport Taxi</h3><p>Pre-book your taxi from Bandaranaike International Airport (CMB) to any Colombo hotel. Meet-and-greet service, flight tracking, fixed rates. Available 24/7.</p></div>
<div class="card-box"><h3>Colombo City Transfers</h3><p>Point-to-point taxi within Colombo. Hotels, shopping malls, business meetings, restaurants, and the Colombo port. Professional, punctual, and affordable.</p></div>
<div class="card-box"><h3>Colombo Sightseeing Taxi</h3><p>Full-day taxi hire for Colombo sightseeing. Visit Gangaramaya Temple, Galle Face Green, Pettah Market, Independence Hall, and the National Museum with a knowledgeable driver.</p></div>
<div class="card-box"><h3>Colombo to Island-Wide</h3><p>Intercity taxi from Colombo to Kandy, Galle, Ella, Sigiriya, Mirissa, and beyond. Fixed rates per vehicle, all tolls and fuel included. Book online or via WhatsApp.</p></div>
</div>
</div></section>
<section class="section" style="background:#fff;"><div class="container" style="max-width:820px;">
<h2 class="section-title" style="text-align:center;color:#0b2e59;margin-bottom:2rem;">Colombo Taxi FAQ</h2>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">How much is a taxi from Colombo airport to the city? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>A taxi from Bandaranaike International Airport (CMB) to central Colombo takes approximately 45 minutes. Our fixed-rate Colombo airport taxi is priced per vehicle, making it very economical for families and groups. Contact us via WhatsApp at +94 75 808 8087 for your exact quote.</p></div></div>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">Can I book a taxi from Colombo to Kandy or Galle? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>Yes. We offer intercity taxi transfers from Colombo to all major Sri Lanka destinations. Colombo to Kandy takes about 3 hours, Colombo to Galle about 2 hours via the Southern Expressway. All rates are fixed per vehicle with no hidden charges.</p></div></div>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">Is your Colombo taxi service available at night? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>Yes. Our Colombo taxi operates 24 hours a day, 7 days a week. Early-morning airport pickups, late-night transfers, and any-hour hotel pickups are all available. We track your flight and adjust for any delays at no extra cost.</p></div></div>
</div></section>
<div class="container" style="max-width:820px;"><div class="cta-strip"><h2>Book a Colombo Taxi Now</h2><p style="color:rgba(255,255,255,0.85);margin-bottom:1rem;">Fixed rates, professional drivers, 24/7 availability across Colombo and Sri Lanka.</p><a href="index.html#book-taxi">Book Online</a><a href="https://wa.me/94758088087" target="_blank" style="background:transparent;color:#fff;border:2px solid #fff;"><i class="fab fa-whatsapp"></i> WhatsApp</a></div></div>
<section class="section" style="background:#f7f9fc;"><div class="container" style="max-width:820px;"><h3 style="color:#0b2e59;margin-bottom:1rem;">Related Services</h3><p><a href="airport-transfer-sri-lanka.html" style="color:#0ea5e9;">Airport Transfers Sri Lanka</a> | <a href="private-driver-sri-lanka.html" style="color:#0ea5e9;">Private Driver Sri Lanka</a> | <a href="sri-lanka-taxi-service.html" style="color:#0ea5e9;">Sri Lanka Taxi Service</a> | <a href="tour-taxi-packages-sri-lanka.html" style="color:#0ea5e9;">Tour Taxi Packages</a></p></div></section>
'@

Make-Page "colombo-taxi-service.html" `
    "Colombo Taxi Service | Airport Taxi Colombo | Blue Waves Tours" `
    "Book a reliable taxi in Colombo with Blue Waves Tours. Airport taxi, city transfers, intercity travel and Colombo sightseeing. Fixed rates, 24/7 availability, professional drivers." `
    "Colombo taxi service, airport taxi Colombo, Colombo airport taxi booking, reliable taxi Colombo, Colombo city taxi, taxi Colombo to Kandy" `
    "https://www.bluewaves.lk/colombo-taxi-service.html" `
    "Colombo Taxi Service" `
    "Reliable taxi in Colombo for airport pickups, hotel transfers, city sightseeing, and intercity travel. Fixed rates, professional drivers, 24/7 service." `
    $s1

# ── PAGE 2: Private Taxi Hire ──
$s2 = @'
<section class="section" style="background:#f7f9fc;"><div class="container">
<h2 class="section-title" style="text-align:center;color:#0b2e59;margin-bottom:0.8rem;">Private Taxi Hire Options</h2>
<p style="text-align:center;color:#718096;max-width:650px;margin:0 auto 2.5rem;">Choose from our range of private taxi hire options designed for every group size, budget, and travel style across Sri Lanka.</p>
<div class="card-grid">
<div class="card-box"><h3>Half-Day Private Taxi</h3><p>4-5 hour private taxi hire for morning or afternoon sightseeing from your hotel. Ideal for day visits to local attractions without booking a full-day vehicle.</p></div>
<div class="card-box"><h3>Full-Day Private Taxi</h3><p>8-10 hour full-day taxi hire covering multiple destinations in one day. Cultural Triangle, southern coast, or hill country day trips. Most popular option.</p></div>
<div class="card-box"><h3>Multi-Day Private Taxi</h3><p>Book a private taxi with driver for 2 to 14 days. Your dedicated driver stays with you throughout your Sri Lanka journey, covering any destinations you choose.</p></div>
<div class="card-box"><h3>Taxi with Minivan</h3><p>Mini van hire in Sri Lanka for families and groups of 5-9 passengers. Spacious, air-conditioned, and equipped with luggage space for comfortable island-wide travel.</p></div>
</div>
</div></section>
<section class="section" style="background:#fff;"><div class="container" style="max-width:820px;">
<h2 class="section-title" style="text-align:center;color:#0b2e59;margin-bottom:2rem;">Private Taxi Hire FAQ</h2>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">What is the difference between private taxi hire and a regular taxi? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>A private taxi hire means you have the vehicle and driver exclusively for your group for the agreed duration. Unlike shared taxis or tuk-tuks, no other passengers share your vehicle. You get a dedicated, licensed chauffeur who is available for your entire trip, offering full flexibility and privacy.</p></div></div>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">Can I hire a minivan taxi in Sri Lanka? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>Yes. We offer minivan hire in Sri Lanka for groups of 5-9 passengers. Our minivans are fully air-conditioned, regularly maintained, and spacious enough for luggage. Ideal for family holidays, group tours, and corporate travel across the island.</p></div></div>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">How do I pre-book a private taxi in Sri Lanka? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>Pre-booking is simple. Fill in the booking form at bluewaves.lk or WhatsApp us at +94 75 808 8087 with your dates, pickup location, destination(s), and number of passengers. We confirm your booking and assign your dedicated driver within minutes.</p></div></div>
</div></section>
<div class="container" style="max-width:820px;"><div class="cta-strip"><h2>Hire a Private Taxi in Sri Lanka</h2><p style="color:rgba(255,255,255,0.85);margin-bottom:1rem;">Fixed rates, flexible itineraries, professional drivers. Book online or WhatsApp us now.</p><a href="index.html#book-taxi">Book Private Taxi</a><a href="https://wa.me/94758088087" target="_blank" style="background:transparent;color:#fff;border:2px solid #fff;"><i class="fab fa-whatsapp"></i> WhatsApp</a></div></div>
<section class="section" style="background:#f7f9fc;"><div class="container" style="max-width:820px;"><h3 style="color:#0b2e59;margin-bottom:1rem;">Related Services</h3><p><a href="private-driver-sri-lanka.html" style="color:#0ea5e9;">Private Driver Sri Lanka</a> | <a href="airport-transfer-sri-lanka.html" style="color:#0ea5e9;">Airport Transfers</a> | <a href="sri-lanka-taxi-service.html" style="color:#0ea5e9;">Taxi Service Sri Lanka</a> | <a href="tour-taxi-packages-sri-lanka.html" style="color:#0ea5e9;">Tour Taxi Packages</a></p></div></section>
'@

Make-Page "private-taxi-hire-sri-lanka.html" `
    "Private Taxi Hire Sri Lanka | Minivan Hire | Car Rental with Driver | Blue Waves Tours" `
    "Hire a private taxi in Sri Lanka with Blue Waves Tours. Half-day, full-day, and multi-day private taxi hire. Minivan hire for groups, car rental with driver, island-wide coverage." `
    "private taxi hire Sri Lanka, minivan hire Sri Lanka, car rental with driver Sri Lanka, taxi with driver Sri Lanka, hire taxi Sri Lanka, private car hire Sri Lanka" `
    "https://www.bluewaves.lk/private-taxi-hire-sri-lanka.html" `
    "Private Taxi Hire Sri Lanka" `
    "Half-day, full-day, and multi-day private taxi hire across Sri Lanka. Minivans for groups, luxury cars for couples. Fixed rates, dedicated drivers, full flexibility." `
    $s2

# ── PAGE 3: Tour Taxi Packages ──
$s3 = @'
<section class="section" style="background:#f7f9fc;"><div class="container">
<h2 class="section-title" style="text-align:center;color:#0b2e59;margin-bottom:0.8rem;">Taxi Tour Packages Sri Lanka</h2>
<p style="text-align:center;color:#718096;max-width:650px;margin:0 auto 2.5rem;">Hire a taxi for sightseeing and day tours across Sri Lanka. Our taxi tour packages combine transport and guided local knowledge for the perfect holiday experience.</p>
<div class="card-grid">
<div class="card-box"><h3>Cultural Triangle Taxi Tour</h3><p>Taxi tour to Sigiriya Rock Fortress, Dambulla Cave Temple, and Polonnaruwa. One of Sri Lanka's most popular day tours by private taxi from Colombo or Kandy.</p><a href="sigiriya-tour.html" style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Book Sigiriya Taxi Tour &rarr;</a></div>
<div class="card-box"><h3>Hill Country Taxi Tour</h3><p>Taxi for hill country tours through Kandy, Nuwara Eliya, and Ella. Tea plantation drives, Nine Arches Bridge, Little Adam's Peak — all by private taxi at your own pace.</p><a href="ella-tour.html" style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Book Ella Taxi Tour &rarr;</a></div>
<div class="card-box"><h3>Beach Tour Taxi</h3><p>Taxi for southern beach tours. Galle Fort, Unawatuna, Mirissa, and Tangalle. Day trip or overnight — your taxi is ready for Sri Lanka's stunning coastline.</p><a href="mirissa-tour.html" style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Book Beach Taxi Tour &rarr;</a></div>
<div class="card-box"><h3>Safari Taxi Tour</h3><p>Hire a taxi to Yala National Park for leopard safaris, or to Udawalawe for elephants. Our drivers know the best routes and timing for optimal wildlife sightings.</p><a href="yala-tour.html" style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Book Safari Taxi Tour &rarr;</a></div>
<div class="card-box"><h3>Colombo City Taxi Tour</h3><p>Full-day taxi sightseeing in Colombo. Gangaramaya Temple, Independence Hall, Pettah Market, Galle Face Green. Perfect for first-day arrivals and stopovers.</p><a href="colombo-city-tour.html" style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Book Colombo Taxi Tour &rarr;</a></div>
<div class="card-box"><h3>Custom Taxi Travel</h3><p>Design your own Sri Lanka taxi tour. Tell us your interests, dates, and group size. We create a personalised itinerary with a dedicated private taxi and driver.</p><a href="index.html#book-taxi" style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Plan Custom Taxi Tour &rarr;</a></div>
</div>
</div></section>
<section class="section" style="background:#fff;"><div class="container" style="max-width:820px;">
<h2 class="section-title" style="text-align:center;color:#0b2e59;margin-bottom:2rem;">Tour Taxi FAQ</h2>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">Can I hire a taxi for sightseeing in Sri Lanka? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>Yes. Hiring a taxi for sightseeing is the most popular way to explore Sri Lanka. Our tourist taxi service gives you a dedicated driver who knows every destination, can suggest the best spots, and adjusts your itinerary on the go. Book a half-day or full-day taxi tour for any Sri Lanka destination.</p></div></div>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">What destinations can I visit on a day tour by taxi? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>Our taxi day tours cover Sigiriya, Dambulla, Polonnaruwa, Kandy, Ella, Nine Arches Bridge, Galle Fort, Mirissa beaches, Yala National Park, Udawalawe, Colombo city, and many more. If it is in Sri Lanka, we can take you there by private taxi.</p></div></div>
<div class="faq-item"><button class="faq-btn" onclick="toggleFaq(this)">Is a taxi tour cheaper than a group tour in Sri Lanka? <span style="font-size:1.3rem;transition:transform 0.3s;">+</span></button><div class="faq-panel"><p>For families and groups, a private taxi tour is often more affordable per person than a group tour, and significantly more flexible. You travel on your own schedule, stop wherever you like, and spend as long as you want at each attraction. For solo travellers, our rates are also competitive.</p></div></div>
</div></section>
<div class="container" style="max-width:820px;"><div class="cta-strip"><h2>Book a Taxi Tour Package</h2><p style="color:rgba(255,255,255,0.85);margin-bottom:1rem;">Custom taxi tours across Sri Lanka. Fixed rates, expert drivers, zero hassle.</p><a href="index.html#book-taxi">Book Your Taxi Tour</a><a href="https://wa.me/94758088087" target="_blank" style="background:transparent;color:#fff;border:2px solid #fff;"><i class="fab fa-whatsapp"></i> WhatsApp</a></div></div>
<section class="section" style="background:#f7f9fc;"><div class="container" style="max-width:820px;"><h3 style="color:#0b2e59;margin-bottom:1rem;">Related Services</h3><p><a href="sri-lanka-taxi-service.html" style="color:#0ea5e9;">Sri Lanka Taxi Service</a> | <a href="private-driver-sri-lanka.html" style="color:#0ea5e9;">Private Driver Sri Lanka</a> | <a href="airport-transfer-sri-lanka.html" style="color:#0ea5e9;">Airport Transfers</a> | <a href="index.html#destinations" style="color:#0ea5e9;">All Tour Destinations</a></p></div></section>
'@

Make-Page "tour-taxi-packages-sri-lanka.html" `
    "Taxi Tour Packages Sri Lanka | Day Tours by Taxi | Blue Waves Tours" `
    "Book taxi tour packages in Sri Lanka with Blue Waves Tours. Hire a taxi for sightseeing, day tours, cultural triangle, beach tours, safari and hill country by private taxi." `
    "taxi tour packages Sri Lanka, day tour by taxi Sri Lanka, hire taxi for sightseeing Sri Lanka, tourist taxi tour, taxi for cultural tour Sri Lanka, custom taxi travel Sri Lanka" `
    "https://www.bluewaves.lk/tour-taxi-packages-sri-lanka.html" `
    "Taxi Tour Packages Sri Lanka" `
    "Hire a taxi for sightseeing and day tours across Sri Lanka. Cultural Triangle, hill country, beach tours, safari, and Colombo city tours by private taxi. Fixed rates, expert drivers." `
    $s3
