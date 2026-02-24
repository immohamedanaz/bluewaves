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

    // Generic Taxi Form Submission for all pages
    const allTaxiForms = document.querySelectorAll('.taxi-form');

    allTaxiForms.forEach(form => {
        if (form.id === 'explore-tours-form') return; // Handled separately

        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const submitBtn = form.querySelector('button[type="submit"]');
            const originalText = submitBtn ? submitBtn.innerText : 'Book Now';
            if (submitBtn) {
                submitBtn.innerText = 'Sending...';
                submitBtn.disabled = true;
            }

            const formData = new FormData(form);
            formData.append('_captcha', 'false');
            const actionUrl = form.action.includes('/ajax/') ? form.action : form.action.replace('formsubmit.co/', 'formsubmit.co/ajax/');

            fetch(actionUrl, {
                method: form.method,
                body: formData,
                headers: { 'Accept': 'application/json' }
            }).then(response => {
                form.style.display = 'none';

                let confirmationMsg = document.getElementById('booking-confirmation');

                // If it's a specific form without an ID (like tour pages), create a message dynamically
                if (form.id !== 'taxi-form') {
                    confirmationMsg = document.createElement('div');
                    confirmationMsg.className = 'wave-success';
                    confirmationMsg.innerHTML = '<i class="fas fa-check-circle" style="color: #0eccaa;"></i> Thanks! Your booking request has been submitted. We will contact you soon.';
                    confirmationMsg.style.marginTop = '1rem';
                    confirmationMsg.style.padding = '1rem';
                    confirmationMsg.style.background = 'rgba(14, 204, 170, 0.1)';
                    confirmationMsg.style.color = '#0eccaa';
                    confirmationMsg.style.borderRadius = '8px';
                    confirmationMsg.style.textAlign = 'center';
                    form.parentNode.appendChild(confirmationMsg);
                }

                if (confirmationMsg) {
                    confirmationMsg.classList.remove('hidden');
                    confirmationMsg.style.display = 'block';
                }
            }).catch(error => {
                console.error("Error submitting request.", error);
                if (submitBtn) {
                    submitBtn.innerText = originalText;
                    submitBtn.disabled = false;
                }
                alert("There was an error submitting your try. Please try again later.");
            });
        });
    });



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

    const formData = new FormData(form);
    formData.append('_captcha', 'false');
    const actionUrl = form.action.includes('/ajax/') ? form.action : form.action.replace('formsubmit.co/', 'formsubmit.co/ajax/');

    fetch(actionUrl, {
        method: form.method,
        body: formData,
        headers: { 'Accept': 'application/json' }
    }).then(response => {
        console.log("Tour request submitted.");
    }).catch(error => {
        console.error("Error submitting tour request.", error);
    });
}

function openImageModal(imgSrc) {
    const modal = document.getElementById('imageModal');
    const fullImg = document.getElementById('fullImage');
    if (modal && fullImg) {
        fullImg.src = imgSrc;
        modal.classList.remove('hidden');
    }
}

function closeImageModal() {
    const modal = document.getElementById('imageModal');
    if (modal) {
        modal.classList.add('hidden');
    }
}

document.addEventListener('DOMContentLoaded', () => {
    // Attach click listeners to all gallery cards
    const galleryCards = document.querySelectorAll('.gallery-card');
    galleryCards.forEach(card => {
        card.style.cursor = 'pointer';
        card.addEventListener('click', function (e) {
            const img = this.querySelector('img');
            if (img && img.src) {
                openImageModal(img.src);
            }
        });
    });
});
