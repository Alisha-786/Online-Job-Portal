function showEditor() {
    document.getElementById("about-editor").classList.toggle("hidden");
  }
  
  function saveAbout() {
    let aboutText = document.getElementById("about-text").value;
  
    // Save to localStorage
    localStorage.setItem("about", aboutText);
  
    // Display the saved text
    document.getElementById("about-display").innerText = aboutText;
  
    // Hide editor after saving
    document.getElementById("about-editor").classList.add("hidden");
  }
  
  window.onload = function () {
    // ... your other form field loading logic
  
    const about = localStorage.getItem("about");
    if (about) {
      document.getElementById("about-display").innerText = about;
    }
  };
  function showEditor() {
    const editor = document.getElementById("about-editor");
    const savedText = localStorage.getItem("about");
  
    if (savedText) {
      document.getElementById("about-text").value = savedText;
    }
  
    editor.classList.toggle("hidden");
  }
  
  // Load saved data when the page loads
  window.onload = function () {
    const fields = [
      "name",
      "email",
      "mobile",
      "gender",
      "user-type",
      "course",
      "specialization",
      "duration",
      "job-role",
      "location",
    ];
  
    fields.forEach((field) => {
      const input = document.getElementById(field);
      if (localStorage.getItem(field)) {
        input.value = localStorage.getItem(field);
      }
    });
  
    // Load "about" text
    const about = localStorage.getItem("about");
    if (about) {
      document.getElementById("about-display").innerText = about;
    }
  };
  
  // Save data when "Save" button is clicked
  document.querySelector(".save-btn").addEventListener("click", function () {
    const fields = [
      "name",
      "email",
      "mobile",
      "gender",
      "user-type",
      "course",
      "specialization",
      "duration",
      "job-role",
      "location",
    ];
  
    fields.forEach((field) => {
      const input = document.getElementById(field);
      localStorage.setItem(field, input.value);
    });
  
    alert("Details saved successfully");
  });
  
  // Add About Section
  function showEditor() {
    document.getElementById("about-editor").classList.remove("hidden");
  }
  
  function saveAbout() {
    const aboutText = document.getElementById("about-text").value;
    localStorage.setItem("about", aboutText);
    document.getElementById("about-display").innerText = aboutText;
    document.getElementById("about-editor").classList.add("hidden");
  }
  
  // Enable editing when Edit Profile is clicked
  document.querySelector(".edit-btn").addEventListener("click", function () {
    const inputs = document.querySelectorAll("input");
    inputs.forEach((input) => {
      input.removeAttribute("disabled");
      input.classList.add("editable");
    });
  });
  
