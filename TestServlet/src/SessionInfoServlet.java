import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 演示Servlet API中的session管理机制（常用方法）
 * @author jukey
 *
 */
public class SessionInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        // Returns the current session associated with this request, or if the request does not have a session, creates one.
        HttpSession mySession = request.getSession(true);
       
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Session Info Servlet";
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Session Info Servlet</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h3>Session Infomation</h3>");
       
        // Returns true if the client does not yet know about the session or if the client chooses not to join the session.
        out.println("New Session:" + mySession.isNew() + "<br>");
        // Returns a string containing the unique identifier assigned to this session.
        out.println("Session Id:" + mySession.getId() + "<br>");
        // Returns the time when this session was created, measured in milliseconds since midnight January 1, 1970 GMT.
        out.println("Session Create Time:" + new Date(mySession.getCreationTime()) + "<br>");
        out.println("Session Last Access Time:" + new Date(mySession.getLastAccessedTime()) + "<br>");
       
        out.println("<h3>Request Infomation</h3>");
        // Returns the session ID specified by the client.
        out.println("Session Id From Request:" + request.getRequestedSessionId() + "<br>");
        // Checks whether the requested session ID came in as a cookie.
        out.println("Session Id Via Cookie:" + request.isRequestedSessionIdFromCookie() + "<br>");
        // Checks whether the requested session ID came in as part of the request URL.
        out.println("Session Id Via URL:" + request.isRequestedSessionIdFromURL() + "<br>");
        // Checks whether the requested session ID is still valid.
        out.println("Valid Session Id:" + request.isRequestedSessionIdValid() + "<br>");
       
        out.println("<a href=" + response.encodeURL("SessionInfoServlet") + ">refresh</a>");
        out.println("</body></html>");
        out.close();
    }

}