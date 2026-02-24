// Initialize the country code selector with flags
const phoneInputField = document.querySelector("#phone");
const phoneInput = window.intlTelInput(phoneInputField, {
    initialCountry: "lk",
    preferredCountries: ["lk", "in", "mv", "gb", "us", "de", "fr", "au"],
    separateDialCode: true,
    utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
});

// Enforce 10 digits maximum input dynamically just in case
phoneInputField.addEventListener('input', function () {
    this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);
});

// intercept form submission to attach the full phone number with country code
document.querySelector("#taxi-form").addEventListener("submit", function (e) {
    // If the input doesn't have exactly 10 digits, alert
    if (phoneInputField.value.length !== 10) {
        e.preventDefault();
        alert("Please enter exactly 10 digits for the phone number.");
        return;
    }

    // Create a hidden input to submit the full number including the country code
    let hiddenInput = document.createElement("input");
    hiddenInput.type = "hidden";
    hiddenInput.name = "Full Phone Number (with Country Code)";
    hiddenInput.value = phoneInput.getNumber();
    this.appendChild(hiddenInput);
});
