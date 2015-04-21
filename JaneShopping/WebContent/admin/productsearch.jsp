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
	
	int pageNo = 1;
	String strPageNo = request.getParameter("pageno");
//out.println(strPageNo);	
	if(strPageNo != null && !strPageNo.trim().equals("")) {
		pageNo = Integer.parseInt(strPageNo);
//out.println(pageNo);
	}
//out.println(pageNo);	
	String keyWord = request.getParameter("keyword");
//out.println(keyWord);	
	double lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
	double highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
//out.println(lowNormalPrice +" "+highNormalPrice);

	double lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
	double highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice"));
//out.println(lowMemberPrice + " " +highMemberPrice);
	
	
	int categoryId = Integer.parseInt(request.getParameter("categoryid"));
	int[] idArray;
	if(categoryId == 0) {
		idArray = null;
	} else {
		idArray = new int[1];
		idArray[0] = categoryId;
	}
//out.println(categoryId);	

	Timestamp startDate;
	String strStartDate = request.getParameter("startdate");
	if( strStartDate == null || strStartDate.trim().equals("")) {
		startDate = null;
	} else {
		startDate= Timestamp.valueOf(request.getParameter("startdate"));
	}
	
	Timestamp endDate;
	String strEndDate = request.getParameter("enddate");
	if( strEndDate == null || strEndDate.trim().equals("")) {
		endDate = null;
	} else {
		endDate= Timestamp.valueOf(request.getParameter("enddate"));
	}

//	int[] idArray = new int[1];
//s	idArray[0] = categoryId;
	
	List<Product> products = ProductManager.getInstance().findProducts(idArray, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, 3);

//	out.println(products.size());
	
	%>
	<center>�������</center>	
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
		<a href = "productsearch.jsp?action=<%= action%>&keyword=<%= keyWord%>&lownormalprice=<%=lowNormalPrice %>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice %>&highmemberprice=<%=highMemberPrice %>&startdate=<%=strStartDate %>&enddate=<%=strEndDate%>&categoryid=<%=categoryId %>&pageno=<%=pageNo+1%>">��һҳ</a>
	</center>
	
	
	<% 
}
%>


<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="GB18030">
    <title>Register</title>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	
	<script type = "text/javascript">
	
		function checkdata() {
			with(document.forms["complex"]) {
				if(lownormalprice.value == null || lownormalprice.value == "") {
					lownormalprice.value = -1;
				}
				if(highnormalprice.value == null || highnormalprice.value == "") {
					highnormalprice.value = -1;
				}
				if(lowmemberprice.value == null || lowmemberprice.value == "") {
					lowmemberprice.value = -1;
				}
				if(highmemberprice.value == null || highmemberprice.value == "") {
					highmemberprice.value = -1;
				}
			}
		}
	
	</script>
	
</head>
<body>
	<center>������</center>
	<form action = "productsearch.jsp" method = "post" name = "simple">
		<input type ="hidden" name = "action" value = "simplesearch">
		��� :	<select>
			 ����	</select>
		�ؼ��� ��	<input type = "text" name = "keyword">
			��	<input type = "submit" value = "����">
	</form>
	
	
	<center>��������</center>
	<form action = "productsearch.jsp" method = "post" onsubmit = "checkdata()" name = "complex">
		<input type = "hidden" name = "action" value = "complexsearch">
		<table>
			<tr>
				<td>���ղ�Ʒ�������</td>
				<td>
					<select name = "categoryid">
						<option value="0">�������</option>
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
				From :<input type = "text" name = "lowmemberprice">
				To   :<input type = "text" name = "highmemberprice">
				</td>
			</tr>

			
			<tr>
				<td>�����ϼ���������</td>
				<td>
				From :<input type = "text" name = "startdate">
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