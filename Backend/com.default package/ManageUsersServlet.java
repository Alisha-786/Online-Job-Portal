

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

import com.dao.UserDao;
import com.DB.DBConnect;
import com.entity.user;

import jakarta.servlet.*;

import java.util.List;

/**
 * Servlet implementation class ManageUsersServlet
 */
@WebServlet("/ManageUsersServlet")
public class ManageUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 try {
	            // Verify database connection first
	            Connection conn = DBConnect.getConn();
	            if (conn == null || conn.isClosed()) {
	                throw new ServletException("Database connection failed");
	            }
	            
	            UserDao dao = new UserDao(DBConnect.getConn());
	            List<user> userList = dao.getAllUsers();
	            
	            // Debug output
	            System.out.println("Number of users fetched: " + userList.size());
	            for (user u : userList) {
	                System.out.println(u.getId() + " " + u.getName() + " " + u.getEmail());
	            }
	            
	            request.setAttribute("users", userList);
	            RequestDispatcher rd = request.getRequestDispatcher("AdminManageUsers.jsp");
	            rd.forward(request, response);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            HttpSession session = request.getSession();
	            session.setAttribute("errorMsg", "Error fetching users: " + e.getMessage());
	            response.sendRedirect("AdminManageUsers.jsp");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
