<%@page contentType="text/html;charset=gb2312" %>
<html>
    <head>
        <title>Divide</title>
    </head>
    <%--进行除法计算的JSP--%>
    <body bgcolor="#FFFFFF">
        <center>
            <h1>
                <%
                    try{
                        float divident = Float.parseFloat(request.getParameter("v1"));
                        float divisor = Float.parseFloat(request.getParameter("v2"));
                        double result = divident/divisor;
                        %>
                        <%= result%>
                        <%
                    } catch(Exception e) {
                        out.println("不合法的除数或被除数");
                    }
                %>
            </h1>
        </center>
    </body>
</html>