import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Session追踪
 * 如果浏览器支持Cookie，创建Session的时候会把SessionId保存在Cookie中
 * 否则必须自己编程使用URL重写的方式实现Session：response.encodeURL()
 * @author beyond_acm
 *
 */

public class ShowSession extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        String str = "Session Tracking Example";
        String heading;
       
        // 如果会话已经存在，则返回一个HttpSession；否则创建一个新的
        HttpSession session = request.getSession(true);
        // 从当前session中读取属性accessCount的值
        Integer accessCount = (Integer)session.getAttribute("accessCount");
        if(accessCount == null) {
            accessCount = new Integer(0);
            heading = "Welcome newUser";
        } else {
            heading = "Welcome Back";
            accessCount = new Integer(accessCount.intValue() + 1);
        }
        // 向当前session中插入键（key，属性）值（value）对
        // Binds an object to this session, using the name specified.
        session.setAttribute("accessCount", accessCount);
       
        out.println("<html><head><title>Session追踪</title></head>"
                + "<body>" + heading + "<br>"
                + "<h2>Information on Your Session</h2><br>"
                + "\n" + "<table border=1 align=center>\n"
                + "<TH>Info Type<TH>Value" + "<br>"
                + "<tr>\n" + "<td>ID</td>\n"
                + "<td>" + session.getId() +"</td></tr>\n"
                + "<tr>\n" + "<td>CreatTime</td>\n"
                + "<td>" + new Date(session.getCreationTime()) +"</td></tr>\n"
                + "<tr>\n" + "<td>LastAccessTime</td>\n"
                + "<td>" + new Date(session.getLastAccessedTime()) +"</td></tr>\n"
                + "<tr>\n" + "<td>Number of Access</td>\n"
                + "<td>" + accessCount +"</td></tr>\n"
                + "</body></html>");
    }

}