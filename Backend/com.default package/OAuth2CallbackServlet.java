

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.json.JSONObject;

/**
 * Servlet implementation class OAuth2CallbackServlet
 */
@WebServlet("/OAuth2CallbackServlet")
public class OAuth2CallbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CLIENT_ID = "your_client_id";
    private static final String CLIENT_SECRET = "your_client_Secret";
    private static final String REDIRECT_URI = "redirect_link";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OAuth2CallbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String code = request.getParameter("code");

        if (code != null) {
            // Exchange auth code for access token
            URL url = new URL("https://oauth2.googleapis.com/token");
            String params = "code=" + URLEncoder.encode(code, "UTF-8") +
                            "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8") +
                            "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8") +
                            "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8") +
                            "&grant_type=authorization_code";

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            OutputStream os = conn.getOutputStream();
            os.write(params.getBytes());
            os.flush();
            os.close();

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder responseData = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                responseData.append(inputLine);
            }
            in.close();

            JSONObject json = new JSONObject(responseData.toString());
            String idToken = json.getString("id_token");

            // Decode the JWT token (basic method)
            String[] parts = idToken.split("\\.");
            String payload = new String(java.util.Base64.getUrlDecoder().decode(parts[1]));
            JSONObject payloadJson = new JSONObject(payload);

            String email = payloadJson.getString("email");
            String name = payloadJson.getString("name");

            // Store user info in session
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("name", name);

            response.sendRedirect("CandidateHomePage.jsp"); // Redirect to welcome page
        } else {
            response.getWriter().println("Authorization failed.");
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
