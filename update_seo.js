const fs = require('fs');

const seoData = {
    'airport-transfer-sri-lanka.html': {
        title: 'Sri Lanka Airport Transfers & Taxi Service | Bluewaves',
        h1: 'Sri Lanka Airport Transfers',
        desc: 'Reliable and comfortable Colombo airport transfers to any destination in Sri Lanka. Professional private drivers and modern vehicles.',
        links: ['sigiriya-tour.html', 'private-driver-sri-lanka.html']
    },
    'private-driver-sri-lanka.html': {
        title: 'Private Driver Sri Lanka | Guided Tours | Bluewaves',
        h1: 'Private Driver in Sri Lanka',
        desc: 'Hire an experienced private driver in Sri Lanka for your holiday. Customized tours, comfortable vehicles, and local expertise.',
        links: ['airport-transfer-sri-lanka.html', 'kandy-tour.html']
    },
    'sigiriya-tour.html': {
        title: 'Sigiriya Tour | Rock Fortress & Dambulla | Bluewaves',
        h1: 'Sigiriya Day Tour',
        desc: 'Book a full-day Sigiriya tour to explore the ancient Lion Rock Fortress and Dambulla Cave Temple with our expert private drivers.',
        links: ['kandy-tour.html', 'ella-tour.html']
    },
    'kandy-tour.html': {
        title: 'Kandy City Tour | Temple of the Tooth | Bluewaves',
        h1: 'Kandy City Day Tour',
        desc: 'Discover Kandy with our customized city tour. Visit the Temple of the Tooth, Peradeniya Botanical Gardens, and more with a private driver.',
        links: ['ella-tour.html', 'sigiriya-tour.html']
    },
    'ella-tour.html': {
        title: 'Ella Tour | Nine Arches Bridge & Little Adam\'s Peak | Bluewaves',
        h1: 'Ella Sri Lanka Tour',
        desc: 'Experience the magic of Ella. Visit the Nine Arches Bridge, hike Little Adam\'s Peak, and enjoy stunning views with your private driver.',
        links: ['galle-tour.html', 'kandy-tour.html']
    },
    'galle-tour.html': {
        title: 'Galle Tour | Galle Fort & South Coast | Bluewaves',
        h1: 'Galle Day Tour',
        desc: 'Explore the historic Galle Fort and beautiful south coast beaches on our private Galle day tour. Comfortable transport provided.',
        links: ['mirissa-tour.html', 'yala-tour.html']
    },
    'colombo-city-tour.html': {
        title: 'Colombo City Tour | Best Highlights | Bluewaves',
        h1: 'Colombo City Tour',
        desc: 'Discover the vibrant city of Colombo. Visit top attractions, shopping areas, and cultural sights with a professional private driver.',
        links: ['airport-transfer-sri-lanka.html', 'galle-tour.html']
    },
    'mirissa-tour.html': {
        title: 'Mirissa Beach Tour | Whale Watching | Bluewaves',
        h1: 'Mirissa Coastal Tour',
        desc: 'Relax in Mirissa, enjoy whale watching, and explore the beautiful southern coastal beaches of Sri Lanka.',
        links: ['galle-tour.html', 'yala-tour.html']
    },
    'yala-tour.html': {
        title: 'Yala National Park Safari | Wildlife Tour | Bluewaves',
        h1: 'Yala Safari Tour',
        desc: 'Experience an unforgettable wildlife safari at Yala National Park. Spot leopards, elephants, and more with our comfortable private taxi service.',
        links: ['mirissa-tour.html', 'ella-tour.html']
    }
};

const domain = 'https://bluewaves.lk';
let sitemap = '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n';

sitemap += `  <url>\n    <loc>${domain}/</loc>\n    <priority>1.0</priority>\n  </url>\n`;

Object.keys(seoData).forEach(file => {
    sitemap += `  <url>\n    <loc>${domain}/${file}</loc>\n    <priority>0.8</priority>\n  </url>\n`;

    if (fs.existsSync(file)) {
        let content = fs.readFileSync(file, 'utf8');
        let data = seoData[file];

        // Update Title
        content = content.replace(/<title>.*?<\/title>/, `<title>${data.title}</title>`);

        // Update or Add Meta Description
        if (content.includes('name="description"')) {
            content = content.replace(/<meta name="description"[\s\S]*?>/, `<meta name="description"\n        content="${data.desc}">`);
        } else {
            content = content.replace(/<title>/, `<meta name="description" content="${data.desc}">\n    <title>`);
        }

        // Update H1 (if Sigiriya template, it's 3rem h1)
        if (content.includes('class="hero-title" style="font-size: 3rem;"')) {
            content = content.replace(/<h1 class="hero-title" style="font-size: 3rem;">.*?<\/h1>/, `<h1 class="hero-title" style="font-size: 3rem;">${data.h1}<\/h1>`);
        }

        // Add Internal Linking Block
        const linksHtml = `
            <div class="internal-links" style="max-width: 800px; margin: 2rem auto; padding: 2rem; background: #f9f9f9; border-left: 4px solid var(--color-gold); border-radius: 8px;">
                <h3 style="color: var(--color-green-dark); margin-bottom: 1rem;">Explore More Destinations</h3>
                <ul style="list-style-type: none; padding-left: 0; display: flex; gap: 1rem; flex-wrap: wrap;">
                    ${data.links.map(l => `<li><a href="${l}" style="color: var(--color-blue-btn); text-decoration: none; font-weight: 500;">&rarr; ${seoData[l].title.split('|')[0].trim()}</a></li>`).join('\n')}
                </ul>
            </div>
        `;

        if (!content.includes('internal-links')) {
            content = content.replace(/<div class="tour-booking-container shadow-lg"/, linksHtml + '\n            <div class="tour-booking-container shadow-lg"');
        }

        // Replace H2 if necessary to ensure SEO headings
        fs.writeFileSync(file, content);
    }
});

sitemap += '</urlset>';
fs.writeFileSync('sitemap.xml', sitemap);
console.log('Seo update and sitemap generation successful.');
