<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import=" java.sql.*" %>

<%
request.setCharacterEncoding("gbk");
String action = request.getParameter("action");

if(action != null && action.equals("post")) {
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	//替换“\n”为<br>
	cont = cont.replaceAll("\n", "<br>");
	
	Class.forName("com.mysql.jdbc.Driver");
	//连接串
	String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
	//拿到一个connection
	Connection conn = DriverManager.getConnection(url);
	
	conn.setAutoCommit(false);
	
	String sql = "insert into article values(null, 0, ?, ?, ?, now(), 0)";
	PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	Statement stmt = conn.createStatement();
	
	//先插入-1 ,1,2,3对应的是第几个占位符
	pstmt.setInt(1, -1);
	pstmt.setString(2, title);
	pstmt.setString(3,cont);
	pstmt.executeUpdate();

	ResultSet rsKey = pstmt.getGeneratedKeys();
	rsKey.next();
	int key = rsKey.getInt(1);
	

	stmt.executeUpdate("update article set rootid =" + key + " where id =" + key);
	
	rsKey.close();
	conn.commit();
	conn.setAutoCommit(true);
	
//	stmt.close();
//	pstmt.close();
	conn.close();
	
	response.sendRedirect("ShowArticleTree.jsp");
}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>

<form action="Post.jsp" method="post">
	<input type="hidden" name = "action" value = "post">
	<table border="1">
		<tr>
			<td>
				<input type="text" name="title" size="80">
			</td>
		</tr>
		
		<tr>	
			<td>
				<textarea rows="12" cols="80" name="cont"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="提交">
			</td>
		</tr>
	</table>
</form>

</body>
</html>