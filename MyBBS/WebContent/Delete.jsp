<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import ="java.sql.*" %>



<%! 
//递归删除
private void del(Connection conn, int id) {
	Statement stmt = null;
	ResultSet rs = null;
	try {
		stmt = conn.createStatement();
		//要执行的sql语句
		String sql = "select * from article where pid = "+id;
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			del(conn, rs.getInt("id"));
		}
		stmt.executeUpdate("delete from article where id = "+id);
		
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
String admin = (String)session.getAttribute("admin");
if(admin == null || !admin.equals("true")) {
	out.println("You dont have the access level!!! Please login");
	return ;
}
%>

<%
//使网页显示中文
request.setCharacterEncoding("gbk");
//把id传进来
int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));
//连接上数据库
Class.forName("com.mysql.jdbc.Driver");
//连接串
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//拿到一个connection
Connection conn = DriverManager.getConnection(url);

conn.setAutoCommit(false);

del(conn, id);

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select count(*) from article where pid="+pid);
rs.next();
int count = rs.getInt(1);
rs.close();
stmt.close();

if(count<=0) {
	Statement stmtUpdate = conn.createStatement();
	stmtUpdate.executeUpdate("update article set isleaf = 0 where id =" +pid);
	stmtUpdate.close();
}

conn.commit();
conn.setAutoCommit(true);
conn.close();

response.sendRedirect("ShowArticleTree.jsp");
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<font color="red" size="7">
OK
</font>
</body>
</html>