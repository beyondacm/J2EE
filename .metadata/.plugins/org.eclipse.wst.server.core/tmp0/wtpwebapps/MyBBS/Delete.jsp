<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import ="java.sql.*" %>

<%! 
//�ݹ�ɾ��
private void del(Connection conn, int id) {
	Statement stmt = null;
	ResultSet rs = null;
	try {
		stmt = conn.createStatement();
		//Ҫִ�е�sql���
		String sql = "select * from article where pid = "+id;
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			del(conn, rs.getInt("id"));
		}
		stmt.executeUpdate("delete from article where id = "+id);
		
	} catch(SQLException e) {
		e.printStackTrace();	//��ӡ�ں�̨
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
//ʹ��ҳ��ʾ����
request.setCharacterEncoding("gbk");
//��id������
int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));
//���������ݿ�
Class.forName("com.mysql.jdbc.Driver");
//���Ӵ�
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//�õ�һ��connection
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