

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDAO;

/**
 * Servlet implementation class DeleteJobServlet
 */
@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteJobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int jobId = Integer.parseInt(request.getParameter("id"));
        JobDAO dao = new JobDAO(DBConnect.getConn());
        boolean result = dao.deleteJob(jobId);
        if (result) {
            response.sendRedirect("AdminManageJobs.jsp?message=Deleted successfully");
        } else {
            response.sendRedirect("AdminManageJobs.jsp?message=Failed to delete");
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
