<html>
    <head>
        <title>include test</title>
    </head>
   
    <body bgcolor="white">
        <font color="red">
            The current time and date are:<br>
        <!--先将date.jsp的内容包含进来，再一起进行转换、编译和执行-->
            <%@include file="date.jsp" %><br>
        <!--先将date.jsp进行转换、编译和执行，再将结果包含进来-->
            <jsp:include page="date.jsp" flush="true" />
        </font>
    </body>
</html>