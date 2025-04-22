

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            
	            UserDao dao = new UserDao(DBConnect.getConn());
	            user u = dao.loginUser(email, password);
	            
	            HttpSession session = request.getSession();
	            
	            if (u != null) {
	                session.setAttribute("currentUser", u);
	                
	                //  Store user name in session
	                String userName = u.getName();  // Assuming user.getName() returns the name
	                session.setAttribute("userName", userName);

	                
	                // Check for admin (hidden role)
	                if (email.equals("admin@nexthire.com") && password.equals("admin123")) {
	                    response.sendRedirect("AdminDashboard.jsp");
	                } 
	                // Check role for redirection
	                else if ("Candidate".equalsIgnoreCase(u.getRole())) {
	                    response.sendRedirect("CandidateHomePage.jsp");
	                } 
	                else if ("Recruiter".equalsIgnoreCase(u.getRole())) {
	                    response.sendRedirect("EmployerHomePage.jsp");
	                } 
	                else {
	                    // Default redirect if role not recognized
	                    response.sendRedirect("LandingPage.jsp");
	                }
	            } else {
	                session.setAttribute("errorMsg", "Invalid email or password!");
	                response.sendRedirect("Login.jsp");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            HttpSession session = request.getSession();
	            session.setAttribute("errorMsg", "Login error: " + e.getMessage());
	            response.sendRedirect("Login.jsp");
	        }
	}

}
