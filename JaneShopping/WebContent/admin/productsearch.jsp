<%@ page import="com.gzp.shopping.*, java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>


<%@ include file = "_sessioncheck.jsp" %>

<%
List<Category> categories = Category.getCategories();
%>


<%
//�ύ�����������õ�action
String action = request.getParameter("action");
//�������ύ�����Ļ������ӹ����� 
if(action != null && action.equals("complexsearch")){
	String keyWord = request.getParameter("keyword");
	double lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
	double highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
	double lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
	double highMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
	
	int categoryId = Integer.parseInt(request.getParameter("categoryid"));
	Timestamp startDate = Timestamp.valueOf(request.getParameter("startdate"));
	Timestamp endDate = Timestamp.valueOf(request.getParameter("enddate"));

	int[] idArray = new int[1];
	idArray[0] = categoryId;
	List<Product> products = ProductManager.getInstance().findProducts(idArray, 
																   keyWord, 
											  					   lowNormalPrice, highNormalPrice, 
											  					   lowMemberPrice, highMemberPrice, 
											  					   startDate, endDate, 
											  					   1, 3);
	out.println(products.size());
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
	<center>������</center>
	<form action = "productsearch.jsp" method = "post">
		<input type ="hidden" name = "action" value = "simplesearch">
		��� :	<select>
			 ����	</select>
		�ؼ��� ��	<input type = "text" name = "keyword">
			��	<input type = "submit" value = "����">
	</form>
	
	
	<center>��������</center>
	<form action = "productsearch.jsp" method = "post">
		<input type = "hidden" name = "action" value = "complexsearch">
		<table>
			<tr>
				<td>���ղ�Ʒ�������</td>
				<td>
					<select name = "categoryid">
						<option value=��0">�������</option>
						<%
							for(Iterator<Category> it = categories.iterator(); it.hasNext();) {
								Category c = it.next();
								String preStr = "";
								for(int i=1; i<c.getGrade(); i++) {
									preStr += "--";
								}
							%>
							<option value = "<%= c.getId()%>"><%= preStr + c.getName()%></option>
							<% 	
							}
						%>						
					</select>
				</td>
			</tr>
			
			<tr>
				<td>���չؼ�������</td>
				<td><input type = "text" name = "keyword"></td>
			</tr>
			
			<tr>
				<td>�����г��۸�����</td>
				<td>
				From :<input type = "text" name = "lownormalprice">
				To   :<input type = "text" name = "highnormalprice">
				</td>
			</tr>
			
			<tr>
				<td>���ջ�Ա�۸�����</td>
				<td>
				From :<input type = "text" name = ��lowmemberprice">
				To   :<input type = "text" name = "highmemberprice">
				</td>
			</tr>

			
			<tr>
				<td>�����ϼ���������</td>
				<td>
				From :<input type = "text" name = ��startdate">
				To   :<input type = "text" name = "enddate">
				</td>
			</tr>
			
			<tr>
				<td colspan=2><input type = "submit" value = "����"></td>
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