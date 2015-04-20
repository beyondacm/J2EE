<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>

<%-- <%
//防止直接通过index.jsp访问后台管理也页面
//login.jsp首先会通过session写入一个Attribute，然后主页去哪这个写入的Attribute
String admin = (String)session.getAttribute("admin");
if(admin == null || !admin.equals("true")) {
	response.sendRedirect("login.jsp");
}
%> --%>

<%@ include file = "_sessioncheck.jsp" %>


<html>
<script language="javascript">
	state = 0 ;
	menuState = 0;
	mainState = 0;
</script>

<head>
<title>E_Shopping Manage</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
</head>

<frameset rows="29,*" frameborder="0" border="0" framespacing="0" cols="*">
  <frame name="top" scrolling="NO" noresize src="top.html">
  <frameset cols="20%,*" frameborder="0" border="0" framespacing="0" rows="*" scrolling="NO" name="mleft">
    <frame src="menu.html" frameborder=NO border="0" scrolling="NO" >
    <frameset rows="20,100%,*" name="content" frameborder="1" framespacing="1" cols="*">
      <frame src="title.html" frameborder=0 noresize scrolling="NO" name="mtitle">
      <frame src="" frameborder=0  name="main" marginwidth="0" marginheight="0" scrolling="YES">
      <frame src="" frameborder=0  name="detail">
    </frameset>
  </frameset>
</frameset>
<noframes>
</noframes>
</html>