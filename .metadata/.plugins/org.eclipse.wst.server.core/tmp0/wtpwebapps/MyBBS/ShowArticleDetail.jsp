<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- ���������ݿ���� -->
<%

String str_id = request.getParameter("id");
int id = Integer.parseInt(str_id);

Class.forName("com.mysql.jdbc.Driver");
//���Ӵ�
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//�õ�һ��connection
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