<%@page language="java" %>
<%@page contentType="text/html;charset=gb2312" %>

<%
    // ��Compute.htmlҳ�������Ҫ���м�������������ù���
    String value1 = request.getParameter("value1");
    String value2 = request.getParameter("value2");
%>

<% if("division".equals(request.getParameter("compute"))) { %>
    <!--���г������㣬����������v1��v2�ȴ���divide.jsp�����Ǳ߱������У�Ȼ��ѽ���õ������ʾ����-->
        <jsp:include page="divide.jsp" flush="true">
            <jsp:param name="v1" value="<%=value1%>"/>
            <jsp:param name="v2" value="<%=value2%>"/>
        </jsp:include>
<%    } else { %>
        <!--ֱ�Ӱ�multiply.jsp�ù���������ҳ��һ�����ִ��-->
        <%@include file="multiply.jsp" %>
<%    } %>