

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.json.JSONArray;
import org.json.JSONObject;
/**
 * Servlet implementation class JobServlet
 */
@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String API_KEY = "21683b8efd426db2cf4f074d87b4bcd96691973dbd1b72581813fe11742b6b7d";  // Replace with your SerpApi key
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String query = request.getParameter("q");
        String apiKey = "21683b8efd426db2cf4f074d87b4bcd96691973dbd1b72581813fe11742b6b7d";  // Replace with your actual API key

        String apiUrl = "https://serpapi.com/search.json?engine=google_jobs&q=" + query + "&api_key=" + apiKey;
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder content = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }
        in.close();
        conn.disconnect();

        // Allow CORS
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("application/json");
        response.getWriter().write(content.toString());
	}
	/*private void fetchJobs(HttpServletRequest request, PrintWriter out) {
        String query = request.getParameter("query");
        String location = request.getParameter("location");

        if (query == null || location == null) {
            out.print("{\"error\":\"Missing query or location parameter\"}");
            return;
        }

        String apiUrl = "https://serpapi.com/search.json?engine=google_jobs&q=" + query +
                        "&location=" + location + "&api_key=" + API_KEY;

        OkHttpClient client = new OkHttpClient();
        Request apiRequest = new Request.Builder().url(apiUrl).build();

        try (Response apiResponse = client.newCall(apiRequest).execute()) {
            if (!apiResponse.isSuccessful()) {
                out.print("{\"error\":\"Failed to fetch jobs\"}");
                return;
            }

            JSONObject jsonResponse = new JSONObject(apiResponse.body().string());
            JSONArray jobs = jsonResponse.optJSONArray("jobs_results");

            if (jobs == null) {
                out.print("{\"error\":\"No job results found\"}");
            } else {
                out.print(jobs.toString());
            }
        } catch (Exception e) {
            out.print("{\"error\":\"Exception occurred: " + e.getMessage() + "\"}");
        }
    }*/

    /**
     * Fetch job details for a specific job from SerpApi.
     */
   /* private void fetchJobDetails(HttpServletRequest request, PrintWriter out) {
        String jobId = request.getParameter("job_id");

        if (jobId == null) {
            out.print("{\"error\":\"Missing job_id parameter\"}");
            return;
        }

        String apiUrl = "https://serpapi.com/search.json?engine=google_jobs_listing&job_id=" + jobId +
                        "&api_key=" + API_KEY;

        OkHttpClient client = new OkHttpClient();
        Request apiRequest = new Request.Builder().url(apiUrl).build();

        try (Response apiResponse = client.newCall(apiRequest).execute()) {
            if (!apiResponse.isSuccessful()) {
                out.print("{\"error\":\"Failed to fetch job details\"}");
                return;
            }

            JSONObject jobDetails = new JSONObject(apiResponse.body().string());
            out.print(jobDetails.toString());
        } catch (Exception e) {
            out.print("{\"error\":\"Exception occurred: " + e.getMessage() + "\"}");
        }
    }
*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
