//Header section

document.addEventListener("DOMContentLoaded", function () {
  // Mobile Toggle Button
  const navbarToggler = document.querySelector(".navbar-toggler");
  const navbarCollapse = document.querySelector("#navbarNav");

  navbarToggler.addEventListener("click", function () {
    navbarCollapse.classList.toggle("show");
  });

  // Profile Dropdown Toggle
  const profileDropdown = document.querySelector("#profileDropdown");

  profileDropdown.addEventListener("click", function () {
    click.preventDefault(); // Prevents page jump
    let dropdownMenu = this.nextElementSibling;
    dropdownMenu.classList.toggle("show");
  });

  // Close dropdown when clicking outside
  document.addEventListener("click", function (click) {
    let isClickInside =
      profileDropdown.contains(click.target) ||
      profileDropdown.nextElementSibling.contains(click.target);

    if (!isClickInside) {
      profileDropdown.nextElementSibling.classList.remove("show");
    }
  });
});

//Confirm logout
// Logout Confirmation Popup
const logoutButton = document.getElementById("danger");
if (logoutButton) {
  logoutButton.addEventListener("click", function (click) {
    click.preventDefault(); // Prevent default logout action

    const confirmLogout = document.createElement("div");
    confirmLogout.innerHTML = `<p>Are you sure you want to log out?</p>
       <button id="confirm-yes" style="margin-right: 10px; padding: 5px 10px; background-color: green; color: white; border: none; border-radius: 5px; cursor: pointer;">Yes</button>
       <button id="confirm-no" style="padding: 5px 10px; background-color: red; color: white; border: none; border-radius: 5px; cursor: pointer;">No</button>`;
    confirmLogout.style.cssText =
      "position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: white; padding: 20px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); border-radius: 5px; text-align: center; z-index: 1001;";

    document.body.appendChild(confirmLogout);

    document
      .getElementById("confirm-yes")
      .addEventListener("click", function () {
        window.location.href = "../Landing page/index1.html";
      });

    document
      .getElementById("confirm-no")
      .addEventListener("click", function () {
        document.body.removeChild(confirmLogout);
      });
  });
}

//Search box

document.addEventListener("DOMContentLoaded", function () {
  const searchForm = document.querySelector(".search-bar");
  const searchBtn = document.getElementById("search-button");

  // Create alert message element
  const alertMessage = document.createElement("div");
  alertMessage.id = "alert-message";
  alertMessage.style.cssText =
    "color: white; background-color: red; padding: 10px; margin-top: 10px; text-align: center; display: none; border-radius: 5px;";
  searchForm.parentElement.appendChild(alertMessage); // Append alert below the form

  // Function to validate form
  function validateForm() {
    const jobTitle = document.querySelector("#job-control").value.trim();
    const location = document.querySelector("#locationSelect").value;
    const experience = document.querySelector("#experienceSelect").value;
    const company = document.querySelector("#companySelect").value;

    if (
      !jobTitle ||
      location === "Location" ||
      experience === "Experience" ||
      company === "Company"
    ) {
      alertMessage.innerText = "⚠️ Please fill in all fields before searching!";
      alertMessage.style.display = "block"; // Show alert

      // Hide alert after 3 seconds
      setTimeout(() => {
        alertMessage.style.display = "none";
      }, 3000);

      return false; // Stop execution
    }

    return true; // Form is valid
  }

  // Add event listener to the search form
  searchForm.addEventListener("submit", function (click) {
    click.preventDefault(); // Prevent form submission

    if (validateForm()) {
      console.log("Form is valid. Redirecting...");

      // Store search values in localStorage
      localStorage.setItem(
        "jobTitle",
        document.querySelector("#job-control").value.trim()
      );
      localStorage.setItem(
        "location",
        document.querySelector("#locationSelect").value
      );
      localStorage.setItem(
        "experience",
        document.querySelector("#experienceSelect").value
      );
      localStorage.setItem(
        "company",
        document.querySelector("#companySelect").value
      );
      // Redirect to another page (change 'browse.html' to your actual page)
      window.location.href = "../Browse-Jobs/browse.html";
    }
  });
});

//the follow button will turn following
document.addEventListener("DOMContentLoaded", function () {
  const followButtons = document.querySelectorAll(".follow span");

  followButtons.forEach((button) => {
    button.addEventListener("click", function () {
      if (this.classList.contains("bg-primary")) {
        this.classList.remove("bg-primary");
        this.classList.add("bg-success");
        this.innerHTML = "Following <i class='bi bi-check-circle'></i>";
      } else {
        this.classList.remove("bg-success");
        this.classList.add("bg-primary");
        this.innerHTML = "Follow <i class='bi bi-plus-circle'></i>";
      }
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const form = document.querySelector("form");
  const submitButton = form.querySelector("button");

  form.addEventListener("submit", function (click) {
    click.preventDefault(); // Prevent default form submission

    // Get form values

    let name = document.getElementById("name").value.trim();
    let email = document.getElementById("email").value.trim();
    let message = document.getElementById("message").value.trim();
    let submitButton = document.getElementById("submitButton");

    // Basic validation
    if (name === "" || email === "" || message === "") {
      alert("Please fill out all fields before submitting.");
      return;
    }

    let emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
    if (!email.match(emailPattern)) {
      alert("Please enter a valid email address.");
      return;
    }

    submitButton.textContent = "Sending...";
    submitButton.disabled = true;
    submitButton.style.backgroundColor = "#ffa500";

    // Simulate form submission process
    setTimeout(() => {
      alert("Message sent successfully!");
      submitButton.style.backgroundColor = "green";
      submitButton.textContent = "Submitted";
      submitButton.disabled = true;
      setTimeout(() => {
        location.reload();
      }, 1000);
    }, 1000);
  });
});
