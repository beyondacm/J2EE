

<html>
    <head>
        <title>JSP Expressions</title>
    </head>
    <!--表达式-->
    <body>
        <h2>JSP Expressions</h2>
       
    <UL>
        <!--获取当前本地时间-->
        <LI>Current Time:<%= new java.util.Date().toLocaleString() %>
        <LI>Your HostName:<%= request.getRemoteHost() %>
        <!--获取当前页面的SessionID-->
        <LI>Your Session Id:<%= session.getId() %>
        <LI>The <code>testParam</code> from parameter:<%= request.getParameter("testParam") %>
    </UL>
   
    </body>
</html>