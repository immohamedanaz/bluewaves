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
        // FormSubmit handles the submission logic on its own server.
        // Allowing the native HTML submittion allows the user to click the activation email.
    }

    // Vehicle max passengers validation
    const vehicleSelect = document.getElementById('vehicle');
    const passengersInput = document.getElementById('passengers');

    if (vehicleSelect && passengersInput) {
        vehicleSelect.addEventListener('change', function () {
            let maxPax = 15;
            switch (this.value) {
                case 'Car':
                    maxPax = 3;
                    break;
                case 'Van':
                    maxPax = 9;
                    break;
                case 'Luxury':
                    maxPax = 3;
                    break;
                case 'Tuk Tuk':
                    maxPax = 2;
                    break;
            }
            passengersInput.max = maxPax;
            passengersInput.placeholder = 'Max ' + maxPax + ' pax';
            // Automatically lower the value if it exceeds the new max
            if (parseInt(passengersInput.value) > maxPax) {
                passengersInput.value = maxPax;
            }
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
    // Wave Ripple Effect
    const waveBtns = document.querySelectorAll('.btn, .wave-btn');
    waveBtns.forEach(btn => {
        btn.addEventListener('click', function (e) {
            let ripple = document.createElement('span');
            ripple.classList.add('ripple');
            this.appendChild(ripple);

            let x = e.clientX - e.target.getBoundingClientRect().left;
            let y = e.clientY - e.target.getBoundingClientRect().top;

            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;

            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
});

// Global Modal Functions
function openTourModal(e) {
    if (e) e.preventDefault();
    document.getElementById('tourModal').classList.remove('hidden');
}

function closeTourModal() {
    document.getElementById('tourModal').classList.add('hidden');
    // reset form inside if needed
    const form = document.getElementById('explore-tours-form');
    if (form) form.reset();
    const successMsg = document.getElementById('tour-modal-success');
    if (successMsg) successMsg.classList.add('hidden');
    if (form) form.style.display = 'block';
}

function submitTourModal(e) {
    // FormSubmit takes over native form submission unless we stop it, 
    // but the user wanted a custom wave message.
    e.preventDefault();

    const form = e.target;
    // Hide form, show wave success text
    form.style.display = 'none';
    const successMsg = document.getElementById('tour-modal-success');
    if (successMsg) successMsg.classList.remove('hidden');

    // We can also submit the data in the background if needed
    fetch(form.action, {
        method: form.method,
        body: new FormData(form),
        headers: { 'Accept': 'application/json' }
    }).then(response => {
        console.log("Tour request submitted.");
    }).catch(error => {
        console.error("Error submitting tour request.", error);
    });
}
