document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form submission

    let username = document.getElementById("username").value.trim();
    let phone = document.getElementById("phone").value.trim();
    let email = document.getElementById("email").value.trim();
    let password = document.getElementById("password").value.trim();
    let confirmPassword = document.getElementById("confirmPassword").value.trim();
    let passwordError = document.getElementById("passwordError");
    let confirmPasswordError = document.getElementById("confirmPasswordError");
    let successMessage = document.getElementById("successMessage");

    // Reset errors
    passwordError.textContent = "";
    confirmPasswordError.textContent = "";

    // Validation checks
    if (password.length < 6) {
        passwordError.textContent = "Password must be at least 6 characters long.";
        return;
    }

    if (password !== confirmPassword) {
        confirmPasswordError.textContent = "Passwords do not match.";
        return;
    }

    // If everything is valid, show success message
    successMessage.style.display = "block";

    // Optionally, submit the form or send data to a server here
});
