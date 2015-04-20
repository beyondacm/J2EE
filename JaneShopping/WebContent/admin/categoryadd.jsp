<%@ page import="com.gzp.shopping.*, java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>


<%@ include file = "_sessioncheck.jsp" %>

<%
String strPid = request.getParameter("pid");
int pid = 0;
if(strPid != null) {
	pid = Integer.parseInt(strPid);
}
out.println(pid);
//提交到自身首先拿到action
String action = request.getParameter("action");
//区分是提交过来的还是链接过来的 
if(action != null && action.equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	if(pid == 0) {
		Category.addTopCategory(name, descr);
	} else {
		//Category.addChildCategory(pid, name, descr);
		Category parent = Category.loadById(pid);
		Category child = new Category();
		child.setId(-1);
		child.setName(name);
		child.setDescr(descr);
		parent.addChild(child);
	}
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
	<center>添加根类别</center>
	<form action = "categoryadd.jsp" method = "post">
		<input type = "hidden" value = "add" name = "action">
		<input type = "hidden" name = "pid" value = "<%=pid %>" >
		<table>
			<tr>
				<td>类别名称</td>
				<td><input type = "text" name = "name"></td>
			</tr>
			
			<tr>
				<td>类别描述</td>
				<td><textarea name = "descr" rows = "8" cols = "40"></textarea></td>
			</tr>
			
			<tr>
				<td colspan=2><input type = "submit" value = "提交"></td>
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