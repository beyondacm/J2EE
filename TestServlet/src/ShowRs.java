import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 在Servlet中直接连接数据库，并查询显示信息
 * 每个application都应该有自己的驱动包，放在各自项目的WEB-INF/lib/目录下
 * @author beyond_acm
 *
 */
public class ShowRs extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
       
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        out.println("<table border=1>");
        out.println("<tr><td>Content:</td></tr>");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/mydata?user=root&password=root");
            stmt = conn.createStatement();
            String sql = "select * from article";
            rs = stmt.executeQuery(sql);
            while(rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("title") + "</td>");
                out.println("</tr>");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
             if (rs != null) {
                 try {
                     rs.close();
                     rs = null;
                 } catch (SQLException sqlEx) {
                     sqlEx.printStackTrace();
                 }
             }
             if (stmt != null) {
                 try {
                     stmt.close();
                     stmt = null;
                 } catch (SQLException sqlEx) {
                     sqlEx.printStackTrace();
                 }
             }
             if (conn != null) {
                 try {
                     conn.close();
                     conn = null;
                 } catch (SQLException sqlEx) {
                     sqlEx.printStackTrace();
                 }
             }
        }
    }

}