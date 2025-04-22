
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class PostJobServlet
 */
@WebServlet("/PostJobServlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
	    maxFileSize = 1024 * 1024 * 10,      // 10 MB
	    maxRequestSize = 1024 * 1024 * 100   // 100 MB
	)
public class PostJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
        	// Get logged-in recruiter info from session
            Integer recruiterId = (Integer) session.getAttribute("userId");
            String role = (String) session.getAttribute("role");
        	
            String title = request.getParameter("jobTitle");
            String jobType = request.getParameter("jobType");
            String location = request.getParameter("location");
            String companyName = request.getParameter("companyName");
            String website = request.getParameter("website");
            String description = request.getParameter("description");
            String postedBy = request.getParameter("postedBy");
            String salary = request.getParameter("salary");
            String experience = request.getParameter("experience");
            String industry = request.getParameter("industry");

            // Validate required fields
            if (postedBy == null || postedBy.trim().isEmpty()) {
                session.setAttribute("message", "Recruiter name is required");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("PostaJob.jsp");
                return;
            }
            if (recruiterId == null || !"Recruiter".equals(role)) {
                session.setAttribute("message", "Only recruiters can post jobs");
                session.setAttribute("messageType", "danger");
                response.sendRedirect("PostaJob.jsp");
                return;
            }


            
            // Handle file upload
            Part logoPart = request.getPart("logo");
            String logoFileName = logoPart.getSubmittedFileName();
            
            // Create uploads directory if it doesn't exist
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            // Save the file
            String logoPath = uploadPath + File.separator + logoFileName;
            logoPart.write(logoPath);

            // Database operation
            Connection conn = DBConnect.getConn();
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO jobs(title, description, salary, location, experience, industry, job_type, " +
                    "company_name, website, logo, recruiter_id, posted_date) " +  // Changed posted_by to recruiter_id
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())"
                );
            
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, salary);
            ps.setString(4, location);
            ps.setString(5, experience);
            ps.setString(6, industry);
            ps.setString(7, jobType);
            ps.setString(8, companyName);
            ps.setString(9, website);
            ps.setString(10, "uploads/" + logoFileName);
            ps.setString(11, postedBy);
            ps.setInt(12, recruiterId);

            int rows = ps.executeUpdate();
            
            if (rows > 0) {
                session.setAttribute("message", "Job posted successfully!");
                session.setAttribute("messageType", "success");
            } else {
                session.setAttribute("message", "Failed to post job. Please try again.");
                session.setAttribute("messageType", "danger");
            }
            
            response.sendRedirect("PostaJob.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Error occurred while posting the job: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect("PostaJob.jsp");
        } finally {
            if (out != null) {
                out.close();
            }
            }
	}

}
