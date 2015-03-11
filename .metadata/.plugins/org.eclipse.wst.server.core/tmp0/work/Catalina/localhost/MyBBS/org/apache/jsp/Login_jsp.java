package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write(" \r\n");

String action = request.getParameter("action");
if(action != null && action.equals("login")){
	String username = request.getParameter("uname");
	String password = request.getParameter("pwd");
	if(username == null || !username.equals("admin")) {
		
      out.write("\r\n");
      out.write("\t\t<font color = \"white\" size = 5>username not correct</font>\r\n");
      out.write("\t\t");
 
	}else if(password == null || !password.equals("admin")) {
		
      out.write("\r\n");
      out.write("\t\t<font color = \"white\" size = 5>password not correct</font>\r\n");
      out.write("\t\t");
 
	}else {
		//session的典型用法
		session.setAttribute("admin", "true");
		response.sendRedirect("ShowArticleTree.jsp");
	}
}

      out.write("    \r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head lang=\"en\">\r\n");
      out.write("    <meta charset=\"gbk\">\r\n");
      out.write("    <title>BBS LOGIN</title>\r\n");
      out.write("    <link href=\"http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("    body {\r\n");
      out.write("        padding-top: 40px;\r\n");
      out.write("        padding-bottom: 40px;\r\n");
      out.write("        background-color: #f5f5f5;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .form-signin h3{\r\n");
      out.write("        font-size: 23px;\r\n");
      out.write("        color: teal;\r\n");
      out.write("        font-family: fantasy;\r\n");
      out.write("        /*padding-right: 340px;*/\r\n");
      out.write("        /*margin-right: 350px;*/\r\n");
      out.write("        /*padding-left: 90px;*/\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .form-signin {\r\n");
      out.write("        max-width: 330px;\r\n");
      out.write("        padding: 15px;\r\n");
      out.write("        margin: 0 auto;\r\n");
      out.write("        max-width: 300px;\r\n");
      out.write("        padding: 19px 29px 29px;\r\n");
      out.write("        margin: 0 auto 20px;\r\n");
      out.write("        background-color: #fff;\r\n");
      out.write("        border: 1px solid #e5e5e5;\r\n");
      out.write("        -webkit-border-radius: 5px;\r\n");
      out.write("        -moz-border-radius: 5px;\r\n");
      out.write("        border-radius: 5px;\r\n");
      out.write("        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);\r\n");
      out.write("        -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);\r\n");
      out.write("        box-shadow: 0 1px 2px rgba(0,0,0,.05);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    .forget {\r\n");
      out.write("        max-width: 165px;\r\n");
      out.write("        padding: 10px;\r\n");
      out.write("        margin: 0 auto;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .reg {\r\n");
      out.write("        max-width: 165px;\r\n");
      out.write("        /*padding: 10px;*/\r\n");
      out.write("        margin: 0 auto;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    .form-signin .form-signin-heading,\r\n");
      out.write("    .form-signin .checkbox {\r\n");
      out.write("        margin-bottom: 10px;\r\n");
      out.write("    }\r\n");
      out.write("    .form-signin .checkbox {\r\n");
      out.write("        font-weight: normal;\r\n");
      out.write("    }\r\n");
      out.write("    .form-signin .form-control {\r\n");
      out.write("        position: relative;\r\n");
      out.write("        height: auto;\r\n");
      out.write("        -webkit-box-sizing: border-box;\r\n");
      out.write("        -moz-box-sizing: border-box;\r\n");
      out.write("        box-sizing: border-box;\r\n");
      out.write("        padding: 10px;\r\n");
      out.write("        font-size: 16px;\r\n");
      out.write("    }\r\n");
      out.write("    .form-signin .form-control:focus {\r\n");
      out.write("        z-index: 2;\r\n");
      out.write("    }\r\n");
      out.write("    .form-signin input[type=\"email\"] {\r\n");
      out.write("        margin-bottom: -1px;\r\n");
      out.write("        border-bottom-right-radius: 0;\r\n");
      out.write("        border-bottom-left-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("    .form-signin input[type=\"password\"] {\r\n");
      out.write("        margin-bottom: 10px;\r\n");
      out.write("        border-top-left-radius: 0;\r\n");
      out.write("        border-top-right-radius: 0;\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("\r\n");
      out.write("    <form class=\"form-signin\" action=\"Login.jsp\" method=\"post\">\r\n");
      out.write("    \t<input type=\"hidden\" name=\"action\" value=\"login\">\r\n");
      out.write("        <!--<div class=\"container\">-->\r\n");
      out.write("        <h3 class=\"form-signin-heading\">\r\n");
      out.write("            <!--<div class=\"container\">专家汇</div>-->\r\n");
      out.write("            BBS administror\r\n");
      out.write("        </h3>\r\n");
      out.write("        <!--</div>-->\r\n");
      out.write("        <label for=\"inputEmail\" class=\"sr-only\">Email address</label>\r\n");
      out.write("        <input id=\"inputEmail\" class=\"form-control\" placeholder=\"Username\" required=\"\" autofocus=\"\" type=\"text\" name = \"uname\">\r\n");
      out.write("        <label for=\"inputPassword\" class=\"sr-only\">Password</label>\r\n");
      out.write("        <input id=\"inputPassword\" class=\"form-control\" placeholder=\"Password\" required=\"\" type=\"password\" name = \"pwd\">\r\n");
      out.write("        <div class=\"checkbox\">\r\n");
      out.write("            <label>\r\n");
      out.write("                <input value=\"remember-me\" type=\"checkbox\"> Remember me\r\n");
      out.write("            </label>\r\n");
      out.write("        </div>\r\n");
      out.write("        <button class=\"btn btn-lg btn-primary btn-block\" type=\"submit\">登录</button>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </form>\r\n");
      out.write("\r\n");
      out.write("</div> <!-- /container -->\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
