<html>
    <head>
        <title>include test</title>
    </head>
   
    <body bgcolor="white">
        <font color="red">
            The current time and date are:<br>
        <!--�Ƚ�date.jsp�����ݰ�����������һ�����ת���������ִ��-->
            <%@include file="date.jsp" %><br>
        <!--�Ƚ�date.jsp����ת���������ִ�У��ٽ������������-->
            <jsp:include page="date.jsp" flush="true" />
        </font>
    </body>
</html>