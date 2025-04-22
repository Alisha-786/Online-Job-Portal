import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/profile")
public class  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/job_portal";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "your_password";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Get user ID from request parameters
        String userIdParam = request.getParameter("id");

        // Validate input
        if (userIdParam == null || userIdParam.isEmpty()) {
            out.print("{\"status\":\"error\",\"message\":\"User ID is required\"}");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdParam);

            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to fetch user details
            String sql = "SELECT id, name, email, role FROM users WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String role = rs.getString("role");

                // Return user details in JSON format
                out.print("{\"status\":\"success\",\"user\":"
                        + "{\"id\":" + userId + ",\"name\":\"" + name + "\",\"email\":\"" + email + "\",\"role\":\"" + role + "\"}}");
            } else {
                out.print("{\"status\":\"error\",\"message\":\"User not found\"}");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (NumberFormatException e) {
            out.print("{\"status\":\"error\",\"message\":\"Invalid user ID\"}");
        } catch (Exception e) {
            out.print("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        }
    }
}
