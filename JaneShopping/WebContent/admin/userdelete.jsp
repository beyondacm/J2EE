<%@page import="com.gzp.shopping.UserManager"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>


<%@ include file = "_sessioncheck.jsp" %>

<%
//TODO you should validate the id 

int id = Integer.parseInt(request.getParameter("id"));
UserManager.deleteUser(id);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
删除成功！
<script language="javascript">
<!-- 刷新页面
	window.parent.main.document.location.reload();
-->
</script>

</body>
</html>