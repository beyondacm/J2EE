<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- 连接上数据库操作 -->
<%

String str_id = request.getParameter("id");
int id = Integer.parseInt(str_id);

Class.forName("com.mysql.jdbc.Driver");
//连接串
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//拿到一个connection
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from article where id = " +id);

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>

<%
if(rs.next()) {
%>

	<table border="1">
		<tr>
			<td>ID</td>
			<td><%= rs.getInt("id") %></td>
		</tr>
		
		<tr>
			<td>Title</td>
			<td><%= rs.getString("title") %></td>
		</tr>
		
		<tr>
			<td>Content</td>
			<td><%= rs.getString("cont") %></td>
		</tr>
		
	</table>

<%
}
rs.close();
stmt.close();
conn.close();

%>



</body>
</html>