<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
int rootId = Integer.parseInt(request.getParameter("rootid"));
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>

<script language="javascript">
<!-- //不会影响js的运行 
	 //去掉字符串头的空格
	function LTrim(str) {
		var i;
		for(i=0; i<str.length; i++) {
			if(str.charAt(i)!=" ") break;
		}
		str = str.substring(i,str,length);
		return str;
	}
	//去掉字符串尾部的空格
	function RTrim(str) {
		var i;
		for(i=str.length-1; i>=0; i--) {
			if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
		}
		str = str.substring(0, i+1);
		return str;
	}
	
	function Trim(str) {
		return LTrim(RTrim(str));
	}
	
	function check() { 
		if(Trim(document.reply.title.value) == "" ) {
			alert("please input the title");
			document.reply.title.focus();
			return false;
		}
		if(Trim(document.reply.cont.value) == "" ) {
			alert("please input the cont");
			document.reply.cont.focus();
			return false;
		}
		return true;
	}
	
-->	
</script>


</head>
<body>

<!-- 置了onsubmit,则首先会调用到onsubmit中的方法,onsubmit的值为true则继续提交,为false则不提交 -->
<form name="reply" action="ReplyOK.jsp" method="post">
	<input type="hidden" name="id" value="<%= id%>" > 
	<input type="hidden" name="rootid" value="<%= rootId%>" > 
	<table border="1">
		<tr>
			<td>
				<input type="text" name="title" size="80">
			</td>
		</tr>
		
		<tr>	
			<td>
				<textarea rows="12" cols="80" name="cont"></textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="提交">
			</td>
		</tr>
	</table>
</form>

</body>
</html>