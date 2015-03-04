import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 设置Cookie到客户端
 * @author beyond_acm
 *
 */
public class SetCookies extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 向客户端写入Cookie，共6个
        for(int i = 0; i < 3; i++) {
            // 3个没有设置时间的Cookie，属于本窗口及其子窗口
            Cookie cookie = new Cookie("Session-Cookie-" + i, "Cookie-Value-S" + i);
            response.addCookie(cookie);
            // 以下3个Cookie设置了时间（3600秒，1小时），属于文本，别的窗口也可以访问到这些Cookie
            cookie = new Cookie("Persistent-Cookie-" + i, "Cookie-Value-P" + i);
            cookie.setMaxAge(3600);
            response.addCookie(cookie);
        }
       
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        String title = "Setting Cookies";
        out.println("<html><head><title>设置Cookie</title></head>"
                + "<body>" + title + "<br>"
                + "There are six cookies associates with this page.<br>"
                + "to see them,visit the <A HREF=\"ShowCookies\">\n"
                + "<code>ShowCookies</code> servlet</a>"
                + "</body></html>");
    }

}