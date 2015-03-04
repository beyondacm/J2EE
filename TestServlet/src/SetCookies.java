import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ����Cookie���ͻ���
 * @author beyond_acm
 *
 */
public class SetCookies extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ��ͻ���д��Cookie����6��
        for(int i = 0; i < 3; i++) {
            // 3��û������ʱ���Cookie�����ڱ����ڼ����Ӵ���
            Cookie cookie = new Cookie("Session-Cookie-" + i, "Cookie-Value-S" + i);
            response.addCookie(cookie);
            // ����3��Cookie������ʱ�䣨3600�룬1Сʱ���������ı�����Ĵ���Ҳ���Է��ʵ���ЩCookie
            cookie = new Cookie("Persistent-Cookie-" + i, "Cookie-Value-P" + i);
            cookie.setMaxAge(3600);
            response.addCookie(cookie);
        }
       
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        String title = "Setting Cookies";
        out.println("<html><head><title>����Cookie</title></head>"
                + "<body>" + title + "<br>"
                + "There are six cookies associates with this page.<br>"
                + "to see them,visit the <A HREF=\"ShowCookies\">\n"
                + "<code>ShowCookies</code> servlet</a>"
                + "</body></html>");
    }

}