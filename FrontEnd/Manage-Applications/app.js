document.addEventListener("DOMContentLoaded", function () {
  const toggleBtn = document.getElementById("toggle-sidebar");
  const closeBtn = document.getElementById("close-sidebar");
  const sidebar = document.querySelector(".sidebar");

  // Initially hide the sidebar and show the button
  sidebar.classList.add("hidden");
  toggleBtn.style.display = "block";

  // Show sidebar when button is clicked
  toggleBtn.addEventListener("click", function () {
    sidebar.classList.toggle("hidden");
    toggleBtn.style.display = sidebar.classList.contains("hidden")
      ? "block"
      : "none";
  });

  // Close sidebar when close button is clicked
  closeBtn.addEventListener("click", function () {
    sidebar.classList.add("hidden");
    toggleBtn.style.display = "block";
  });
});

document.addEventListener("DOMContentLoaded", function () {
  // Select all accept and reject buttons
  const acceptButtons = document.querySelectorAll(".btn-success");
  const rejectButtons = document.querySelectorAll(".btn-danger");

  // Function to update status with confirmation
  function updateStatus(button, status, colorClass) {
    const confirmationMessage =
      status === "Accepted"
        ? "Are you sure you want to accept this candidate?"
        : "Are you sure you want to reject this candidate?";

    if (confirm(confirmationMessage)) {
      const card = button.closest(".card");
      const statusBadge = card.querySelector(".badge");

      statusBadge.textContent = status; // Change text
      statusBadge.className = `badge ${colorClass} mb-2`; // Update color
    }
  }

  // Loop through each accept button
  acceptButtons.forEach((button) => {
    button.addEventListener("click", function () {
      updateStatus(this, "Accepted", "bg-success");
    });
  });

  // Loop through each reject button
  rejectButtons.forEach((button) => {
    button.addEventListener("click", function () {
      updateStatus(this, "Rejected", "bg-danger");
    });
  });
});

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
