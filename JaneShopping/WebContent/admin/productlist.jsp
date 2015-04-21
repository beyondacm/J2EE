<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.gzp.shopping.*"%>
<%@ page import = "java.util.*"%>


<%@ include file = "_sessioncheck.jsp" %>

<%!
private static final int PAGE_SIZE = 3;
%>

<%
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if(strPageNo != null) {
	pageNo = Integer.parseInt(strPageNo);
}
if(pageNo < 1) {
	pageNo = 1;
}
%>


<%
//get all products
//List<Product> products = ProductManager.getInstance().getProducts();
List<Product> products = new ArrayList<Product>();
int pageCount = ProductManager.getInstance().getProducts(products , pageNo, PAGE_SIZE);
out.println(pageCount);
if(pageNo > pageCount) {
	pageNo = pageCount;
}
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
			<td>ID</td>
			<td>��Ʒ��</td>
			<td>��Ʒ����</td>
			<td>�г���</td>
			<td>��Ա��</td>
			<td>ע��ʱ��</td>
			<td>���������</td>
		</tr>
		<%
		for(Iterator<Product> it = products.iterator(); it.hasNext(); ) {
			Product p = it.next();	
//			out.println(p.getId());
		%>
		<tr>
			<td><%= p.getId() %></td>
			<td><%= p.getName() %></td>
			<td><%= p.getDescr() %></td>
			<td><%= p.getNormPrice() %></td>
			<td><%= p.getMemberPrice() %></td>
			<td><%= p.getpDate() %></td>
			<td><%= p.getCategoryId() %></td>
			<td>
				<a href= "productdelete.jsp?id=<%=p.getId()%>"  target="detail">ɾ��</a>
				&nbsp;&nbsp;
				<a href= "productmodify.jsp?id=<%=p.getId()%>"  target="detail">�޸�</a>
			</td>
		
		</tr>
		
		<%
		}
		%>
	</table>
	
	<center>
		��<%= pageNo %>ҳ
		&nbsp;
		��<%= pageCount %>ҳ
		&nbsp;
		<a href = "productlist.jsp?pageno=<%=pageNo-1%>">��һҳ</a>
		&nbsp;
		<a href = "productlist.jsp?pageno=<%=pageNo+1%>">��һҳ</a>
		&nbsp;
		<a href = "productlist.jsp?pageno=<%=pageCount%>">���һҳ</a>
	</center>
	
</body>
</html>