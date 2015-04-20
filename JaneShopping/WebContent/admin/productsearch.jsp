<%@ page import="com.gzp.shopping.*, java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>


<%@ include file = "_sessioncheck.jsp" %>

<%
List<Category> categories = Category.getCategories();
%>


<%
//提交到自身首先拿到action
String action = request.getParameter("action");
//区分是提交过来的还是链接过来的 
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
	<center>简单搜索</center>
	<form action = "productsearch.jsp" method = "post">
		<input type ="hidden" name = "action" value = "simplesearch">
		类别 :	<select>
			 　　	</select>
		关键字 ：	<input type = "text" name = "keyword">
			　	<input type = "submit" value = "搜索">
	</form>
	
	
	<center>复杂搜索</center>
	<form action = "productsearch.jsp" method = "post">
		<input type = "hidden" name = "action" value = "complexsearch">
		<table>
			<tr>
				<td>按照产品类别搜索</td>
				<td>
					<select name = "categoryid">
						<option value=”0">所有类别</option>
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
				<td>按照关键字搜索</td>
				<td><input type = "text" name = "keyword"></td>
			</tr>
			
			<tr>
				<td>按照市场价格搜索</td>
				<td>
				From :<input type = "text" name = "lownormalprice">
				To   :<input type = "text" name = "highnormalprice">
				</td>
			</tr>
			
			<tr>
				<td>按照会员价格搜索</td>
				<td>
				From :<input type = "text" name = “lowmemberprice">
				To   :<input type = "text" name = "highmemberprice">
				</td>
			</tr>

			
			<tr>
				<td>根据上架日期搜索</td>
				<td>
				From :<input type = "text" name = “startdate">
				To   :<input type = "text" name = "enddate">
				</td>
			</tr>
			
			<tr>
				<td colspan=2><input type = "submit" value = "搜索"></td>
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