

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.UserDao;
import com.entity.user;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
		try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String userType = request.getParameter("userType"); // candidate or recruiter
            System.out.println("Received userType: " + userType); // Add this line
            
            // Validate password match
            if (!password.equals(confirmPassword)) {
                HttpSession session = request.getSession();
                session.setAttribute("errorMsg", "Passwords do not match!");
                response.sendRedirect("SignUp.jsp");
                return;
            }
            
            // Convert userType to role
            String role = "Candidate";
            if ("recruiter".equalsIgnoreCase(userType)) {
                role = "Recruiter";
            }
            
            // Check for admin registration (prevent regular users from registering as admin)
            if (email.equals("admin@nexthire.com")) {
                role = "Admin";
            }
            
            user u = new user(name, email, password, "", role);
            UserDao dao = new UserDao(DBConnect.getConn());
            
            HttpSession session = request.getSession();
            if (dao.registerUser(u)) {
                session.setAttribute("successMsg", "Registration successful!");
                response.sendRedirect("Login.jsp");
            } else {
                session.setAttribute("errorMsg", "Registration failed. Email may already exist.");
                response.sendRedirect("SignUp.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMsg", "Something went wrong: " + e.getMessage());
            response.sendRedirect("SignUp.jsp");
        }
	}

}
