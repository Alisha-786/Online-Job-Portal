document.getElementById("showMoreBtn").addEventListener("click", function () {
  document.getElementById("hidden-jobs").classList.remove("d-none");
  this.style.display = "none"; // Hide the button after clicking
});
document.addEventListener("DOMContentLoaded", function () {
  // Retrieve stored values from localStorage
  const storedJobTitle = localStorage.getItem("jobTitle");
  const storedLocation = localStorage.getItem("location");
  const storedExperience = localStorage.getItem("experience");
  const storedCompany = localStorage.getItem("company");

  // Check if values exist and populate the fields
  if (storedJobTitle)
    document.querySelector("#job-control").value = storedJobTitle;
  if (storedLocation)
    document.querySelector("#locationSelect").value = storedLocation;
  if (storedExperience)
    document.querySelector("#experienceSelect").value = storedExperience;
  if (storedCompany)
    document.querySelector("#companySelect").value = storedCompany;
});
