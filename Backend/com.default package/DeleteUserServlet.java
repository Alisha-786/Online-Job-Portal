

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


import com.dao.UserDao;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserServlet() {
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
            int id = Integer.parseInt(request.getParameter("id"));
            UserDao dao = new UserDao(DBConnect.getConn());
            boolean success = dao.deleteUser(id);
            
            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("message", "User deleted successfully.");
                session.setAttribute("messageType", "success");
            } else {
                session.setAttribute("message", "Failed to delete user.");
                session.setAttribute("messageType", "danger");
            }
            
            response.sendRedirect(request.getContextPath() + "/ManageUsersServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("message", "Error: " + e.getMessage());
            session.setAttribute("messageType", "danger");
            response.sendRedirect(request.getContextPath() + "/ManageUsersServlet");
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
