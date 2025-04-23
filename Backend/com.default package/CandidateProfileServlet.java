import java.io.*;


import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/CandidateProfileServlet")
@MultipartConfig
public class CandidateProfileServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Handle GET requests (in case user refreshes or directly accesses the URL)
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.sendRedirect("CandidateProfile.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String updatedFullName = request.getParameter("fullName");
        String updatedEmail = request.getParameter("email");
        String updatedPhone = request.getParameter("phone");
        String updatedSkills = request.getParameter("skills");
        String updatedExperience = request.getParameter("experience");
        String updatedEducation = request.getParameter("education");
        String updatedCertifications = request.getParameter("certifications");

        // Handle resume upload (if any)
        Part resumePart = request.getPart("resume");
        String resumeFileName = null;
        if (resumePart != null && resumePart.getSize() > 0) {
            resumeFileName = resumePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("/") + "uploads" + File.separator + resumeFileName;
            File uploadDir = new File(getServletContext().getRealPath("/") + "uploads");
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            resumePart.write(uploadPath); // Save the resume file
        }

        // Get the session and userId
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");

        if (user_id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is missing.");
            return;
        }

        // Database connection and insert logic
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "AP25@qwerty")) {
            String insertQuery = "INSERT INTO candidate_profiles (user_id, full_name, email, phone, skills, experience, education, certifications, resume_path) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
                stmt.setString(1, user_id); // Use userId from session
                stmt.setString(2, updatedFullName);
                stmt.setString(3, updatedEmail);
                stmt.setString(4, updatedPhone);
                stmt.setString(5, updatedSkills);
                stmt.setString(6, updatedExperience);
                stmt.setString(7, updatedEducation);
                stmt.setString(8, updatedCertifications);
                stmt.setString(9, resumeFileName); // Save the resume file name

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("CandidateProfile.jsp"); // Redirect to the profile page if insert is successful
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Profile insertion failed.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
}
}