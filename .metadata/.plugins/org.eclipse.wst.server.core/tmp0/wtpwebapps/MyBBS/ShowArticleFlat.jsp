<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import = "java.sql.*" %>

<%
int pageSize = 3;
//显示第几页, strPageNo是传入参数
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


//连接上JDBC
Class.forName("com.mysql.jdbc.Driver");
//连接串
String url = "jdbc:mysql://localhost/bbs?user=root&password=root";
//拿到一个connection
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


//创建一个Statement
Statement stmt = conn.createStatement();
//根据日期的倒叙排列
ResultSet rs = stmt.executeQuery("select * from article where pid = 0 order by pdate desc limit "+startPos+ "," +pageSize);






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
<p>共<%= totalPages %>页 第<%= pageNo %>页</p>
<a href = "ShowArticleFlat.jsp?pageNo=<%=pageNo-1%>"> << </a>
<a href = "ShowArticleFlat.jsp?pageNo=<%=pageNo+1%>"> >> </a>

<!--action是提交到哪里， submit是表示何时提交 -->
<form name="form1" action="ShowArticleFlat.jsp">
	<select name="pageNo" onchange="document.form1.submit()">
		<%
			for(int i=1; i<=totalPages; i++) {
		%>
			<option value=<%=i%> <%=(pageNo == i)?"selected" : "" %>>第<%=i %>页</option>
		<%
			}
		%>
	</select>
</form>
<!-- 对于form表单 会把其中的input标签中的name作为参数提交 -->
<!-- action代表会把数据提交到哪个页面 -->
<!-- name 属性用于对提交到服务器后的表单数据进行标识，或者在客户端通过 JavaScript 引用表单数据-->

<form action="ShowArticleFlat.jsp" name="form2">
	<input type="text" size="4" name="pageNo"/>
	<input type="submit" value="go">
</form>

</body>
</html>