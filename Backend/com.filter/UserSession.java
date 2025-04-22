package com.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class UserSession implements Filter {
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        // Allow access to these paths without authentication
        if (path.startsWith("/Login.jsp") || path.startsWith("/SignUp.jsp") 
                || path.startsWith("/LoginServlet") || path.startsWith("/SignUpServlet")
                || path.startsWith("/css/") || path.startsWith("/js/") 
                || path.startsWith("/img/") || path.equals("/")) {
            chain.doFilter(request, response);
            return;
        }
        
        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("currentUser") != null);
        
        if (!isLoggedIn) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/Login.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }
    
    // Other Filter methods (init, destroy) can remain empty
}
