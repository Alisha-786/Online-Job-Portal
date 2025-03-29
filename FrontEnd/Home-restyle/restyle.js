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
  const alertMessage = document.createElement("div"); // Create alert message element
  alertMessage.id = "alert-message";
  alertMessage.style.cssText =
    "color: white; background-color: red; padding: 10px; margin-top: 10px; text-align: center; display: none; border-radius: 5px;";
  searchForm.parentElement.appendChild(alertMessage); // Append alert below the form

  searchForm.addEventListener("submit", function (event) {
    event.preventDefault(); // Prevent form submission

    // Get input values
    const jobTitle = document.querySelector("#job-control").value.trim();
    const location = document.querySelector("#locationSelect").value;
    const experience = document.querySelector("#experienceSelect").value;
    const company = document.querySelector("#companySelect").value;
    // Validate form
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

      return;
    }

    // If validation passes
    alertMessage.style.display = "none";
    console.log("Job Title:", jobTitle);
    console.log("Location:", location);
    console.log("Experience:", experience);
    console.log("Company:", company);
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
