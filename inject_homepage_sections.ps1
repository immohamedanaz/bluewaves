$file = "index.html"
$content = Get-Content -Path $file -Raw -Encoding UTF8

# ── 1. Services Section + Why Choose Us + FAQ injected BEFORE testimonials ──
$servicesBlock = @'

    <!-- ═══ Services Section ═══ -->
    <section id="services" class="section" style="background: linear-gradient(135deg,#f0f9ff 0%,#fdfaf7 100%); padding:5rem 0;">
        <div class="container">
            <div class="section-header text-center reveal fade-bottom" style="margin-bottom:3.5rem;">
                <h2 class="section-title" style="color:#0b2e59;font-size:2.4rem;">Our Travel Services in Sri Lanka</h2>
                <p style="color:#4a5568;font-size:1.1rem;max-width:680px;margin:0 auto;">From airport pickups to multi-day custom tours — Blue Waves Tours is your trusted travel agency in Sri Lanka for every journey.</p>
            </div>
            <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:2rem;">
                <!-- Service 1 -->
                <a href="airport-transfer-sri-lanka.html" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-1" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #0ea5e9;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">✈️</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Airport Transfer Service</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">24/7 airport pickup &amp; drop-off from Bandaranaike International Airport (CMB). Fixed-rate, luxury airport transfers to any Sri Lanka destination. No hidden costs.</p>
                        <span style="color:#0ea5e9;font-weight:600;font-size:0.9rem;">Book Transfer →</span>
                    </div>
                </a>
                <!-- Service 2 -->
                <a href="private-driver-sri-lanka.html" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-2" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #d4a017;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">🚗</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Private Chauffeur Service</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">Hire a professional private driver in Sri Lanka for flexible, island-wide chauffeur tours. Car rental with driver — luxury cars, minivans &amp; group transport available.</p>
                        <span style="color:#d4a017;font-weight:600;font-size:0.9rem;">Hire a Driver →</span>
                    </div>
                </a>
                <!-- Service 3 -->
                <a href="#destinations" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-3" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #10b981;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">🗺️</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Sri Lanka Tour Packages</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">Custom Sri Lanka tours covering the Cultural Triangle, hill country, southern coast &amp; wildlife parks. Day tours, guided tours &amp; multi-day holiday packages.</p>
                        <span style="color:#10b981;font-weight:600;font-size:0.9rem;">See Packages →</span>
                    </div>
                </a>
                <!-- Service 4 -->
                <a href="yala-tour.html" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-1" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #f59e0b;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">🦁</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Wildlife Safari Sri Lanka</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">Thrilling wildlife safari tours to Yala National Park, Udawalawe &amp; Minneriya. Spot leopards, elephants &amp; exotic birds on guided jeep safaris with expert drivers.</p>
                        <span style="color:#f59e0b;font-weight:600;font-size:0.9rem;">Book Safari →</span>
                    </div>
                </a>
                <!-- Service 5 -->
                <a href="mirissa-tour.html" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-2" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #3b82f6;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">🏖️</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Beach Holiday Sri Lanka</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">Beach holiday packages to Mirissa, Galle, Unawatuna &amp; Trincomalee. Enjoy whale watching, surfing, snorkeling &amp; relaxing on Sri Lanka's most beautiful beaches.</p>
                        <span style="color:#3b82f6;font-weight:600;font-size:0.9rem;">Explore Beaches →</span>
                    </div>
                </a>
                <!-- Service 6 -->
                <a href="kandy-tour.html" style="text-decoration:none;">
                    <div class="card reveal fade-bottom delay-3" style="padding:2rem;text-align:center;transition:transform 0.3s;border-top:4px solid #8b5cf6;" onmouseover="this.style.transform='translateY(-6px)'" onmouseout="this.style.transform='translateY(0)'">
                        <div style="font-size:2.5rem;margin-bottom:1rem;">🏛️</div>
                        <h3 style="color:#0b2e59;margin-bottom:0.8rem;font-size:1.2rem;">Cultural &amp; Heritage Tours</h3>
                        <p style="color:#555;line-height:1.7;font-size:0.95rem;">Heritage tours through the Cultural Triangle — Sigiriya, Kandy, Dambulla &amp; Polonnaruwa. Experience Sri Lanka's 2,500-year history with expert local chauffeur-guides.</p>
                        <span style="color:#8b5cf6;font-weight:600;font-size:0.9rem;">Discover Culture →</span>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- ═══ Why Choose Blue Waves Tours (E-E-A-T) ═══ -->
    <section id="why-choose-us" class="section" style="background:#0b2e59;color:#fff;padding:5rem 0;">
        <div class="container">
            <div class="section-header text-center reveal fade-bottom" style="margin-bottom:3.5rem;">
                <h2 class="section-title" style="color:#fff;font-size:2.4rem;">Why Blue Waves is the Best Travel Agency in Sri Lanka</h2>
                <p style="color:rgba(255,255,255,0.75);font-size:1.05rem;max-width:700px;margin:0 auto;">Trusted by 5,750+ tourists from across the world. Here is why travellers consistently choose us as their reliable transport and tour partner in Sri Lanka.</p>
            </div>
            <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:2rem;">
                <div class="reveal fade-bottom delay-1" style="background:rgba(255,255,255,0.08);border-radius:16px;padding:2rem;border:1px solid rgba(255,255,255,0.15);">
                    <div style="font-size:2rem;margin-bottom:1rem;">🏆</div>
                    <h3 style="color:#f0c040;margin-bottom:0.7rem;">5,750+ Happy Tourists</h3>
                    <p style="color:rgba(255,255,255,0.8);line-height:1.7;font-size:0.95rem;">Years of experience serving international travellers from Europe, Asia &amp; the Middle East. Hundreds of 5-star Google reviews confirm our trusted reputation.</p>
                </div>
                <div class="reveal fade-bottom delay-2" style="background:rgba(255,255,255,0.08);border-radius:16px;padding:2rem;border:1px solid rgba(255,255,255,0.15);">
                    <div style="font-size:2rem;margin-bottom:1rem;">🛡️</div>
                    <h3 style="color:#f0c040;margin-bottom:0.7rem;">Licensed &amp; Professional</h3>
                    <p style="color:rgba(255,255,255,0.8);line-height:1.7;font-size:0.95rem;">All our drivers are licensed tourist chauffeurs — English-speaking, experienced in Sri Lankan roads, and trained in first aid &amp; defensive driving for your safety.</p>
                </div>
                <div class="reveal fade-bottom delay-3" style="background:rgba(255,255,255,0.08);border-radius:16px;padding:2rem;border:1px solid rgba(255,255,255,0.15);">
                    <div style="font-size:2rem;margin-bottom:1rem;">💰</div>
                    <h3 style="color:#f0c040;margin-bottom:0.7rem;">Transparent Pricing</h3>
                    <p style="color:rgba(255,255,255,0.8);line-height:1.7;font-size:0.95rem;">Fixed rates with no hidden fees. What you see is what you pay — all tolls, parking &amp; fuel included. Affordable Sri Lanka tours &amp; transfers for every budget.</p>
                </div>
                <div class="reveal fade-bottom delay-1" style="background:rgba(255,255,255,0.08);border-radius:16px;padding:2rem;border:1px solid rgba(255,255,255,0.15);">
                    <div style="font-size:2rem;margin-bottom:1rem;">📍</div>
                    <h3 style="color:#f0c040;margin-bottom:0.7rem;">Island-Wide Coverage</h3>
                    <p style="color:rgba(255,255,255,0.8);line-height:1.7;font-size:0.95rem;">We cover 85+ destinations across Sri Lanka — Colombo, Kandy, Ella, Sigiriya, Galle, Mirissa, Yala, Trincomalee &amp; beyond. One trusted agency for the whole island.</p>
                </div>
                <div class="reveal fade-bottom delay-2" style="background:rgba(255,255,255,0.08);border-radius:16px;padding:2rem;border:1px solid rgba(255,255,255,0.15);">
                    <div style="font-size:2rem;margin-bottom:1rem;">⏰</div>
                    <h3 style="color:#f0c040;margin-bottom:0.7rem;">24/7 Airport Pickup</h3>
                    <p style="color:rgba(255,255,255,0.8);line-height:1.7;font-size:0.95rem;">Flights land at all hours. Our airport pickup service operates 24 hours a day, 7 days a week. We track your flight and wait — no matter when you arrive.</p>
                </div>
                <div class="reveal fade-bottom delay-3" style="background:rgba(255,255,255,0.08);border-radius:16px;padding:2rem;border:1px solid rgba(255,255,255,0.15);">
                    <div style="font-size:2rem;margin-bottom:1rem;">🎯</div>
                    <h3 style="color:#f0c040;margin-bottom:0.7rem;">Fully Customized Tours</h3>
                    <p style="color:rgba(255,255,255,0.8);line-height:1.7;font-size:0.95rem;">Every tour is tailored to you. Honeymoon packages, family holiday packages, solo adventures, group transport &amp; eco-tourism — we plan it all around your needs.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ═══ FAQ Section (AI & Voice Search Optimized) ═══ -->
    <section id="faq" class="section" style="background:#fdfaf7;padding:5rem 0;">
        <div class="container" style="max-width:860px;">
            <div class="section-header text-center reveal fade-bottom" style="margin-bottom:3.5rem;">
                <h2 class="section-title" style="color:#0b2e59;font-size:2.4rem;">Frequently Asked Questions</h2>
                <p style="color:#4a5568;font-size:1.05rem;">Everything you need to know about booking tours, airport transfers &amp; private drivers in Sri Lanka with Blue Waves Tours.</p>
            </div>
            <div id="faq-list" style="display:flex;flex-direction:column;gap:1rem;">
                <!-- FAQ Item -->
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        What is the best travel agency in Sri Lanka? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">Blue Waves Tours is one of Sri Lanka's most trusted travel agencies, with over 5,750 happy tourists served. We specialise in airport transfers, private chauffeur services, custom tour packages, wildlife safaris, beach holidays, and cultural tours. Our professional, English-speaking licensed drivers ensure a safe, comfortable, and memorable experience across Sri Lanka.</p>
                    </div>
                </div>
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        Do you offer 24/7 airport pickup in Sri Lanka? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">Yes. Our airport transfer service operates 24 hours a day, 7 days a week, including public holidays. We provide airport pickup and drop-off from Bandaranaike International Airport (CMB) in Colombo to any destination in Sri Lanka — including Kandy, Galle, Ella, Sigiriya, Mirissa, and Trincomalee — at fixed, transparent rates with no hidden charges.</p>
                    </div>
                </div>
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        What tour packages does Blue Waves Tours offer? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">We offer a wide range of Sri Lanka tour packages including: Cultural Triangle tours (Sigiriya, Kandy, Dambulla), hill country tours (Ella, Nuwara Eliya), southern coastal tours (Galle, Mirissa), wildlife safari packages (Yala, Udawalawe), beach holidays, honeymoon packages, family holiday packages, and fully customised multi-day private tours across the island.</p>
                    </div>
                </div>
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        How do I book a private driver in Sri Lanka? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">Booking a private driver with Blue Waves Tours is simple. Fill in the booking form on this page with your pickup location, date, number of passengers, and any special requests. Alternatively, contact us directly via WhatsApp at +94 75 808 8087. We will confirm your booking and assign a dedicated, English-speaking chauffeur for your trip.</p>
                    </div>
                </div>
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        What vehicles are available for hire in Sri Lanka? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">Blue Waves Tours offers a modern fleet to suit every group size: luxury cars and sedans (for solo or couple travel), minivans and SUVs (for families of 3–6), and mini-buses (for large groups of up to 15). All vehicles are fully air-conditioned, regularly serviced, and equipped for Sri Lanka's diverse terrain from coastal roads to mountain passes.</p>
                    </div>
                </div>
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        Is Blue Waves Tours a reliable and trusted company? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">Absolutely. Blue Waves Tours has built its reputation on reliability, transparency, and genuine hospitality. We have served over 5,750 international tourists and have consistently earned 5-star reviews from travellers across Europe, Asia, and the Middle East. All our drivers are licensed, experienced, and committed to your safety and comfort throughout your Sri Lanka journey.</p>
                    </div>
                </div>
                <div style="background:#fff;border-radius:12px;box-shadow:0 2px 12px rgba(0,0,0,0.07);overflow:hidden;">
                    <button onclick="toggleFaq(this)" style="width:100%;text-align:left;padding:1.4rem 1.8rem;background:none;border:none;font-size:1.05rem;font-weight:600;color:#0b2e59;cursor:pointer;display:flex;justify-content:space-between;align-items:center;">
                        Do you offer honeymoon &amp; family holiday packages in Sri Lanka? <span style="font-size:1.4rem;transition:transform 0.3s;">+</span>
                    </button>
                    <div style="max-height:0;overflow:hidden;transition:max-height 0.4s ease;padding:0 1.8rem;">
                        <p style="color:#444;line-height:1.8;padding-bottom:1.4rem;">Yes! We specialise in tailored honeymoon packages and family holiday packages across Sri Lanka. From romantic beachside drives in Mirissa and Unawatuna to family-friendly elephant safaris in Udawalawe — every itinerary is personalised to create your perfect Sri Lanka experience. Contact us on WhatsApp to start planning your dream holiday.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Schema -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the best travel agency in Sri Lanka?",
          "acceptedAnswer": { "@type": "Answer", "text": "Blue Waves Tours is one of Sri Lanka's most trusted travel agencies, with over 5,750 happy tourists served. We specialise in airport transfers, private chauffeur services, custom tour packages, wildlife safaris, beach holidays, and cultural tours across Sri Lanka." }
        },
        {
          "@type": "Question",
          "name": "Do you offer 24/7 airport pickup in Sri Lanka?",
          "acceptedAnswer": { "@type": "Answer", "text": "Yes. Our airport transfer service operates 24 hours a day, 7 days a week from Bandaranaike International Airport (CMB) to any destination in Sri Lanka at fixed, transparent rates." }
        },
        {
          "@type": "Question",
          "name": "What tour packages does Blue Waves Tours offer?",
          "acceptedAnswer": { "@type": "Answer", "text": "We offer Cultural Triangle tours, hill country tours, southern coastal tours, wildlife safari packages, beach holidays, honeymoon packages, family holiday packages, and fully customised multi-day private tours across Sri Lanka." }
        },
        {
          "@type": "Question",
          "name": "How do I book a private driver in Sri Lanka?",
          "acceptedAnswer": { "@type": "Answer", "text": "Fill in the booking form on our website or contact us via WhatsApp at +94 75 808 8087. We confirm your booking and assign a dedicated English-speaking chauffeur for your trip." }
        },
        {
          "@type": "Question",
          "name": "What vehicles are available for hire in Sri Lanka?",
          "acceptedAnswer": { "@type": "Answer", "text": "We offer luxury cars, minivans, SUVs, and mini-buses. All are fully air-conditioned, regularly serviced, and suited for Sri Lanka's diverse terrain." }
        },
        {
          "@type": "Question",
          "name": "Is Blue Waves Tours a reliable and trusted company?",
          "acceptedAnswer": { "@type": "Answer", "text": "Yes. Blue Waves Tours has served over 5,750 international tourists and consistently earns 5-star reviews. All drivers are licensed, experienced, and committed to your safety." }
        },
        {
          "@type": "Question",
          "name": "Do you offer honeymoon and family holiday packages in Sri Lanka?",
          "acceptedAnswer": { "@type": "Answer", "text": "Yes. We specialise in tailored honeymoon packages and family holiday packages across Sri Lanka, from romantic beach drives to family-friendly elephant safaris." }
        }
      ]
    }
    </script>

'@

# Inject BEFORE testimonials section
$marker = '    <!-- Testimonials Section -->'
$content = $content.Replace($marker, $servicesBlock + $marker)

# ── 2. Fix WhatsApp footer link ──
$content = $content.Replace('<a href="#"><i class="fab fa-whatsapp"></i></a>', '<a href="https://wa.me/94758088087" target="_blank" rel="noopener"><i class="fab fa-whatsapp"></i></a>')

# ── 3. Add FAQ toggleFaq JS before </body> ──
$faqJs = @'
    <script>
    function toggleFaq(btn) {
        var panel = btn.nextElementSibling;
        var icon = btn.querySelector('span');
        if (panel.style.maxHeight && panel.style.maxHeight !== '0px') {
            panel.style.maxHeight = '0';
            panel.style.padding = '0 1.8rem';
            icon.style.transform = 'rotate(0deg)';
            icon.textContent = '+';
        } else {
            document.querySelectorAll('#faq-list > div > div').forEach(function(p){ p.style.maxHeight='0'; p.style.padding='0 1.8rem'; });
            document.querySelectorAll('#faq-list button span').forEach(function(s){ s.style.transform='rotate(0deg)'; s.textContent='+'; });
            panel.style.maxHeight = panel.scrollHeight + 'px';
            panel.style.padding = '0 1.8rem';
            icon.style.transform = 'rotate(45deg)';
            icon.textContent = '+';
        }
    }
    </script>
'@
$content = $content.Replace('</body>', $faqJs + '</body>')

[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "SUCCESS: index.html updated with Services, Why Choose Us, FAQ sections"
