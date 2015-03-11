package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Reply_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\r');
      out.write('\n');

int id = Integer.parseInt(request.getParameter("id"));
int rootId = Integer.parseInt(request.getParameter("rootid"));

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gbk\">\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("<!-- //不会影响js的运行 \r\n");
      out.write("\t //去掉字符串头的空格\r\n");
      out.write("\tfunction LTrim(str) {\r\n");
      out.write("\t\tvar i;\r\n");
      out.write("\t\tfor(i=0; i<str.length; i++) {\r\n");
      out.write("\t\t\tif(str.charAt(i)!=\" \") break;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tstr = str.substring(i,str,length);\r\n");
      out.write("\t\treturn str;\r\n");
      out.write("\t}\r\n");
      out.write("\t//去掉字符串尾部的空格\r\n");
      out.write("\tfunction RTrim(str) {\r\n");
      out.write("\t\tvar i;\r\n");
      out.write("\t\tfor(i=str.length-1; i>=0; i--) {\r\n");
      out.write("\t\t\tif(str.charAt(i)!=\" \"&&str.charAt(i)!=\" \") break;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tstr = str.substring(0, i+1);\r\n");
      out.write("\t\treturn str;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction Trim(str) {\r\n");
      out.write("\t\treturn LTrim(RTrim(str));\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction check() { \r\n");
      out.write("\t\tif(Trim(document.reply.title.value) == \"\" ) {\r\n");
      out.write("\t\t\talert(\"please input the title\");\r\n");
      out.write("\t\t\tdocument.reply.title.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(Trim(document.reply.cont.value) == \"\" ) {\r\n");
      out.write("\t\t\talert(\"please input the cont\");\r\n");
      out.write("\t\t\tdocument.reply.cont.focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("-->\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\r\n");
      out.write("<!-- 置了onsubmit,则首先会调用到onsubmit中的方法,onsubmit的值为true则继续提交,为false则不提交 -->\r\n");
      out.write("<form name=\"reply\" action=\"ReplyOK.jsp\" method=\"post\">\r\n");
      out.write("\t<input type=\"hidden\" name=\"id\" value=\"");
      out.print( id);
      out.write("\" > \r\n");
      out.write("\t<input type=\"hidden\" name=\"rootid\" value=\"");
      out.print( rootId);
      out.write("\" > \r\n");
      out.write("\t<table border=\"1\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"text\" name=\"title\" size=\"80\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<tr>\t\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<textarea rows=\"12\" cols=\"80\" name=\"cont\"></textarea>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"提交\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\n");
      out.write("</body>\n");
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
