<%@page contentType="text/html;charset=gb2312" %>
<%@page isErrorPage="true" %>
<!--本页面是个错误信息显示页-->
<html>
    <body text="red">
        错误信息：<%= exception.getMessage()%>
    </body>
</html>