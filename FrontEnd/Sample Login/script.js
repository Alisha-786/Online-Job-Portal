document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm");
  const emailInput = document.getElementById("email");
  const passwordInput = document.getElementById("password");
  const rememberMeCheckbox = document.getElementById("remember");
  const forgotPasswordLink = document.getElementById("forgot-password");

  loginForm.addEventListener("submit", function (submit) {
    submit.preventDefault(); // Prevent default form submission

    const email = emailInput.value.trim();
    const password = passwordInput.value.trim();

    if (email === "") {
      showAlert("❌ Email field cannot be empty.", "danger");
      return;
    }

    if (password === "") {
      showAlert("❌ Password field cannot be empty.", "danger");
      return;
    }

    if (!validateEmail(email)) {
      showAlert("❌ Please enter a valid email address.", "danger");
      return;
    }

    if (password.length < 6) {
      showAlert("❌ Password must be at least 6 characters long.", "danger");
      return;
    }

    // Store email & password in local storage if "Remember Me" is checked
    if (rememberMeCheckbox.checked) {
      localStorage.setItem("rememberedEmail", email);
      localStorage.setItem("rememberedPassword", password);
    } else {
      localStorage.removeItem("rememberedEmail");
      localStorage.removeItem("rememberedPassword");
    }

    showAlert("✅ Login successful! Redirecting...", "success");

    // Simulating a delay before redirecting
    setTimeout(() => {
      window.location.href = "dashboard.html"; // Change this to your actual target page
    }, 2000);
  });

  // Forgot password functionality - Clears password field
  forgotPasswordLink.addEventListener("click", function (click) {
    click.preventDefault();
    passwordInput.value = "";
    localStorage.removeItem("rememberedPassword"); // Remove password from storage
    showAlert(
      "🔑 Password field has been cleared. Please enter a new password.",
      "info"
    );
  });

  // Function to validate email format
  function validateEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
  }

  // Function to show alert messages
  function showAlert(message, type) {
    let alertBox = document.getElementById("alert-box");

    if (!alertBox) {
      alertBox = document.createElement("div");
      alertBox.id = "alert-box";
      alertBox.style.cssText =
        "position: fixed; top: 10px; left: 50%; transform: translateX(-50%); padding: 10px 20px; border-radius: 5px; color: white; z-index: 1000; text-align: center;";
      document.body.appendChild(alertBox);
    }

    alertBox.textContent = message;
    alertBox.style.backgroundColor =
      type === "success" ? "green" : type === "danger" ? "red" : "blue";

    alertBox.style.display = "block";

    setTimeout(() => {
      alertBox.style.display = "none";
    }, 3000);
  }

  // Social login button click effect
  document.querySelectorAll(".social-btn").forEach((button) => {
    button.addEventListener("click", function () {
      showAlert(
        `🔗 Redirecting to ${this.textContent.trim()} login...`,
        "info"
      );
    });
  });
});
