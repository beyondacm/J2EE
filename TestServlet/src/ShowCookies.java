import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 读取客户端的Cookies
 * @author beyond_acm
 *
 */
public class ShowCookies extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        response.setContentType("text/html;charset=gb2312");
        PrintWriter pw = response.getWriter();
        String title = "Active Cookies";
        pw.println("init");
        pw.println("<html><head><title>读取客户端</title></head>"
                + title
                + "\n" + "<table border=1 align=center>\n"
                + "<TH>Cookie Name<TH>Cookie Value" + "<br>");
       
        // 读取客户端的所有Cookie
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            Cookie cookie;
            for(int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                pw.println("<tr>\n" + "<td>" + cookie.getName() +"</td>\n"
                        + "<td>" + cookie.getValue() +"</td></tr>\n");
            }
        }
        pw.println("</table>\n<body><html>");
    }

}