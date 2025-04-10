document.addEventListener("DOMContentLoaded", function () {
  const words = ["Dream Job", "Perfect Career", "Success"];
  let i = 0;

  setInterval(() => {
    document.querySelector(".animated-text").textContent = words[i];
    i = (i + 1) % words.length;
  }, 2000);
});
// Ensure the page content loads before animations
document.addEventListener("DOMContentLoaded", function () {
  // GSAP Fade-in Animation for Navbar, Hero Text, and Job Category
  gsap.from(".navbar", { opacity: 0, y: -30, duration: 1 });
  gsap.from(".hero-image", {
    opacity: 0,
    scale: 0.8,
    duration: 1.5,
    delay: 0.5,
  });
  gsap.from(".fw-bold", {
    opacity: 0,
    x: -50,
    duration: 1.2,
    ease: "power2.out",
  });

  gsap.from(".job-box", {
    opacity: 0,
    y: 30,
    duration: 1,
    stagger: 0.2,
    delay: 1.2,
  });

  // Bouncing Effect for the Main Heading
  gsap.to(".animated-text", {
    y: -5,
    repeat: -1,
    yoyo: true,
    duration: 0.8,
    ease: "power1.inOut",
  });

  // Adding Hover Effect to Job Boxes
  document.querySelectorAll(".job-box").forEach((box) => {
    box.addEventListener("mouseenter", () => {
      gsap.to(box, { scale: 1.05, duration: 0.2, ease: "power1.out" });
    });
    box.addEventListener("mouseleave", () => {
      gsap.to(box, { scale: 1, duration: 0.2 });
    });
  });
});

//Accordian

document.querySelectorAll(".accordion-header").forEach((button) => {
  button.addEventListener("click", () => {
    const accordionItem = button.parentElement;
    const accordionContent = button.nextElementSibling;

    // Get current height of content for smooth animation
    const contentHeight =
      accordionContent.querySelector(".accordion-body").offsetHeight;

    // If this item is already active
    if (accordionItem.classList.contains("active")) {
      // Close it
      accordionContent.style.maxHeight = "0px";
      accordionItem.classList.remove("active");
      accordionContent.classList.remove("active");
    } else {
      // Close any open items first
      document
        .querySelectorAll(".accordion-item.active")
        .forEach((activeItem) => {
          activeItem.classList.remove("active");
          activeItem.querySelector(".accordion-content").style.maxHeight =
            "0px";
          activeItem
            .querySelector(".accordion-content")
            .classList.remove("active");
        });

      // Open clicked item
      accordionContent.style.maxHeight = contentHeight + "px";
      accordionItem.classList.add("active");
      accordionContent.classList.add("active");
    }
  });
});

//Search for Job

document.addEventListener("DOMContentLoaded", function () {
  document
    .getElementById("jobSearchForm")
    .getElementById("submit", function (click) {
      click.preventDefault(); // Prevent default form submission

      // Get input values
      let jobTitle = document.getElementById("jobTitle").value.trim();
      let location = document.getElementById("location").value;

      // Check if fields are filled
      if (jobTitle === "" || location === "") {
        alert("Please enter a job title and select a location.");
        return;
      }

      // Redirect to search results page (modify URL as needed)
      let searchURL = `search-results.html?job=${encodeURIComponent(
        jobTitle
      )}&location=${encodeURIComponent(location)}`;
      window.location.href = searchURL;
    });
});

//submit form

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
