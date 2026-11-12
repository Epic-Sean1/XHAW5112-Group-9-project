
/*----------FEES PAGE JAVASCRIPT----------*/


/*----------GET PAGE ELEMENTS----------*/

// Get the different steps
const personalDetails = document.getElementById("personal-details");
const selectCourse = document.getElementById("select-course");
const totalQuote = document.getElementById("total-quote");

// Get the racing track checkpoints
const checkpoints = document.querySelectorAll(".track-checkpoint");


/*----------STEP NAVIGATION----------*/

// Function to move between steps
function showStep(stepNumber) {

    // Hide all steps
    document.querySelectorAll(".fee-step").forEach(step => {
        step.hidden = true;
        step.classList.remove("active");
    });

    // Display the selected step
    if (stepNumber === 1) {
        personalDetails.hidden = false;
        personalDetails.classList.add("active");
    }
    else if (stepNumber === 2) {
        selectCourse.hidden = false;
        selectCourse.classList.add("active");
    }
    else if (stepNumber === 3) {
        totalQuote.hidden = false;
        totalQuote.classList.add("active");
    }

    // Update the racing track
    checkpoints.forEach(checkpoint => {

        checkpoint.classList.remove("active");

        if (Number(checkpoint.dataset.step) <= stepNumber) {
            checkpoint.classList.add("active");
        }

    });

}


/*----------STEP 1: PERSONAL DETAILS VALIDATION----------*/

// Get the Next button
const nextStep1 = document.getElementById("next-step-1");

// Get all required fields
const requiredFields = [
    document.getElementById("full-name"),
    document.getElementById("phone"),
    document.getElementById("email"),
    document.getElementById("booking-type")
];

// Check whether validation has started
let validationStarted = false;


/*----------DISPLAY VALIDATION ERRORS----------*/

// Display an error message
function showError(field, message) {

    field.classList.add("input-error");
    field.setAttribute("aria-invalid", "true");

    let errorMessage =
        field.parentElement.querySelector(".error-message");

    if (!errorMessage) {
        errorMessage = document.createElement("small");
        errorMessage.className = "error-message";
        errorMessage.setAttribute("role", "alert");

        field.parentElement.appendChild(errorMessage);
    }

    errorMessage.textContent = message;
    errorMessage.style.color = "#ff0000";
}

// Remove an error message
function clearError(field) {

    field.classList.remove("input-error");
    field.removeAttribute("aria-invalid");

    const errorMessage =
        field.parentElement.querySelector(".error-message");

    if (errorMessage) {
        errorMessage.remove();
    }

}


/*----------VALIDATE PERSONAL DETAILS----------*/

// Validate an individual field
function validateField(field) {

    const value = field.value.trim();
    let message = "";

    // Check empty fields
    if (value === "") {
        message = "This field is required.";
    }

    // Validate full name
    else if (field.id === "full-name") {

        if (!/^[a-zA-ZÀ-ÿ\s'-]+$/.test(value)) {
            message = "Full name must contain letters only.";
        }
        else if (value.length < 2) {
            message = "Please enter your full name.";
        }

    }

    // Validate phone number
    else if (field.id === "phone") {

        if (!/^\d+$/.test(value)) {
            message = "Phone number must contain numbers only.";
        }
        else if (!/^0\d{9}$/.test(value)) {
            message = "Enter a valid 10-digit phone number starting with 0.";
        }

    }

    // Validate email address
    else if (field.id === "email") {

        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
            message = "Please enter a valid email address.";
        }

    }

    // Display or remove errors
    if (message !== "") {
        showError(field, message);
        return false;
    }
    else {
        clearError(field);
        return true;
    }

}


// Validate all required fields
function validatePersonalDetails() {

    let isValid = true;

    requiredFields.forEach(field => {

        if (!validateField(field)) {
            isValid = false;
        }

    });

    return isValid;
}


/*----------STEP 1: NEXT BUTTON----------*/

// Validate before moving to Step 2
nextStep1.addEventListener("click", function () {

    validationStarted = true;

    if (validatePersonalDetails()) {
        showStep(2);
    }

});


// Validate fields as customers correct their details
requiredFields.forEach(field => {

    field.addEventListener("input", function () {

        if (validationStarted) {
            validateField(field);
        }

    });

    field.addEventListener("change", function () {

        if (validationStarted) {
            validateField(field);
        }

    });

});


/*----------STEP 2: PACKAGE SELECTION----------*/

// Get all package and experience checkboxes
const packageOptions = document.querySelectorAll(
    'input[name="offerings"]'
);

// Get the Next button
const nextStep2 = document.getElementById("next-step-2");

// Get the package selection section
const courseSelection = document.querySelector(".course-selection-grid");


// Display an error when no option is selected
function showSelectionError() {

    let errorMessage = document.getElementById("selection-error");

    if (!errorMessage) {

        errorMessage = document.createElement("small");
        errorMessage.id = "selection-error";
        errorMessage.className = "error-message";
        errorMessage.setAttribute("role", "alert");

        courseSelection.insertAdjacentElement("afterend", errorMessage);

    }

    errorMessage.textContent =
        "Please select at least one gaming package or experience.";

    errorMessage.style.color = "#ff0000";

}


// Remove the selection error
function clearSelectionError() {

    const errorMessage = document.getElementById("selection-error");

    if (errorMessage) {
        errorMessage.remove();
    }

}


// Validate selections before moving to Step 3
nextStep2.addEventListener("click", function () {

    const selectedPackages = document.querySelectorAll(
        'input[name="offerings"]:checked'
    );

    if (selectedPackages.length === 0) {
        showSelectionError();
    }
    else {
        clearSelectionError();
        showStep(3);
    }

});


// Remove the error when an option is selected
packageOptions.forEach(option => {

    option.addEventListener("change", function () {

        const selectedPackages = document.querySelectorAll(
            'input[name="offerings"]:checked'
        );

        if (selectedPackages.length > 0) {
            clearSelectionError();
        }

    });

});


/*----------STEP 2: BACK BUTTON----------*/

// Get the Back button
const backStep2 = document.getElementById("back-step-2");

// Return to Step 1
backStep2.addEventListener("click", function () {
    showStep(1);
});


/*----------STEP 3: BACK BUTTON----------*/

// Get the Back button
const backStep3 = document.getElementById("back-step-3");

// Return to Step 2
backStep3.addEventListener("click", function () {
    showStep(2);
});


/*----------STEP 3: QUOTATION CALCULATOR----------*/

// Get the Calculate button
const calculateButton = document.getElementById("calculate");

// Get the quotation display elements
const selectedCount = document.getElementById("selected-count");
const subtotalDisplay = document.getElementById("subtotal");
const discountDisplay = document.getElementById("discount");
const afterDiscountDisplay = document.getElementById("after-discount");
const vatDisplay = document.getElementById("vat");
const totalDisplay = document.getElementById("total");


// Format amounts into South African Rand
function formatCurrency(amount) {
    return "R" + amount.toLocaleString("en-ZA", {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}


// Calculate the quotation
function calculateQuote() {

    // Get all selected packages and experiences
    const selectedItems = document.querySelectorAll(
        'input[name="offerings"]:checked'
    );

    // Count selected items
    const numberSelected = selectedItems.length;

    // Calculate subtotal
    let subtotal = 0;

    selectedItems.forEach(item => {
        subtotal += Number(item.dataset.price);
    });


    // Determine discount percentage
    let discountPercentage = 0;

    if (numberSelected === 2) {
        discountPercentage = 5;
    }
    else if (numberSelected === 3) {
        discountPercentage = 10;
    }
    else if (numberSelected > 3) {
        discountPercentage = 15;
    }


    // Calculate discount amount
    const discountAmount = subtotal * (discountPercentage / 100);

    // Calculate amount after discount
    const discountedSubtotal = subtotal - discountAmount;

    // Display amount after discount
    afterDiscountDisplay.textContent = formatCurrency(discountedSubtotal);

    // Calculate VAT at 15%
    const vatAmount = discountedSubtotal * 0.15;

    // Calculate final total
    const finalTotal = discountedSubtotal + vatAmount;


    // Display quotation results
    selectedCount.textContent = numberSelected;

    subtotalDisplay.textContent = formatCurrency(subtotal);

    discountDisplay.textContent =
        formatCurrency(discountAmount) +
        " (" + discountPercentage + "%)";

    vatDisplay.textContent = formatCurrency(vatAmount);

    totalDisplay.textContent = formatCurrency(finalTotal);

}


// Store the selections used for the quotation
let calculatedSelection = "";

// Get the current selected packages
function getSelectedItems() {

    const selectedItems = document.querySelectorAll(
        'input[name="offerings"]:checked'
    );

    return Array.from(selectedItems)
        .map(item => item.value + "-" + item.dataset.price)
        .sort()
        .join("|");

}

// Calculate and save the current quotation
calculateButton.addEventListener("click", function () {

    calculateQuote();

    calculatedSelection = getSelectedItems();

});


/*----------BOOKING REQUEST SUBMISSION----------*/

// Get the booking form
const feesForm = document.getElementById("fees-form");

// Get the confirmation message
const submissionMessage = document.getElementById("submission-message");


// Handle booking form submission
feesForm.addEventListener("submit", function (event) {

    // Prevent the page from refreshing
    event.preventDefault();

    // Validate personal details
    validationStarted = true;

    if (!validatePersonalDetails()) {
        showStep(1);
        return;
    }

    // Check that at least one package is selected
    const selectedPackages = document.querySelectorAll(
        'input[name="offerings"]:checked'
    );

    if (selectedPackages.length === 0) {
        showStep(2);
        showSelectionError();
        return;
    }

    // Check whether a quotation has been calculated
    if (calculatedSelection === "") {
        alert("Please calculate your quotation before submitting.");
        return;
    }

    // Check whether the selections have changed
    if (calculatedSelection !== getSelectedItems()) {

        alert(
            "Your selections have changed. " +
            "Please click CALCULATE again before submitting."
        );

        return;
    }

    // Hide all booking steps
    personalDetails.hidden = true;
    selectCourse.hidden = true;
    totalQuote.hidden = true;

    // Hide the racing track
    document.querySelector(".racing-track").hidden = true;

    // Display the confirmation message
    submissionMessage.hidden = false;

    // Scroll to the confirmation message
    submissionMessage.scrollIntoView({
        behavior: "smooth",
        block: "center"
    });

});







