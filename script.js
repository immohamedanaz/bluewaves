document.addEventListener('DOMContentLoaded', () => {

    // Navbar Scroll Effect
    const header = document.querySelector('.header');

    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // Mobile Menu Toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navLinks = document.querySelector('.nav-links');

    mobileMenuBtn.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        const icon = mobileMenuBtn.querySelector('i');
        if (navLinks.classList.contains('active')) {
            icon.classList.remove('fa-bars');
            icon.classList.add('fa-times');
        } else {
            icon.classList.remove('fa-times');
            icon.classList.add('fa-bars');
        }
    });

    // Scroll Animations (Reveal Elements)
    function reveal() {
        var reveals = document.querySelectorAll('.reveal');
        for (var i = 0; i < reveals.length; i++) {
            var windowHeight = window.innerHeight;
            var elementTop = reveals[i].getBoundingClientRect().top;
            var elementVisible = 100;
            if (elementTop < windowHeight - elementVisible) {
                reveals[i].classList.add('active');
            }
        }
    }
    window.addEventListener('scroll', reveal);
    reveal(); // Trigger on load

    // Animated Counters
    const counters = document.querySelectorAll('.counter');
    const speed = 200; // lower is slower

    let counted = false;

    window.addEventListener('scroll', () => {
        const statsSection = document.querySelector('.stats-counter');
        if (!statsSection) return;

        const sectionPos = statsSection.getBoundingClientRect().top;
        const screenPos = window.innerHeight;

        if (sectionPos < screenPos && !counted) {
            counters.forEach(counter => {
                const updateCount = () => {
                    const target = +counter.getAttribute('data-target');
                    const count = +counter.innerText;
                    const inc = target / speed;

                    if (count < target) {
                        counter.innerText = Math.ceil(count + inc);
                        setTimeout(updateCount, 20);
                    } else {
                        counter.innerText = target;
                    }
                };
                updateCount();
            });
            counted = true;
        }
    });

    // Taxi Form Submission
    const taxiForm = document.getElementById('taxi-form');
    const confirmationMsg = document.getElementById('booking-confirmation');

    if (taxiForm) {
        taxiForm.addEventListener('submit', (e) => {
            e.preventDefault();

            const formData = new FormData(taxiForm);

            fetch(taxiForm.action, {
                method: "POST",
                body: formData,
                headers: {
                    'Accept': 'application/json'
                }
            }).then(response => {
                if (response.ok) {
                    confirmationMsg.classList.remove('hidden');
                    setTimeout(() => {
                        taxiForm.reset();
                        confirmationMsg.classList.add('hidden');
                    }, 5000);
                } else {
                    alert("Oops! There was a problem submitting your form");
                }
            }).catch(error => {
                alert("Error sending booking form.");
            });
        });
    }

    // Parallax effect for Hero
    window.addEventListener('scroll', () => {
        const scrolled = window.scrollY;
        const parallax = document.querySelector('.parallax');
        if (parallax) {
            parallax.style.backgroundPositionY = -(scrolled * 0.5) + 'px';
        }
    });
});
