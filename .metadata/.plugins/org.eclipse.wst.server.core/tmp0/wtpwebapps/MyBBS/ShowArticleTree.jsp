<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import = "java.sql.*" %>


<%
//去session里面拿东西
String admin = (String)session.getAttribute("admin");
if(admin != null && admin.equals("true")) {
	login = true;
}
%>

<%!
//功能：做一个展现
String str = "";
//login定义为成员变量
boolean login = false;
//从数据库里取所以参数要用conn传进来
private void tree(Connection conn,int id,int level) {
	
	Statement stmt = null;
	ResultSet rs = null;
	//定义前导字符串
	String preStr = "";
	for(int i=0; i<level; i++) {
		preStr += "----";
	}
	try {
		stmt = conn.createStatement();
		//要执行的sql语句
		String sql = "select * from article where pid = "+id;
		rs = stmt.executeQuery(sql);
		String strLogin = "";
		
		while(rs.next()) {
			if(login) {
				strLogin = "<td>" + "<a href='Delete.jsp?id=" +rs.getInt("id")+ "&pid=" + rs.getInt("pid") +"'>删除</a>"+ "</td>";
			}
			str += "<tr><td>" +rs.getInt("id")+ "</td><td>" +
		    preStr + "<a href='ShowArticleDetail.jsp?id=" +rs.getInt("id")+ "'>" + rs.getString("title") + "</a></td>" +
		     strLogin +
		    "<tr>";
			if(rs.getInt("isleaf") != 0) {
				tree(conn, rs.getInt("id"), level+1);
			}
			
		}
	} catch(SQLException e) {
		e.printStackTrace();	//打印在后台
	} finally {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if( stmt != null ) {
				stmt.close();
				stmt = null;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
%>




<%
//连接上JDBC
Class.forName("com.mysql.jdbc.Driver");
//连接串
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//拿到一个connection
Connection conn = DriverManager.getConnection(url);

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from article where pid = 0");

String strLogin = "";
while(rs.next()) {
	//主题贴
	if(login) {
		strLogin = "<td>" + "<a href='Delete.jsp?id=" +rs.getInt("id")+ "&pid=" + rs.getInt("pid") +"'>删除</a>"+ "</td>";
	}
	str += "<tr><td>" + rs.getInt("id") + "</td><td>" +
    	   "<a href='ShowArticleDetail.jsp?id=" +rs.getInt("id")+ "'>" + rs.getString("title") + "</a></td>" +
    	   strLogin +
    	   "<tr>";
    
    if(rs.getInt("id") != 0) {
    	tree(conn,rs.getInt("id"), 1);
    }
    
}
rs.close();
stmt.close();
conn.close();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>

<a href="Post.jsp">发表新帖</a>
<a href="Login.jsp">管理员登陆</a>
<table border = "1">
<!-- table自己写， tr, td写在str中 -->
<%= str %>
<%str = "";%>
</table>
</body>
</html>