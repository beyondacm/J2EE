<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
//��ֱֹ��ͨ��index.jsp���ʺ�̨����Ҳҳ��
//login.jsp���Ȼ�ͨ��sessionд��һ��Attribute��Ȼ����ҳȥ�����д���Attribute
String admin = (String)session.getAttribute("admin");
if(admin == null || !admin.equals("true")) {
	response.sendRedirect("login.jsp");
}
%>