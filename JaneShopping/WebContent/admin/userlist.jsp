<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.gzp.shopping.*"%>
<%@ page import = "java.util.*"%>

<%
//get all users
List<User> users = UserManager.getUsers();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
		<!-- 	<td>ID</td>
			<td>Username</td>
			<td>Phone</td>
			<td>Addr</td>
			<td>Rdate</td> -->
			<td>ID</td>
			<td>用户名</td>
			<td>电话</td>
			<td>地址</td>
			<td>注册时间</td>
		</tr>
		<%
		for(Iterator<User> it = users.iterator(); it.hasNext(); ) {
			User u = it.next();	
		%>
		<tr>
			<td><%= u.getId() %></td>
			<td><%= u.getUsername() %></td>
			<td><%= u.getPhone() %></td>
			<td><%= u.getAddr() %></td>
			<td><%= u.getRdate() %></td>
		</tr>
		
		<%
		}
		%>
	</table>
</body>
</html>