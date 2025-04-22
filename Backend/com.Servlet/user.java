import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/auth/login")
public class LoginUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/job_portal";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "your_password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Get form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate inputs
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            out.print("{\"status\":\"error\",\"message\":\"Email and Password are required\"}");
            return;
        }

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to check user credentials
            String sql = "SELECT id, name, password, role FROM users WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String storedPassword = rs.getString("password");
                String role = rs.getString("role");

                // Verify password
                if (storedPassword.equals(hashPassword(password))) {
                    out.print("{\"status\":\"success\",\"message\":\"Login successful\","
                            + "\"user\":{\"id\":" + userId + ",\"name\":\"" + name + "\",\"email\":\"" + email + "\",\"role\":\"" + role + "\"}}");
                } else {
                    out.print("{\"status\":\"error\",\"message\":\"Invalid email or password\"}");
                }
            } else {
                out.print("{\"status\":\"error\",\"message\":\"User not found\"}");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            out.print("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        }
    }

    // Hash password using SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }
}
