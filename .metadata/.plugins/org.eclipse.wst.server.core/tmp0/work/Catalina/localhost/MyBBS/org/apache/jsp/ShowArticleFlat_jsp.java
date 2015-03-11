package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ShowArticleFlat_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=gbk");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

int pageSize = 3;
//显示第几页, strPageNo是传入参数
String strPageNo = request.getParameter("pageNo");
int pageNo;
if(strPageNo == null || strPageNo.equals("")) {
	pageNo = 1;
} else {
	try {
		pageNo = Integer.parseInt(strPageNo.trim());
	} catch (NumberFormatException e) {
		pageNo = 1;
	}	
}
if(pageNo < 1) {
	pageNo = 1;
}


//连接上JDBC
Class.forName("com.mysql.jdbc.Driver");
//连接串
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//拿到一个connection
Connection conn = DriverManager.getConnection(url);

Statement stmtCount = conn.createStatement();
//??????????
ResultSet rsCount = stmtCount.executeQuery("select count(*) from article where pid = 0 ");
rsCount.next();
//??????????
int totalRecords = rsCount.getInt(1);
int totalPages = totalRecords % pageSize == 0? totalRecords/pageSize : totalRecords/pageSize+1;
if(pageNo > totalPages) {
	pageNo = totalPages;
}

int startPos = (pageNo-1)*pageSize;


//创建一个Statement
Statement stmt = conn.createStatement();
//根据日期的倒叙排列
ResultSet rs = stmt.executeQuery("select * from article where pid = 0 order by pdate desc limit "+startPos+ "," +pageSize);







      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gbk\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<a href=\"Post.jsp\">发表新帖</a>\r\n");
      out.write("<a href=\"Login.jsp\">管理员登陆</a>\r\n");
      out.write("<table border = \"1\">\r\n");
      out.write("\r\n");

while(rs.next()) {

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td> \r\n");
      out.write("\t\t\t");
      out.print( rs.getString("title") );
      out.write("\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");

}
rs.close();
stmt.close();
conn.close();

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("<p>共");
      out.print( totalPages );
      out.write('页');
      out.write(' ');
      out.write('第');
      out.print( pageNo );
      out.write("页</p>\r\n");
      out.write("<a href = \"ShowArticleFlat.jsp?pageNo=");
      out.print(pageNo-1);
      out.write("\"> << </a>\r\n");
      out.write("<a href = \"ShowArticleFlat.jsp?pageNo=");
      out.print(pageNo+1);
      out.write("\"> >> </a>\r\n");
      out.write("\r\n");
      out.write("<form name=\"form1\" action=\"ShowArticleFlat.jsp\">\r\n");
      out.write("\t<select name=\"pageNo\" onchange=\"document.form1.submit()\">\r\n");
      out.write("\t\t");

			for(int i=1; i<=totalPages; i++) {
		
      out.write("\r\n");
      out.write("\t\t\t<option value=");
      out.print(i);
      out.write(' ');
      out.print((pageNo == i)?"selected" : "" );
      out.write('>');
      out.write('第');
      out.print(i );
      out.write("页</option>\r\n");
      out.write("\t\t");

			}
		
      out.write("\r\n");
      out.write("\t</select>\r\n");
      out.write("</form>\r\n");
      out.write("<!-- 对于form表单 会把其中的input标签中的name作为参数提交 -->\r\n");
      out.write("\r\n");
      out.write("<form action=\"ShowArticleFlat.jsp\" name=\"form2\">\r\n");
      out.write("\t<input type=\"text\" size=\"4\" name=\"page\"/>\r\n");
      out.write("\t<input type=\"submit\" value=\"go\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else log(t.getMessage(), t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
