<%@ page import="com.gzp.shopping.*, java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>


<%@ include file = "_sessioncheck.jsp" %>

<%
//�ύ�����������õ�action
String action = request.getParameter("action");
//�������ύ�����Ļ������ӹ����� 
if(action != null && action.equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
	double memberPrice = Double.parseDouble(request.getParameter("memberprice"));
	int categoryId = Integer.parseInt(request.getParameter("categoryid"));
	out.println(name +" " + descr+ " " + normalPrice+ " "+ memberPrice +" "+ categoryId);
	
	Product p = new Product();
	p.setId(-1);
	p.setName(name);
	p.setDescr(descr);
	p.setNormPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setpDate(new Timestamp(System.currentTimeMillis()));
	p.setCategoryId(categoryId);

	ProductManager.getInstance().addProduct(p);
	
	out.println("Congratulation! Added OK!");
}
%>


<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="GB18030">
    <title>Register</title>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<center>��Ӳ�Ʒ</center>
	<form action = "productadd.jsp" method = "post">
		<input type = "hidden" value = "add" name = "action">
		<table>
			<tr>
				<td>��Ʒ����</td>
				<td><input type = "text" name = "name"></td>
			</tr>
			
			<tr>
				<td>��Ʒ����</td>
				<td><textarea name = "descr" rows = "8" cols = "40"></textarea></td>
			</tr>
			
			<tr>
				<td>�г���</td>
				<td><input type = "text" name = "normalprice"></td>
			</tr>
			
			<tr>
				<td>��Ա��</td>
				<td><input type = "text" name = "memberprice"></td>
			</tr>
			
			<tr>
				<td>���ID</td>
				<td><input type = "text" name = "categoryid"></td>
			</tr>
			
			<tr>
				<td colspan=2><input type = "submit" value = "�ύ"></td>
			</tr>
		</table>
		
		
	</form>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>