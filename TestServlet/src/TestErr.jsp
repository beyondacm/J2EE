
<%@page errorPage = "ErrPage.jsp" %>
<%
String str = "123abc";
int i = Integer.parseInt(str);
out.println("str= " + str + ",i= " + i);
%>