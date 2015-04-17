<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
//防止直接通过index.jsp访问后台管理也页面
//login.jsp首先会通过session写入一个Attribute，然后主页去拿这个写入的Attribute
String admin = (String)session.getAttribute("admin");
if(admin == null || !admin.equals("true")) {
	response.sendRedirect("login.jsp");
}
%>