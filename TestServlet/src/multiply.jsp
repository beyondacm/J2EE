<%@page contentType="text/html;charset=gb2312" %>
<html>
    <head>
        <title>Multiply</title>
    </head>
    <%--进行乘法计算的JSP--%>
    <body bgcolor="#FFFFFF">
        <center>
            <h1>
                <%
                    try{
                        float multiplicand = Float.parseFloat(request.getParameter("value1"));
                        float multiplicator = Float.parseFloat(request.getParameter("value2"));
                        double result = multiplicand*multiplicator;
                        out.println(multiplicand + "*" + multiplicator +" = " + result);
                    } catch(Exception e) {
                        out.println("不合法的乘数或被乘数");
                    }
                %>
            </h1>
        </center>
    </body>
</html>
