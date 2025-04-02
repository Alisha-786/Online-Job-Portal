document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm");
  const emailInput = document.getElementById("email");
  const passwordInput = document.getElementById("password");
  const rememberMeCheckbox = document.getElementById("remember");
  const forgotPasswordLink = document.getElementById("forgot-password");

  // Function to show alerts dynamically
  function showAlert(message, type, callback = null) {
    let alertBox = document.getElementById("alert-box");

    if (!alertBox) {
      alertBox = document.createElement("div");
      alertBox.id = "alert-box";
      alertBox.setAttribute("role", "alert");
      alertBox.style.cssText =
        "position: fixed; top: 20px; left: 50%; transform: translateX(-50%); padding: 10px 20px; border-radius: 20px; color: white; z-index: 1000; text-align: center;";
      document.body.appendChild(alertBox);
    }

    alertBox.innerText = message;
    alertBox.style.backgroundColor =
      type === "success" ? "green" : type === "danger" ? "red" : "blue";

    alertBox.style.display = "block";

    // Hide alert after 1 second and execute callback if provided
    setTimeout(() => {
      alertBox.style.display = "none";
      alertBox.remove();
      if (callback) callback(); // Execute callback function (for redirection)
    }, 1000);
  }

  // Function to validate email format
  function validateEmail(email) {
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
  }

  // Load remembered email on page load
  function loadRememberedCredentials() {
    const storedEmail = localStorage.getItem("rememberedEmail");
    if (storedEmail) emailInput.value = storedEmail;
  }

  loadRememberedCredentials(); // Load stored email

  if (loginForm) {
    loginForm.addEventListener("submit", function (event) {
      event.preventDefault(); // Prevent default form submission

      const email = emailInput.value.trim();
      const password = passwordInput.value.trim();

      if (!email) {
        showAlert("❌ Email field cannot be empty.", "danger");
        return;
      }

      if (!password) {
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

      // Store email in local storage if "Remember Me" is checked
      if (rememberMeCheckbox.checked) {
        localStorage.setItem("rememberedEmail", email);
      } else {
        localStorage.removeItem("rememberedEmail");
      }

      showAlert("✅ Login successful! Redirecting...", "success", function () {
        window.location.href = "../Home-restyle/restyle.html"; // Ensure this path is correct
      });
    });
  }

  // Forgot password functionality
  if (forgotPasswordLink) {
    forgotPasswordLink.addEventListener("click", function (event) {
      event.preventDefault();
      passwordInput.value = "";
      showAlert(
        "🔑 Password field has been cleared. Please enter a new password.",
        "info"
      );
    });
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

