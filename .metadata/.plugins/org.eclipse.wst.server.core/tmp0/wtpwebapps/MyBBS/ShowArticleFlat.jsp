<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import = "java.sql.*" %>

<%
int pageSize = 3;
//��ʾ�ڼ�ҳ, strPageNo�Ǵ������
String strPageNo = request.getParameter("pageNo");
int pageNo;
if(strPageNo == null || strPageNo.equals("")) {
	pageNo = 1;
} else {
	try {
		pageNo = Integer.parseInt(strPageNo.trim());
	} catch (NumberFormatException e) {
		pageNo = 1;
	}	
}
if(pageNo < 1) {
	pageNo = 1;
}


//������JDBC
Class.forName("com.mysql.jdbc.Driver");
//���Ӵ�
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//�õ�һ��connection
Connection conn = DriverManager.getConnection(url);

Statement stmtCount = conn.createStatement();
//??????????
ResultSet rsCount = stmtCount.executeQuery("select count(*) from article where pid = 0 ");
rsCount.next();
//??????????
int totalRecords = rsCount.getInt(1);
int totalPages = totalRecords % pageSize == 0? totalRecords/pageSize : totalRecords/pageSize+1;
if(pageNo > totalPages) {
	pageNo = totalPages;
}

int startPos = (pageNo-1)*pageSize;


//����һ��Statement
Statement stmt = conn.createStatement();
//�������ڵĵ�������
ResultSet rs = stmt.executeQuery("select * from article where pid = 0 order by pdate desc limit "+startPos+ "," +pageSize);






%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>

<a href="Post.jsp">��������</a>
<a href="Login.jsp">����Ա��½</a>
<table border = "1">

<%
while(rs.next()) {
%>
	<tr>
		<td> 
			<%= rs.getString("title") %>
		</td>
	</tr>
<%
}
rs.close();
stmt.close();
conn.close();
%>
</table>
<p>��<%= totalPages %>ҳ ��<%= pageNo %>ҳ</p>
<a href = "ShowArticleFlat.jsp?pageNo=<%=pageNo-1%>"> << </a>
<a href = "ShowArticleFlat.jsp?pageNo=<%=pageNo+1%>"> >> </a>

<!--action���ύ����� submit�Ǳ�ʾ��ʱ�ύ -->
<form name="form1" action="ShowArticleFlat.jsp">
	<select name="pageNo" onchange="document.form1.submit()">
		<%
			for(int i=1; i<=totalPages; i++) {
		%>
			<option value=<%=i%> <%=(pageNo == i)?"selected" : "" %>>��<%=i %>ҳ</option>
		<%
			}
		%>
	</select>
</form>
<!-- ����form���� ������е�input��ǩ�е�name��Ϊ�����ύ -->
<!-- action������������ύ���ĸ�ҳ�� -->
<!-- name �������ڶ��ύ����������ı������ݽ��б�ʶ�������ڿͻ���ͨ�� JavaScript ���ñ�������-->

<form action="ShowArticleFlat.jsp" name="form2">
	<input type="text" size="4" name="pageNo"/>
	<input type="submit" value="go">
</form>

</body>
</html>